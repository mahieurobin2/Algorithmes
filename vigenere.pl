#Récupération des arguments
my $sString=@ARGV[0];
my $sKey=@ARGV[1];

my @tMatrix = ();
my $iStartAlpha=65;
my $iEndAlpha=90;
my $iIndexColumn=0;
my $iIndexLine=0;


print "\n";
for (my $iCpt1=0;$iCpt1<=($iEndAlpha-$iStartAlpha);$iCpt1++)
{
	$iIndexColumn=0;
	for (my $iCpt2=($iStartAlpha+$iCpt1);$iCpt2<=$iEndAlpha;$iCpt2++)
	{
		$tMatrix[$iIndexColumn][$iIndexLine]=chr($iCpt2);
		print $tMatrix[$iIndexColumn][$iIndexLine];
		$iIndexColumn++;
	}
	for (my $iCpt3=$iStartAlpha;$iCpt3<($iStartAlpha+$iCpt1);$iCpt3++)
	{
		$tMatrix[$iIndexColumn][$iIndexLine]=chr($iCpt3);
		print $tMatrix[$iIndexColumn][$iIndexLine];
		$iIndexColumn++;
	}
	print "\n";
	$iIndexLine++;
	
}
	print "\n";
	print("-> Nombre de colonnes de la matrice : ".$iIndexColumn."\n");
	print("-> Nombre de ligne de la matrice : ".$iIndexLine."\n"); 
	print "\n";
	
sub Crypt
{
	my $sToCrypt = $_[0];
	my $sKey = $_[1];
	my $endSearchLine=1;
	my $endSearchColumn=1;
	my $iCpt1=0;
	my $iCpt2=0;
	my $iLine=0;
	my $iColumn=0;
	my $iLentghString;
	my $iLentghKey;
	my $iPosKey=0;
	my $sCryptedString;
	
	$iLentghString=length($sToCrypt);
	$iLentghKey=length($sKey);
	$sToCrypt=uc($sToCrypt);
	$sKey=uc($sKey);

	print("-> Chaine a crypter : ".$sToCrypt."\n");
	print("-> Longueur de la chaine a crypter : ".$iLentghString."\n");
	print("-> Cle : ".$sKey."\n");
	print("-> Longueur de la cle: ".$iLentghKey."\n");
	for(my $iCptString=0; $iCptString<$iLentghString;$iCptString++)
	{
		my $sCharToFind=substr($sToCrypt,$iCptString,1);

		while($endSearchColumn==1 && ($iCpt1<$iIndexColumn))
		{
			if($tMatrix[$iCpt1][0] eq $sCharToFind)
			{
				$iColumn=$iCpt1;
				$endSearchColumn=0;
					
					my $sCharKeyToFind=substr($sKey,$iPosKey,1);
					while($endSearchLine==1 && ($iCpt2<$iIndexLine))
					{
						if($tMatrix[0][$iCpt2] eq $sCharKeyToFind)
						{
							$iLine=$iCpt2;
							$endSearchLine=0;
						}
						$iCpt2++;
					}
				
				$iPosKey++;
				if ($iPosKey >= $iLentghKey)
				{
					$iPosKey=0;
				}

				$sCryptedString=$sCryptedString.$tMatrix[$iColumn][$iLine];
			}	
			$iCpt1++;
		}
	$iCpt1=0;
	$iCpt2=0;
	$endSearchLine=1;
	$endSearchColumn=1;
	}
	print("-> Chaine cryptee : ".$sCryptedString."\n");
	print "\n";
	return $sCryptedString;
}

sub DeCrypt
{
	my $sToDeCrypt = $_[0];
	my $sKey = $_[1];
	my $endSearchLine=1;
	my $endSearchColumn=1;
	my $iCpt1=0;
	my $iCpt2=0;
	my $iLine=0;
	my $iColumn=0;
	my $iLentghString;
	my $iLentghKey;
	my $iPosKey=0;
	my $sDeCryptedString;
	
	$iLentghString=length($sToDeCrypt);
	$iLentghKey=length($sKey);
	$sToCrypt=uc($sToCrypt);
	$sKey=uc($sKey);
	print("-> Chaine a decrypter : ".$sToDeCrypt."\n");
	print("-> Longueur de la chaine a decrypter : ".$iLentghString."\n");
	print("-> Cle : ".$sKey."\n");
	print("-> Longueur de la cle: ".$iLentghKey."\n");
	for(my $iCptString=0; $iCptString<$iLentghString;$iCptString++)
	{
		my $sCharKeyToFind=substr($sKey,$iPosKey,1);
		while($endSearchLine==1 && ($iCpt1<$iIndexLine))
		{
			if($tMatrix[0][$iCpt1] eq $sCharKeyToFind)
			{
				$iLine=$iCpt1;
				$endSearchLine=0;
					
					my $sCharToFind=substr($sToDeCrypt,$iCptString,1);
					while($endSearchColumn==1 && ($iCpt2<$iIndexColumn))
					{
						if($tMatrix[$iCpt2][$iCpt1] eq $sCharToFind)
						{
							$iColumn=$iCpt2;
							$endSearchColumn=0;
						}
						$iCpt2++;
					}
	
				$sDeCryptedString=$sDeCryptedString.$tMatrix[$iColumn][0] ;
				
			}	
			$iCpt1++;
		}
		$iPosKey++;
		if ($iPosKey >= $iLentghKey)
		{
			$iPosKey=0;
		}
		$iCpt1=0;
		$iCpt2=0;
		$endSearchLine=1;
		$endSearchColumn=1;
	}
	print("-> Chaine decryptee : ".$sDeCryptedString."\n");
}

DeCrypt(Crypt($sString,$sKey),$sKey);