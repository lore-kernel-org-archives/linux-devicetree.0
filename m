From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 2/4] dt-bindings: mailbox: provide imx-mailbox
 documentation
Date: Wed, 13 Jun 2018 13:58:41 +0200
Message-ID: <32ca8af2-7df7-4006-fbe1-f26077cbf455@pengutronix.de>
References: <20180601065821.28234-1-o.rempel@pengutronix.de>
 <20180601065821.28234-3-o.rempel@pengutronix.de>
 <CAA+hA=RNxUHro_92YdORw7FOHba=ZSv4q697npCNKwoMG-_HMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7340603204289217804=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAA+hA=RNxUHro_92YdORw7FOHba=ZSv4q697npCNKwoMG-_HMw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dong Aisheng <dongas86@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7340603204289217804==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xIWBH9obsaz5Nsz0wwFXtUBp4fLMreZ6J"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xIWBH9obsaz5Nsz0wwFXtUBp4fLMreZ6J
Content-Type: multipart/mixed; boundary="cPogkKUzPMxRC0RZKKqKp3IbcJFoIJf2v";
 protected-headers="v1"
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Dong Aisheng <dongas86@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Message-ID: <32ca8af2-7df7-4006-fbe1-f26077cbf455@pengutronix.de>
Subject: Re: [PATCH v1 2/4] dt-bindings: mailbox: provide imx-mailbox
 documentation
References: <20180601065821.28234-1-o.rempel@pengutronix.de>
 <20180601065821.28234-3-o.rempel@pengutronix.de>
 <CAA+hA=RNxUHro_92YdORw7FOHba=ZSv4q697npCNKwoMG-_HMw@mail.gmail.com>
In-Reply-To: <CAA+hA=RNxUHro_92YdORw7FOHba=ZSv4q697npCNKwoMG-_HMw@mail.gmail.com>

--cPogkKUzPMxRC0RZKKqKp3IbcJFoIJf2v
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 13.06.2018 13:05, Dong Aisheng wrote:
> Hi Oleksij,
>=20
> Some more comments besides Rob's:
>=20
> On Fri, Jun 1, 2018 at 2:58 PM, Oleksij Rempel <o.rempel@pengutronix.de=
> wrote:
>> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
>>  .../bindings/mailbox/imx-mailbox.txt          | 35 ++++++++++++++++++=
+
>>  1 file changed, 35 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mailbox/imx-mail=
box.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt=
 b/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt
>> new file mode 100644
>> index 000000000000..a45604b33039
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/imx-mailbox.txt
>> @@ -0,0 +1,35 @@
>> +i.MX Messaging Unit
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +The i.MX Messaging Unit (MU) contains two register sets: "A" and "B".=
 In most cases
>> +they are accessible from all Processor Units. On one hand, at least f=
or mailbox functionality,
>> +it makes no difference which application or processor is using which =
set of the MU. On
>> +other hand, the register sets for each of the MU parts are not identi=
cal.
>> +
>> +Required properties:
>> +- compatible : Shell be one of:
>> +                    "fsl,imx7s-mu-a" and "fsl,imx7s-mu-b" for i.MX7S =
or i.MX7D
>=20
> What's current requirement to distinguish Side A and B?
> I see current code, side A only does extra clear of xCR register but no=
ne for B.
> Is this a generic approach or something customized?

A and B side have more then one BIT difference, and there is no way to
see the difference by software. Current driver do not make use of it,
but in devicetree we describe HW not SW. If HW is different, it should
have different compatibles.

> BTW can we name it more generically?e.g. fsl,imx7s-mu.
> And using a property to indicate whether it's side A or B if really req=
uired.
>=20
> Furthermore, AFAIK MX7 MU is derived from MX6SX.
> Should we add and use fsl,imx6sx-mu instead?

As soon as some one will test this driver on imx6sx and confirm it
working, i'll add fsl,imx6sx-mu-a/b as well.

> e.g.
>  - compatible : Shell be one of:
>                        "fsl,imx6sx-mu" and "fsl,imx7s-mu".
>=20
> Regards
> Dong Aisheng
>=20
>> +- reg :        physical base address of the mailbox and length of
>> +               memory mapped region.
>> +- #mbox-cells: Common mailbox binding property to identify the number=

>> +               of cells required for the mailbox specifier. Should be=
 1.
>> +- interrupts : interrupt number. The interrupt specifier format
>> +               depends on the interrupt controller parent.
>> +- clocks     :  phandle to the input clock.
>> +
>> +Example:
>> +       mu0a: mu@30aa0000 {
>> +               compatible =3D "fsl,imx7s-mu-a";
>> +               reg =3D <0x30aa0000 0x28>;
>> +               interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
>> +               clocks =3D <&clks IMX7D_MU_ROOT_CLK>;
>> +               #mbox-cells =3D <1>;
>> +       };
>> +
>> +       mu0b: mu@30ab0000 {
>> +               compatible =3D "fsl,imx7s-mu-b";
>> +               reg =3D <0x30ab0000 0x28>;
>> +               interrupts =3D <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
>> +               clocks =3D <&clks IMX7D_MU_ROOT_CLK>;
>> +               #mbox-cells =3D <1>;
>> +       };
>> --
>> 2.17.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-clk" i=
n
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20


--cPogkKUzPMxRC0RZKKqKp3IbcJFoIJf2v--

--xIWBH9obsaz5Nsz0wwFXtUBp4fLMreZ6J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlshBvEACgkQdQOiSHVI
77SEfwf/em5HZ7s6wF5iMgbnr8eFO/rQZIMQkNTzwgYieysTXqZSj8gDLkaLNIWg
0JwER1s6r/hweawGxKyCXtNUayKlLjhsk7BNkIVU9ZKWM7warLF6KijXaD321M6y
5Vwoajj8c6gIvp0V7XhLDrk941pZmk0D0Q/vSO/iAsIz41/HsLyIGPZslu7IPARI
lYo9jni+/5ZKe9h+9I3sKwjzbuLQzlMXmzfJSO+tl6XguXJ3GPNkLrD7MEO9t/o7
ddxYI/2IQZh+0y+Q46N1v0b2S6KQFiGFLhMhtfj9jjC7iG/t7TEQOO3bZy33D5ml
QhP3XNPpIE3lrOprKmAKlKmtGEkseQ==
=EqbU
-----END PGP SIGNATURE-----

--xIWBH9obsaz5Nsz0wwFXtUBp4fLMreZ6J--


--===============7340603204289217804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7340603204289217804==--
