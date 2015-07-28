From: Michal Simek <monstr@monstr.eu>
Subject: Re: [RFCv2 2/3] dts: zynq: Add devicetree entry for Xilinx Zynq reset
 controller.
Date: Tue, 28 Jul 2015 07:42:11 +0200
Message-ID: <55B71633.8060608@monstr.eu>
References: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
 <1437783682-13632-3-git-send-email-moritz.fischer@ettus.com>
 <55B5D62D.4010407@monstr.eu>
 <CAAtXAHepDRbiiznHnT3dLLLWS_VH2a9BhnNgZzDECx__QceEeg@mail.gmail.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="cgsmT1LuciCO1qK8qnetbc9w1Nr4luQ9U"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHepDRbiiznHnT3dLLLWS_VH2a9BhnNgZzDECx__QceEeg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: p.zabel@pengutronix.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cgsmT1LuciCO1qK8qnetbc9w1Nr4luQ9U
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/28/2015 07:03 AM, Moritz Fischer wrote:
> Hi Michal,
>=20
> I agree we need to be careful with changing the bindings.
>=20
> On Sun, Jul 26, 2015 at 11:56 PM, Michal Simek <monstr@monstr.eu> wrote=
:
>> Hi Moritz,
>>
>> On 07/25/2015 02:21 AM, Moritz Fischer wrote:
>>> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
>>> ---
>>>  arch/arm/boot/dts/zynq-7000.dtsi            | 43 ++++++++++++-
>>
>> This patch is nice in general but every change in binding should be
>> discussed separately. There is also necessary to wire them up in the
>> driver to do action. That's why I think that will be the best just to
>> add the code to slcr and keep others untouched.
>=20
> Ok, just to clarify: You'd suggest to just add the rstc as child node
> to the slcr,
> and leave the other nodes untouched?

yes and then add it on case-by-case basis.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--cgsmT1LuciCO1qK8qnetbc9w1Nr4luQ9U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAlW3FjMACgkQykllyylKDCEQPQCeN5vW2E2Z24ap+cMj6Ur4JZw7
J9gAoIi/L4NjY8HLaVCJHCQMRq7t9gvg
=DNmv
-----END PGP SIGNATURE-----

--cgsmT1LuciCO1qK8qnetbc9w1Nr4luQ9U--
