From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 4/4] MAINTAINERS: Added imx DDR performonitor driver
 maintainer information
Date: Wed, 20 Feb 2019 06:28:09 +0000
Message-ID: <AM6PR04MB421565AFBF1ED068E02E1EBE807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
References: <1550253761-26841-1-git-send-email-Frank.Li@nxp.com>
 <1550253761-26841-4-git-send-email-Frank.Li@nxp.com>
 <20190215200141.pncrzp3oaoja2mnd@pengutronix.de>
 <CAHrpEqTexakw-OXjUt3nTdroPxv2YVjT-8VmZTUpDeF6e_dZMw@mail.gmail.com>
 <20190215214444.n2watl6k5ij6ptfs@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190215214444.n2watl6k5ij6ptfs@pengutronix.de>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Zhi Li <lznuaa@gmail.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "will.deacon@arm.com" <will.deacon@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> From: Uwe Kleine-K=F6nig [mailto:u.kleine-koenig@pengutronix.de]
> Sent: Saturday, February 16, 2019 5:45 AM
> =

> On Fri, Feb 15, 2019 at 03:13:00PM -0600, Zhi Li wrote:
> > On Fri, Feb 15, 2019 at 2:01 PM Uwe Kleine-K=F6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > On Fri, Feb 15, 2019 at 06:03:16PM +0000, Frank Li wrote:
> > > > Add DDR perf counter driver maintainer information
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > No change from v1 to v4
> > > >
> > > >  MAINTAINERS | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS index 6ba068e..687be0f
> > > > 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -6163,6 +6163,13 @@ L:     linux-i2c@vger.kernel.org
> > > >  S:   Maintained
> > > >  F:   drivers/i2c/busses/i2c-cpm.c
> > > >
> > > > +FREESCALE IMX DDR Performance Monitor DRIVER
> > > > +M:   Frank Li <Frank.li@nxp.com>
> > > > +L:   linux-arm-kernel@lists.infradead.org
> > > > +S:   Maintained
> > > > +F:   drivers/perf/fsl_imx8_ddr_perf.c
> > > > +F:   Documentation/devicetree/bindings/perf/fsl-imx-ddr.txt
> > > > +
> > >
> > > With da8b7f0fb02b ("MAINTAINERS: add all files matching "imx" and "mx=
s"
> > > to the IMX entry") that sits currently in next the "ARM/FREESCALE
> > > IMX / MXC ARM ARCHITECTURE" also matches for these two files.
> > >
> > > Is this good here or not?
> >
> > Yes! what's do you means?
> > Needn't these entry because da8b7f0fb02b?
> =

> It's just that we then will have two entries that will match. In a tree w=
here I
> have both, this series and da8b7f0fb02b I see:
> =

> 	$ scripts/get_maintainer.pl -f drivers/perf/fsl_imx8_ddr_perf.c
> 	Frank Li <Frank.li@nxp.com> (maintainer:FREESCALE IMX DDR
> Performance Monitor DRIVER)
> 	Will Deacon <will.deacon@arm.com> (maintainer:ARM PMU PROFILING
> AND DEBUGGING)
> 	Mark Rutland <mark.rutland@arm.com> (maintainer:ARM PMU
> PROFILING AND DEBUGGING)
> 	Shawn Guo <shawnguo@kernel.org> (maintainer:ARM/FREESCALE IMX /
> MXC ARM ARCHITECTURE)
> 	Sascha Hauer <s.hauer@pengutronix.de> (maintainer:ARM/FREESCALE
> IMX / MXC ARM ARCHITECTURE)
> 	Pengutronix Kernel Team <kernel@pengutronix.de>
> (reviewer:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
> 	Fabio Estevam <fabio.estevam@nxp.com> (reviewer:ARM/FREESCALE IMX
> / MXC ARM ARCHITECTURE)
> 	NXP Linux Team <linux-imx@nxp.com> (reviewer:ARM/FREESCALE IMX /
> MXC ARM ARCHITECTURE)
> 	linux-arm-kernel@lists.infradead.org (open list:FREESCALE IMX DDR
> Performance Monitor DRIVER)
> 	linux-kernel@vger.kernel.org (open list)
> =

> That's not necessarily a bad thing, but something I want people to make a=
ware
> of.
> =


IMHO it's better to have a more specific maintainer in the MAINTAINER file
for a specific module.

Don't reply on the general pattern to filter all IMX patches to send ARCH
Maintainers to help review.

Regards
Dong Aisheng

> Best regards
> Uwe
> =

> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig
> |
> Industrial Linux Solutions                 |
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.
> pengutronix.de%2F&amp;data=3D02%7C01%7Caisheng.dong%40nxp.com%7C88
> f88bc0bd7e4812d00008d6938ed1af%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C636858638948593375&amp;sdata=3DKwEG5SXUsLCgUU9pg8
> hnZ9JQq4%2FPGHA6EFhmF%2Bcmlo8%3D&amp;reserved=3D0  |
