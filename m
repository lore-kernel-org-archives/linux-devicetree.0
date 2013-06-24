From: Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v2 6/6] DT: Add documentation for gpio-xilinx
Date: Mon, 24 Jun 2013 13:54:36 +0200
Message-ID: <51C8337C.50600@monstr.eu>
References: <d96317c2681b5feb9e058efe0bd60ff101a0e0fa.1370262666.git.michal.simek@xilinx.com> <af7595252de09373f5591f21262e5ffa7c9e0dc2.1370262666.git.michal.simek@xilinx.com> <CACRpkdaaZKyqBeJHnL4Q5vc3ZVa_psF61McJ2wsFQJMTGvn-NA@mail.gmail.com> <51BEAAF5.6070003@monstr.eu> <CACRpkdZwbc2pU7m5rWTbnkGRoRY+jQX8x3=s8MmE46Vjj4S8JQ@mail.gmail.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2WTQPJHSDUJWLXTQNBTKN"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZwbc2pU7m5rWTbnkGRoRY+jQX8x3=s8MmE46Vjj4S8JQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2WTQPJHSDUJWLXTQNBTKN
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On 06/17/2013 11:13 AM, Linus Walleij wrote:
> On Mon, Jun 17, 2013 at 8:21 AM, Michal Simek <monstr@monstr.eu> wrote:=

>> On 06/17/2013 07:50 AM, Linus Walleij wrote:
>>> On Mon, Jun 3, 2013 at 2:31 PM, Michal Simek <michal.simek@xilinx.com=
> wrote:
>=20
>>>> +- xlnx,tri-default : if n-th bit is 1, GPIO-n is in tristate mode
>>>> +- xlnx,is-dual : if 1, controller also uses the second channel
>>>
>>> If is present, xlnx,is-dual;
>>>
>>>> +       xlnx,is-dual =3D <0x1>;
>>>
>>> xlnx,is-dual;
>>>
>>> I'm not giving up on this suggestion.
>>
>> I have commented this in the v1.
>=20
> I commented your comment on v1, and said I think you can support
> both bindings.

in 2/6 you have applied that dual support for this driver
and that's why please add this binding description to your repo
because it reflects actual binding for this driver.

As I wrote you I am working on interrupt support for this IP
and in connection to this I will introduce new binding
as we discussed in v1.

Thanks,
Michal



--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



------enig2WTQPJHSDUJWLXTQNBTKN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlHIM4EACgkQykllyylKDCG9pgCeNnuf3fK1MDBBtoS8D1DiVFxH
dAUAoJZwWk48Nop1RAV3ugnHBBHyS+AS
=2hLZ
-----END PGP SIGNATURE-----

------enig2WTQPJHSDUJWLXTQNBTKN--
