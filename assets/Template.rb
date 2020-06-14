
def appTemplate
"import React from 'react';

const App = () => {
  return (
    <>
    <h1>This is a simple react app!</h1>
    </>
  );
}

export default App" 
end

def indexTemplate(options={})
"import React from 'react';
import ReactDOM from 'react-dom'; 
#{
options[:noredux].nil? ?
""
:
"import { Provider } from 'react-redux';
import store from './store';\n"
}import App from './App';


ReactDOM.render(#{options[:noredux].nil? ? "<App />" : "<Provider store={store}><App /></Provider>" }, document.querySelector(\"#root\"));" 
end

def pageTemplate(name)
"import React from 'react';


const #{name} = () => {
  return (
    <>
      <h1>#{name} Page !</h1>
    </>  
  )
}
export default #{name}" 
end

def storeTemplate(allreducer={})
"import { createStore, combineReducers } from 'redux';
import { applyMiddleware } from 'redux';
import thunkMiddleware from 'redux-thunk';

const rootReducer = combineReducers(#{allreducer})

const store = createStore(rootReducer, applyMiddleware(thunkMiddleware) ); 
store.subscribe(() => console.log(store.getState()));

export default store;"
end