From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: change phy-mode to use
 rgmii-id
Date: Thu, 21 Mar 2019 08:42:41 +0000
Message-ID: <20190321084240.fveqkhfrbtg7qr4q@fsr-ub1664-175>
References: <20190320120604.7D99B3FBE9@swsrvapps-01.diasemi.com>
 <CAOMZO5AHzQJzz3vd5MzYgSSxzPjU9xan1dFh9473BXeiRCOzzg@mail.gmail.com>
 <VI1PR10MB2352C3A55BE8FABAF3B02681FE410@VI1PR10MB2352.EURPRD10.PROD.OUTLOOK.COM>
 <CAOMZO5By8=j7gZRAdf2-h-5ak-Qo34rqwDL4+HA_97cMXTAnEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5By8=j7gZRAdf2-h-5ak-Qo34rqwDL4+HA_97cMXTAnEQ@mail.gmail.com>
Content-Language: en-US
Content-ID: <29C97F4A7987A341B98417C2C544B3F5@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Steve Twiss <stwiss.opensource@diasemi.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, DEVICETREE <devicetree@vger.kernel.org>, LINUX-ARM-KERNEL <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, Support Opensource <Support.Opensource@diasemi.com>
List-Id: devicetree@vger.kernel.org

On 19-03-20 14:04:42, Fabio Estevam wrote:
> Hi Steve,
>=20
> [Adding Andrew]
>=20
> On Wed, Mar 20, 2019 at 1:03 PM Steve Twiss
> <stwiss.opensource@diasemi.com> wrote:
> >
> > Hi Fabio,
> >
> > On 20 March 2019 12:17, Fabio Estevam wrote:
> > > Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: change phy-mode to us=
e rgmii-id
> > >
> > > Hi Steve,
> > >
> > > On Wed, Mar 20, 2019 at 9:06 AM Steve Twiss
> > > <stwiss.opensource@diasemi.com> wrote:
> > > >
> > > > The PHY used on the Freescale i.MX6Q/DL SABRE boards is qualified a=
s
> > > > 'rgmii' instead of 'rgmii-id'. Meaning the RX and TX delays that we=
re
> > >
> > > This patch declares it as 'rgmii-id', which contradicts the commit lo=
g.
> >
> > The PHY used on the Freescale i.MX6Q/DL SABRE boards is qualified as
> > 'rgmii' instead of 'rgmii-id'.
> >
> > Can that be read two ways?
> > I meant the phy-mode is currently qualified as 'rgmii' instead of what =
it
> > should be: 'rgmii-id'.
>=20
> Thanks for the clarification.
>=20
> >
> > [...]
> >
> > > > This patch fixes the network problems seen on the Freescale i.MX6Q/=
DL
> > >
> > > Please provide a Fixes tag. It would be good to know if this fix need=
s
> > > to be applied to older kernels.
> >
> > I didn't put a Fixes tag in because I find this patch fixes v5.1-rc1 (w=
hich I see as broken).
> > But the patch is not needed in v5.0 because I see that as working.
> > So didn't see the need for a Cc: stable.
>=20
> It seems we have other boards that need to be fixed and we can not
> have an old dtb with functional Ethernet with a new kernel.
>=20
> Does anyone know if this issue is AR8031 specific?

I can confirm the same fix is works on imx6sx too.

>=20
> Thanks=
