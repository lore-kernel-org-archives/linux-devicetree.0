From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V3] ARM: dts: imx6sll-evk: make pfuze100 sw4 always on
Date: Mon, 2 Jul 2018 00:55:41 +0000
Message-ID: <AM3PR04MB1315C55572F4A1B1581CC5B4F5430@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1530062725-25779-1-git-send-email-Anson.Huang@nxp.com>
 <20180701133243.GU4348@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180701133243.GU4348@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi, Shawn

Anson Huang
Best Regards!


> -----Original Message-----
> From: Shawn Guo [mailto:shawnguo@kernel.org]
> Sent: Sunday, July 1, 2018 9:33 PM
> To: Anson Huang <anson.huang@nxp.com>
> Cc: s.hauer@pengutronix.de; kernel@pengutronix.de; Fabio Estevam
> <fabio.estevam@nxp.com>; robh+dt@kernel.org; mark.rutland@arm.com;
> devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH V3] ARM: dts: imx6sll-evk: make pfuze100 sw4 always o=
n
>=20
> On Wed, Jun 27, 2018 at 09:25:25AM +0800, Anson Huang wrote:
> > On i.MX6SLL EVK board, PFuze100's SW4 is supplying LPDDR3, it needs to
> > be always on. This patch fixes Linux kernel boot up hang caused by
> > commit 5fe156f1cab4
> > ("regulator: pfuze100: add enable/disable for switch"), because SW4 is
> > turned off unexpectedly:
> >
> > [    1.693613] cfg80211: failed to load regulatory.db
> > [    1.700063] SW4: disabling
> > [    1.703973] SWBST: disabling
> >
> > Fixes: 5fe156f1cab4 ("regulator: pfuze100: add enable/disable for
> > switch")
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
>=20
> Just want to understand if we agree to break the existing DTB with v4.18
> kernel?
>=20
> Shawn

The kernel patch will break with existing DTB on some i.MX platforms, how
to handle this case, just revert the kernel regulator patch?=20

Anson.

>=20
> > ---
> > changes since V2:
> > 	improve the way of referencing commit, and add fix tag.
> >  arch/arm/boot/dts/imx6sll-evk.dts | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/boot/dts/imx6sll-evk.dts
> > b/arch/arm/boot/dts/imx6sll-evk.dts
> > index 4684ac4..2217c40 100644
> > --- a/arch/arm/boot/dts/imx6sll-evk.dts
> > +++ b/arch/arm/boot/dts/imx6sll-evk.dts
> > @@ -142,6 +142,7 @@
> >  			sw4_reg: sw4 {
> >  				regulator-min-microvolt =3D <800000>;
> >  				regulator-max-microvolt =3D <3300000>;
> > +				regulator-always-on;
> >  			};
> >
> >  			swbst_reg: swbst {
> > --
> > 2.7.4
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flis=
t
> >
> s.infradead.org%2Fmailman%2Flistinfo%2Flinux-arm-kernel&data=3D02%7C01%7
> >
> CAnson.Huang%40nxp.com%7C614a104918884539521a08d5df572851%7C686
> ea1d3bc
> >
> 2b4c6fa92cd99c5c301635%7C0%7C0%7C636660487794141749&sdata=3D1%2B
> EKM%2Bnx
> > egyDGLc%2FHt9cbh%2BARlMSsoJP%2FbD6HlxwVFs%3D&reserved=3D0
