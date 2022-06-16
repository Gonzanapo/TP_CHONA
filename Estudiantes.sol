//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante{

string private _name;
string private _lastName;
string private _curso;
address private _docente;
string [] private _promedio;
mapping (string => uint) private _notasMateria;
string[] materias;

constructor(string memory name_, string memory lastName_, string memory curso_ )
    {
        _name = name_;
        _lastName = lastName_;
        _curso = curso_;

        _docente = msg.sender;
    }

function lastName() public view returns (string memory){
        return _lastName;
    }

function name_lastName() public view returns (string memory){
       return append(_name, " ", _lastName);
    }
    function append(string memory a, string memory b, string memory c) internal pure returns (string memory) {

    return string(abi.encodePacked(a, b, c));

}

function curso() public view returns (string memory){
        return _curso;
    }

function set_nota_materia(uint nota, string memory materia) public{

    require(_docente == msg.sender, "Solo el docente puede editar");
    require(nota >=0 && nota <= 100, "La nota no puede ser menor a 0 o mayor a 100");
    _notasMateria[materia] = nota;
    materias.push(materia);
}
function get_materia(string memory materia) public view returns(uint){
        return _notasMateria[materia];
    }

function aprobo(string memory materia) public view returns (bool){
    if(_notasMateria[materia] >= 60)
    {   
        return true;
    }
    else{
        return false;
    }
}
    function promedio() public view returns(uint)
    {
        uint promedio_;
        uint largoArray = _promedio.length;
        uint _notaPromedio = 0; 
        for(uint i = 0; i < largoArray; i++)
        {
            _notaPromedio += _notasMateria[_promedio[i]];
        }
        promedio_ = _notaPromedio / largoArray;

         
        return promedio_; 
    }
    
}