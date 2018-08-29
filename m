From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH 2/2] ARM: dts: imx6sll: add gpio clocks
Date: Wed, 29 Aug 2018 01:12:04 +0000
Message-ID: <DB3PR0402MB39163FACD5AE40052010B390F5090@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1529649154-5724-1-git-send-email-Anson.Huang@nxp.com>
 <1529649154-5724-2-git-send-email-Anson.Huang@nxp.com>
 <20180712025203.GQ6959@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712025203.GQ6959@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "A.s. Dong" <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi, Shawn
	I saw v4.19-rc1 is created, can you please apply this patch?

Anson Huang
Best Regards!


> -----Original Message-----
> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Thursday, July 12, 2018 10:52 AM
> To: Anson Huang <anson.huang@nxp.com>
> Cc: s.hauer@pengutronix.de; kernel@pengutronix.de; Fabio Estevam
> <fabio.estevam@nxp.com>; robh+dt@kernel.org; mark.rutland@arm.com;
> mturquette@baylibre.com; sboyd@kernel.org; A.s. Dong
> <aisheng.dong@nxp.com>; Jacky Bai <ping.bai@nxp.com>; dl-linux-imx
> <linux-imx@nxp.com>; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> linux-clk@vger.kernel.org
> Subject: Re: [PATCH 2/2] ARM: dts: imx6sll: add gpio clocks
>=20
> On Fri, Jun 22, 2018 at 02:32:34PM +0800, Anson Huang wrote:
> > i.MX6SLL has GPIO clock gates in CCM CCGR, add clock property for GPIO
> > driver to make sure all GPIO banks work as expected.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>=20
> I tried to create a topic branch for this patch with dependent clk branch=
 merged
> in.  But it turns out to be difficult and not worth the effort, because t=
oo many
> imx6sll patches need to be moved out from imx/dt branch, and some imx6sll
> changes are mixed with other SoCs.
> Let's apply this in next cycle.  Ping me when 4.19-rc1 is available.
>=20
> Shawn
