#Récupération des arguments
my $sParam=@ARGV[0];
my %tAlphabet = ();

#Alphabet d'origine
$tAlphabet{'A'}='B';
$tAlphabet{'B'}='C';
$tAlphabet{'C'}='D';
$tAlphabet{'D'}='E';
$tAlphabet{'E'}='F';
$tAlphabet{'F'}='G';
$tAlphabet{'G'}='H';
$tAlphabet{'H'}='I';
$tAlphabet{'I'}='J';
$tAlphabet{'J'}='K';
$tAlphabet{'K'}='L';
$tAlphabet{'L'}='M';
$tAlphabet{'M'}='N';
$tAlphabet{'N'}='O';
$tAlphabet{'O'}='P';
$tAlphabet{'P'}='Q';
$tAlphabet{'Q'}='R';
$tAlphabet{'R'}='S';
$tAlphabet{'S'}='T';
$tAlphabet{'T'}='U';
$tAlphabet{'U'}='V';
$tAlphabet{'V'}='W';
$tAlphabet{'W'}='X';
$tAlphabet{'X'}='Y';
$tAlphabet{'Y'}='Z';
$tAlphabet{'Z'}='A';

#Alphabet d'origine
$tAlphabetDeCrypt{'B'}='A';
$tAlphabetDeCrypt{'C'}='B';
$tAlphabetDeCrypt{'D'}='C';
$tAlphabetDeCrypt{'E'}='D';
$tAlphabetDeCrypt{'F'}='E';
$tAlphabetDeCrypt{'G'}='F';
$tAlphabetDeCrypt{'H'}='G';
$tAlphabetDeCrypt{'I'}='H';
$tAlphabetDeCrypt{'J'}='I';
$tAlphabetDeCrypt{'K'}='J';
$tAlphabetDeCrypt{'L'}='K';
$tAlphabetDeCrypt{'M'}='L';
$tAlphabetDeCrypt{'N'}='M';
$tAlphabetDeCrypt{'O'}='N';
$tAlphabetDeCrypt{'P'}='O';
$tAlphabetDeCrypt{'Q'}='P';
$tAlphabetDeCrypt{'R'}='Q';
$tAlphabetDeCrypt{'S'}='R';
$tAlphabetDeCrypt{'T'}='S';
$tAlphabetDeCrypt{'U'}='T';
$tAlphabetDeCrypt{'V'}='U';
$tAlphabetDeCrypt{'W'}='V';
$tAlphabetDeCrypt{'X'}='W';
$tAlphabetDeCrypt{'Y'}='X';
$tAlphabetDeCrypt{'Z'}='Y';
$tAlphabetDeCrypt{'A'}='Z';



sub Crypt
{
	my $sToCrypt = $_[0];
	my $sCrypted;
	my $iLenght;;
	$iLentgh=length($sToCrypt);
	$sToCrypt=uc($sToCrypt);
	print("-> Chaine a crypter : ".$sToCrypt."\n");
	for(my $iCpt=0; $iCpt<$iLentgh;$iCpt++)
	{
		$sCrypted=$sCrypted.$tAlphabet{substr($sToCrypt,$iCpt,1)};
	}

	print("-> Chaine cryptee : ".$sCrypted."\n");
	return $sCrypted;
}

sub DeCrypt
{
	my $sToDeCrypt = $_[0];
	my $sDeCrypted;
	my $iLenght;
	$iLentgh=length($sToDeCrypt);
	$sToCrypt=uc($sToCrypt);
	print("-> Chaine a decrypter : ".$sToDeCrypt."\n");
	for(my $iCpt=0; $iCpt<$iLentgh;$iCpt++)
	{
		$sDeCrypted=$sDeCrypted.$tAlphabetDeCrypt{substr($sToDeCrypt,$iCpt,1)};
	}

	print("-> Chaine decryptee : ".$sDeCrypted."\n");
}

DeCrypt(Crypt($sParam));