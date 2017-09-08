From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v5 1/2] ARM: dts: bcm283x: Use stdout-path instead of console bootarg
Date: Fri, 08 Sep 2017 10:53:46 -0700
Message-ID: <874lsdnkk5.fsf@anholt.net>
References: <1504125721-4760-1-git-send-email-loic.poulain@gmail.com> <19D1F3B6-A05B-425B-A06D-AD44EEE39BFE@holtmann.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19D1F3B6-A05B-425B-A06D-AD44EEE39BFE-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org> writes:

> Hi,
>
>> Add the serial port config to "chosen/stdout-path".
>> Create serial0/1 aliases referring to uart0 ant uart1 paths.
>> Remove unneeded earlyprintk.
>>=20
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> arch/arm/boot/dts/bcm283x.dtsi | 7 ++++++-
>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>=20
>> v2: dt-bindings as separate patch
>>     rebase on upcoming pi3 dts changes
>> v3: changes in bcm serdev drivers:
>>     name refactoring and additional comments
>>     Add generic host_set_baudrate method
>>     Use agnostic device_property_read
>> v4: changes in doc and dts:
>>     Add additional params to broadcom bt dt-bindings
>>     Set the max baudrate to 2000000 instead of 921600
>>     use chosen/stdout-path instead of console=3D
>>     remove useless earlyprintk
>>     same changes in bcm283x.dtsi
>> v5: remove 1/4 dt-bindings and 4/4 hci_bcm serdev support
>>     1/4 and 4/4 merged in bluetooth-next tree
>>=20
>> diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.=
dtsi
>> index 431dcfc..013431e 100644
>> --- a/arch/arm/boot/dts/bcm283x.dtsi
>> +++ b/arch/arm/boot/dts/bcm283x.dtsi
>> @@ -20,8 +20,13 @@
>> 	#address-cells =3D <1>;
>> 	#size-cells =3D <1>;
>>=20
>> +	aliases {
>> +		serial0 =3D &uart0;
>> +		serial1 =3D &uart1;
>> +	};
>> +
>> 	chosen {
>> -		bootargs =3D "earlyprintk console=3DttyAMA0";
>> +		stdout-path =3D "serial0:115200n8";
>> 	};
>
> is anybody taking care of these two patches. I do not see them in Linus=
=E2=80=99 tree yet?

arm-soc process unfortunately doesn't accept PRs between rc5 or 6 and
the next rc1, so they're still in my TODO pile for when we get -rc1
again.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlmy2SoACgkQtdYpNtH8
nuiFSA/+J2oLIi83wGmQwi6JWUPO5PBkxGtTAUjcmNgb/sswGaanYni7GB7qpcti
PQKo9WBjYWelRix4bLi8ScxOQvAxEWZU/qDiS9EpB/9IJ5U3/lXbxnA3QjGX9v9C
CJ6F+PAhe+bOLXTiTkTeEbh7uMfwDu1wLhfLainJ433ppzGai3c0F03iYUfnhPjZ
z5SZqZggiHZcsSOyPgcWw01dMqKW21a0W6O8vNJqBhfMZSr5pJTibnkcvqc++Pfr
iM3xrY8nucuS6ffZHe/NdbX2gmkEF42GajQtSxEN/nLS/fzRLE8XI5hixK0soaL9
BuggRDs0dnIleFc5bM6UgR7UCzMYZDct0yPb+HB5gSldcbqO/ar45R/7SZkDohoC
vjIF3JEcb5BSDd6TClktniaJPNy0Tvpoi8DELzBl+jkm8q4rturZ2QRTKcr8bs7v
4FofEKHvFquF24Vc86ltw6ZFJFy2cCHmVQDjMmWXyaB3KYb3i/f/Engp25ZF2RwA
ZCeUni/WvDdcX93YVjZndLlHmMfoj5U3n3349PYCu2pXsscU9amdkbU+htXQoNCY
T+deIkEu2aCDP/0yK+rreMEmbWZlpNNcoBX928+Z1tQI4E5C6p8KbGlcyBk+LyOa
Yxez6cxumgSCLsLLSZN0ePyvqY2HEraGZAom0eSDbSy4lFieaFk=
=RsVt
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
