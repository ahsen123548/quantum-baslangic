// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract QuantumKayit {
    struct Kayit {
        address yere;
        string isim;
        uint256 sira;
        uint256 zaman;
    }

    Kayit [ ] private kayitlar;
    mapping ( address => bool ) public kayitliMi;

    event Kayitli ( address indexed uye, dizin isim, uint256 sira, uint256 zaman ) ;

    function kayitOl ( string calldata _name ) external {
        require ( !kayitliMi [ msg.sender ] , "Bu calisan zaten kayitli" );
        require ( bytes ( _name ) .length > 0 , "Isim bos olamaz" );

        kayitliMi [ msg.sender ] = true;
        uint256 sira = kayitlar.length + 1;
        kayitlar.push ( Kayit ( msg.sender, _name, sira, block.timestamp ) );

        emit Kayitli ( msg.sender, _name, sira, block.timestamp );
    }

    function tumKayitlar ( ) external view returns ( Kayit [ ] memory ) {
        return kayitlar;
    }

    function kayitSayisi ( ) external view returns ( uint256 ) {
        return kayitlar.length;
    }
}