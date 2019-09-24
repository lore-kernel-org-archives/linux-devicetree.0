From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Subject: Re: Re: [PATCH 5/5] arm64: dts: imx8mq: add DCSS node
Date: Tue, 24 Sep 2019 07:29:46 +0000
Message-ID: <20190924072945.GB25260@fsr-ub1664-121>
References: <1569248002-2485-1-git-send-email-laurentiu.palcu@nxp.com>
 <1569248002-2485-6-git-send-email-laurentiu.palcu@nxp.com>
 <CAOMZO5AOVfBpz2Azh65iT_W3CBZUxf9KnqA=kdow7XWd4j--Qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5AOVfBpz2Azh65iT_W3CBZUxf9KnqA=kdow7XWd4j--Qg@mail.gmail.com>
Content-Language: en-US
Content-ID: <A2FB6DA96285D2448B3353184E71BB06@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>, Lucas Stach <l.stach@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On Mon, Sep 23, 2019 at 01:12:42PM -0300, Fabio Estevam wrote:
> Hi Laurentiu,
>=20
> On Mon, Sep 23, 2019 at 11:14 AM Laurentiu Palcu
> <laurentiu.palcu@nxp.com> wrote:
>=20
> > +
> > +                       dcss: dcss@0x32e00000 {
>=20
> Node names should be generic, so:
>=20
> dcss: display-controller@32e00000

fair enough, done.

>=20
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               compatible =3D "nxp,imx8mq-dcss";
> > +                               reg =3D <0x32e00000 0x2D000>, <0x32e2f0=
00 0x1000>;
>=20
> 0x2d000 for consistency.

will change this as well.

Thanks,
laurentiu


>=20
> > +                               interrupts =3D <6>, <8>, <9>;
>=20
> The interrupts are passed in the <GIC_SPI xxx IRQ_TYPE_LEVEL_HIGH> format=
.=
