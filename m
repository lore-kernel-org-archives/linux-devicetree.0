From: Felipe Balbi <balbi@kernel.org>
Subject: RE: [PATCH v3 2/3] USB3/DWC3: Add property "snps, incr-burst-type-adjustment" for INCR burst type
Date: Tue, 17 Jan 2017 12:45:19 +0200
Message-ID: <8737gikls0.fsf@linux.intel.com>
References: <1482139554-13618-1-git-send-email-jerry.huang@nxp.com> <1482139554-13618-2-git-send-email-jerry.huang@nxp.com> <20161222184514.hfd4g7ifrz5cv627@rob-hp-laptop> <DB5PR0401MB1813E210B2ADE1C9493F7768FE950@DB5PR0401MB1813.eurprd04.prod.outlook.com> <CAL_JsqJuifiSQAt-6FgtYYSukAnjzOLuTGEsO-Spn5LxkU-iwQ@mail.gmail.com> <DB5PR0401MB18132BB4CDE32EEA8F479E55FE7D0@DB5PR0401MB1813.eurprd04.prod.outlook.com> <87tw8zo0c0.fsf@linux.intel.com> <DB5PR0401MB1813548526D3C8D34B9CCE52FE7C0@DB5PR0401MB1813.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB5PR0401MB1813548526D3C8D34B9CCE52FE7C0@DB5PR0401MB1813.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerry Huang <jerry.huang@nxp.com>, Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Jerry Huang <jerry.huang@nxp.com> writes:

<snip>

>> >> So, I think we still need two vaue to specify INCRBrstEna and INCRx
>> >> burst type.
>> > Hi, Balbi,
>> > It seems there is no feedback for my comment, so these patches can be
>> accepted?
>>=20
>> probably not, we need to really understand what information we need so it
>> can be described properly. The last thing we want is unnecessary DT
>> properties.
>>=20
>> It seems to me that we can extrapolate INCRBrstEna based on which burst
>> modes are enabled. If only 0 is passed, then that bit should be 1, if 0 =
and any
>> other size is passed, then that bit should be 0, no?
> Hi, Balbi,
> Below is the definition for this property,
> snps,incr-burst-type-adjustment =3D <x>, <y>
> x: Undefined Length INCR Burst Type Enable (INCRBrstEna)
>     0 - INCRX burst mode (not enable INCRBrstEna)
>     1 - INCR (undefined length) burst mode (enable INCRBrstEna)
> y: the burst length
>
> 1> if x =3D 0: means INCRBrstEna not enabled, set bit0 to zero (or clear
> it) , we select one of
> INCR1/INCR4/INCR8/INCR16/INCR32/INCR64/INCR128/INCR256 (pass this
> value through "y")to set the fix burst length controller supported.
>
> For example:
>
> 	snps,incr-burst-type-adjustment =3D <0>, <16>
>
> driver will set bit0 to zero and set bit3 to 1 (INCR16 Burst Type
> Enabled), controller will use INCR16 (with 16 bytes) to transfer data.
>
> 2> if x =3D 1: means INCRBrstEna enabled, we select one of
> INCR4/INCR8/INCR16/INCR32/INCR64/INCR128/INCR256 (pass this value
> through "y") to set the burst length, and controller will use any
> length less than or equal to that we selected.
>
> For example:
>
> 	snps,incr-burst-type-adjustment =3D <1>, <32>
>
> driver will set bit0 to 1 and set bit4 to 1 (INCR32 Burst Type
> Enabled), controller will use any burst length less than (such as 4,
> 8, 16 byte) or equal to 32 byte to transfer data.
>
> Therefore, I think this two fileds are needed. Do you think about it?

no, I don't think two values are needed, because first value can be
extrapolated from the second. Something like this:

	snps,incr-burst-type-adjustment =3D <4>, <8>, <16>, <32>;

This is basically telling us that we can support anything in this
list. So INCRBrstEna should be set to 1.

If DT, on the other hand, says:

	snps,incr-burst-type-adjustment =3D <32>;

this means that we can only support INCR32, so INCRBrstEna should be
cleared to 0.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlh99b8ACgkQzL64meEa
mQbBEBAAnGbGm43VDI7b07rqybQ8edO5owspbuuUxj9nVsSwtioOsIiX4K9iYbgH
CZpXbBHX41VC9Jn5ykqQGt+Q3myRT4f75fEpiVE+/oASBTG/QDtO8a1r1NUGrDMR
5dSejGlwaOYTAICHJ4r6m6hyjO+U4PGVy4p8ykwM0WbXAk2AyACsnDEz+qF7mUA8
pQjU3Ihpp/Z6FoY5qbqGxpGcrut9FNbd3+Q+V4wTIPEKJHI5wAm1wPWH7GFuAPG8
dTv8Do3Ym2TPeNmgHR4PVXPBvRVGN95v9MuIchDB86EN8+K3LkYPIUrs30+FlWtU
nhgKyplQT6w7YOwZcYME1Kd1hkA8DRUSK8HhSTC5D8w49BuYscWT7WNTxg3qLk1U
hN0GHdKqfOCzAvYYRhKphKhdLqgy6D3CPqW7aqIEIJ5Jj8TutZGs5B2+v9IroAFm
PhehXToP9ZF3p9T0/uhyhYSEt7FnYiI1Vw+MQeSYjKRTm38HhhsnroQfS6iSpv2Y
DJFh7O/ziaaXTXXAaBzfR1XHdQOEZz9kxCtk5CSqHN0JJzpEbmounstHHVG+kLKB
sZjHY+IoaqERHagMdNgwcqQ9gW8eKprtaYLO8mis0JC2S4Q2xlpYKL/xDfIPx84r
U8/ozPZ49DWPuO4OPENMuWcOUmpVVIC4T1pfkRpodsXfuxTREWY=
=oIh5
-----END PGP SIGNATURE-----
--=-=-=--
