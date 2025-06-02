import React, { useEffect, useState } from 'react';
import {
  View, Text, FlatList, StyleSheet,
  TextInput, TouchableOpacity
} from 'react-native';
import api from '../services/api';

export default function UsuariosScreen() {
  const [usuarios, setUsuarios] = useState([]);
  const [mostrarFormulario, setMostrarFormulario] = useState(false);
  const [nome, setNome] = useState('');
  const [email, setEmail] = useState('');
  const [senha, setSenha] = useState('');
  const [mensagem, setMensagem] = useState('');
  const [erro, setErro] = useState('');

  const buscarUsuarios = async () => {
    try {
      const response = await api.get('/usuarios');
      setUsuarios(response.data);
    } catch (error) {
      console.error('Erro ao buscar usuários:', error);
    }
  };

  const cadastrarUsuario = async () => {
    if (!nome || !email || !senha) {
      setErro('Preencha todos os campos');
      setMensagem('');
      return;
    }

    try {
      await api.post('/usuarios', { nome, email, senha });
      setMensagem('Usuário cadastrado com sucesso!');
      setErro('');
      setNome('');
      setEmail('');
      setSenha('');
      buscarUsuarios();
      setMostrarFormulario(false);
    } catch (error) {
      setErro('Erro ao cadastrar usuário');
      setMensagem('');
    }
  };

  useEffect(() => {
    buscarUsuarios();
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Lista de Usuários</Text>

      <TouchableOpacity
        style={styles.botaoNovo}
        onPress={() => setMostrarFormulario(!mostrarFormulario)}
      >
        <Text style={styles.textoBotao}>{mostrarFormulario ? 'Cancelar' : 'Novo Cadastro'}</Text>
      </TouchableOpacity>

      {mostrarFormulario && (
        <View style={styles.formulario}>
          {mensagem ? <Text style={styles.sucesso}>{mensagem}</Text> : null}
          {erro ? <Text style={styles.erro}>{erro}</Text> : null}

          <TextInput
            style={styles.input}
            placeholder="Nome"
            value={nome}
            onChangeText={setNome}
          />
          <TextInput
            style={styles.input}
            placeholder="E-mail"
            keyboardType="email-address"
            value={email}
            onChangeText={setEmail}
          />
          <TextInput
            style={styles.input}
            placeholder="Senha"
            secureTextEntry
            value={senha}
            onChangeText={setSenha}
          />
          <TouchableOpacity style={styles.botaoCadastrar} onPress={cadastrarUsuario}>
            <Text style={styles.textoBotao}>Cadastrar</Text>
          </TouchableOpacity>
        </View>
      )}

      <FlatList
        data={usuarios}
        keyExtractor={(item) => item.id_usuario.toString()}
        renderItem={({ item }) => (
          <View style={styles.usuarioCard}>
            <Text style={styles.nome}>ID: {item.id_usuario}</Text>
            <Text style={styles.email}>{item.email}</Text>
          </View>
        )}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 20,
    marginTop: 40,
  },
  title: {
    fontSize: 22,
    fontWeight: 'bold',
    marginBottom: 12,
  },
  botaoNovo: {
    backgroundColor: '#007bff',
    padding: 10,
    borderRadius: 6,
    alignItems: 'center',
    marginBottom: 10,
  },
  textoBotao: {
    color: '#fff',
    fontWeight: 'bold',
  },
  formulario: {
    backgroundColor: '#f5f5f5',
    padding: 10,
    borderRadius: 8,
    marginBottom: 20,
  },
  input: {
    borderWidth: 1,
    borderColor: '#999',
    borderRadius: 6,
    padding: 10,
    marginBottom: 10,
  },
  botaoCadastrar: {
    backgroundColor: '#28a745',
    padding: 10,
    borderRadius: 6,
    alignItems: 'center',
  },
  sucesso: {
    backgroundColor: '#d4edda',
    color: '#155724',
    padding: 8,
    borderRadius: 5,
    marginBottom: 10,
  },
  erro: {
    backgroundColor: '#f8d7da',
    color: '#721c24',
    padding: 8,
    borderRadius: 5,
    marginBottom: 10,
  },
  usuarioCard: {
    backgroundColor: '#eaeaea',
    padding: 12,
    marginBottom: 10,
    borderRadius: 8,
  },
  nome: {
    fontSize: 16,
    fontWeight: 'bold',
  },
  email: {
    fontSize: 14,
    color: '#555',
  },
});
