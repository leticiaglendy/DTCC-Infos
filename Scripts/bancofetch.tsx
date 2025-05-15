//exemplo de conexão com banco/fetch

import React, { useEffect, useState } from 'react';
import { View, Text, FlatList, TextInput, Button, StyleSheet, Alert } from 'react-native';

export default function TarefasScreen() {
  const [tarefas, setTarefas] = useState([]);
  const [novaTarefa, setNovaTarefa] = useState('');

  const API_URL = "http://192.168.X.X:3000/api/tarefas"; // Substitua pelo IP da sua máquina

  useEffect(() => {
    carregarTarefas();
  }, []);

  const carregarTarefas = async () => {
    try {
      const response = await fetch(API_URL);
      const data = await response.json();
      setTarefas(data);
    } catch (err) {
      console.error("Erro ao carregar tarefas:", err);
    }
  };

  const adicionarTarefa = async () => {
    if (!novaTarefa.trim()) {
      Alert.alert("Erro", "Digite um título para a tarefa.");
      return;
    }

    try {
      const response = await fetch(API_URL, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ titulo: novaTarefa, concluida: false })
      });

      if (response.ok) {
        setNovaTarefa('');
        carregarTarefas(); // recarrega a lista
      } else {
        Alert.alert("Erro", "Não foi possível adicionar a tarefa.");
      }
    } catch (err) {
      console.error("Erro ao adicionar tarefa:", err);
    }
  };

  return (
    <View style={styles.container}>
      <Text style={styles.titulo}>Minhas Tarefas</Text>

      <View style={styles.form}>
        <TextInput
          style={styles.input}
          placeholder="Digite a nova tarefa"
          value={novaTarefa}
          onChangeText={setNovaTarefa}
        />
        <Button title="Adicionar" onPress={adicionarTarefa} />
      </View>

      <FlatList
        data={tarefas}
        keyExtractor={item => item.id.toString()}
        renderItem={({ item }) => (
          <Text style={styles.item}>
            {item.titulo} - {item.concluida ? '✔️' : '❌'}
          </Text>
        )}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: { padding: 20, flex: 1 },
  titulo: { fontSize: 20, marginBottom: 10 },
  form: { flexDirection: 'row', gap: 10, marginBottom: 20 },
  input: { flex: 1, borderWidth: 1, padding: 10, borderRadius: 5 },
  item: { fontSize: 16, marginVertical: 5 },
});
