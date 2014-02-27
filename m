From: Florian Vaussard <florian.vaussard@epfl.ch>
Subject: Re: [PATCH] checkpatch: fix spurious vendor compatible warnings
Date: Thu, 27 Feb 2014 21:24:35 +0100
Message-ID: <530F9F03.40803@epfl.ch>
References: <1393531019-25134-1-git-send-email-florian.vaussard@epfl.ch> <1393531808.24588.119.camel@joe-AO722>
Reply-To: florian.vaussard@epfl.ch
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393531808.24588.119.camel@joe-AO722>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 02/27/2014 09:10 PM, Joe Perches wrote:
> On Thu, 2014-02-27 at 20:56 +0100, Florian Vaussard wrote:
>> With a compatible string like
>>
>> compatible =3D "foo";
>>
>> checkpatch will currently try to find "foo" in  vendor-prefixes.txt,
>> which is wrong since the vendor prefix is empty in this specific cas=
e.
>>
>> Skip the vendor test if the compatible is not like
>>
>> compatible =3D "vendor,something";
>>
>> Signed-off-by: Florian Vaussard <florian.vaussard@epfl.ch>
>> ---
>>  scripts/checkpatch.pl | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 464dcef..35ec185 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -2058,6 +2058,7 @@ sub process {
>>  				my $vendor =3D $compat;
>>  				my $vendor_path =3D $dt_path . "vendor-prefixes.txt";
>>  				next if (! -f $vendor_path);
>> +				next if not $vendor =3D~ /^[a-zA-Z0-9]+\,.*/;
>>  				$vendor =3D~ s/^([a-zA-Z0-9]+)\,.*/$1/;
>>  				`grep -Eq "$vendor" $vendor_path`;
>>  				if ( $? >> 8 ) {
>=20
> Some vendor names have dashes.
> I don't know if underscores are allowed.
>=20
> $ grep -rP --include=3D*.[ch] -oh "compatible\s*=3D\s*\"[^,]+,\w" * |=
 \
>   sed -r -e 's/\s//g' -e 's/,.$//' | sort | uniq -c | grep "[_-]"
>       1 compatible=3D"active-semi
>       8 compatible=3D"asahi-kasei
>=20

Good catch. In ePAPR v1.1, I could not find any strict requirement. It
is just saying:

The recommended format is =93manufacturer,model=94, where manufacturer =
is a
string describing the name of the manufacturer (such as a stock ticker
symbol), and model specifies the model number.

If I am not mistaking, the stock ticker symbol will not contain exotic
characters, but it is not always available. So we should probably add
the '-. I am not sure for the '_'.

=46lorian
