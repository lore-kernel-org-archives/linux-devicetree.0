From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V2 1/4] ARM: imx: add i.mx6ulz msl support
Date: Fri, 28 Sep 2018 09:07:28 +0000
Message-ID: <DB3PR0402MB3916515873BCC9673AE9E05AF5EC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1537337088-28819-1-git-send-email-Anson.Huang@nxp.com>
 <1537337088-28819-2-git-send-email-Anson.Huang@nxp.com>
 <20180928084452.GH26692@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180928084452.GH26692@dragon>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi, Shawn

Anson Huang
Best Regards!


> -----Original Message-----
> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Friday, September 28, 2018 4:45 PM
> To: Anson Huang <anson.huang@nxp.com>
> Cc: robh+dt@kernel.org; mark.rutland@arm.com; s.hauer@pengutronix.de;
> kernel@pengutronix.de; Fabio Estevam <fabio.estevam@nxp.com>;
> linux@armlinux.org.uk; mturquette@baylibre.com; sboyd@kernel.org; Jacky
> Bai <ping.bai@nxp.com>; A.s. Dong <aisheng.dong@nxp.com>;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-clk@vger.kernel.org; dl-linux=
-imx
> <linux-imx@nxp.com>
> Subject: Re: [PATCH V2 1/4] ARM: imx: add i.mx6ulz msl support
>=20
> On Wed, Sep 19, 2018 at 02:04:45PM +0800, Anson Huang wrote:
> > The i.MX 6ULZ processor is a high-performance, ultra cost-efficient
> > consumer Linux processor featuring an advanced implementation of a
> > single Arm(r) Cortex(r)-A7 core, which operates at speeds up to 900 MHz=
.
> >
> > This patch adds basic MSL support for i.MX6ULZ, the i.MX6ULZ has same
> > soc_id as i.MX6ULL, and SRC_SBMR2 bit[6] is to differentiate i.MX6ULZ
> > from i.MX6ULL, 1'b1 means i.MX6ULZ and 1'b0 means i.MX6ULL.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > ---
> >  arch/arm/mach-imx/anatop.c      | 20 ++++++++++++++++++++
> >  arch/arm/mach-imx/cpu.c         |  3 +++
> >  arch/arm/mach-imx/mach-imx6ul.c |  1 +
> >  arch/arm/mach-imx/mxc.h         |  7 +++++++
> >  arch/arm/mach-imx/pm-imx6.c     |  4 ++--
> >  5 files changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/mach-imx/anatop.c b/arch/arm/mach-imx/anatop.c
> > index 61f3d94..45d618a 100644
> > --- a/arch/arm/mach-imx/anatop.c
> > +++ b/arch/arm/mach-imx/anatop.c
> > @@ -31,6 +31,8 @@
> >  #define ANADIG_DIGPROG_IMX6SL	0x280
> >  #define ANADIG_DIGPROG_IMX7D	0x800
> >
> > +#define SRC_SBMR2		0x1c
> > +
> >  #define BM_ANADIG_REG_2P5_ENABLE_WEAK_LINREG	0x40000
> >  #define BM_ANADIG_REG_2P5_ENABLE_PULLDOWN	0x8
> >  #define BM_ANADIG_REG_CORE_FET_ODRIVE		0x20000000
> > @@ -148,6 +150,24 @@ void __init imx_init_revision_from_anatop(void)
> >  		major_part =3D (digprog >> 8) & 0xf;
> >  		minor_part =3D digprog & 0xf;
> >  		revision =3D ((major_part + 1) << 4) | minor_part;
> > +
> > +		if ((digprog >> 16) =3D=3D MXC_CPU_IMX6ULL) {
> > +			void __iomem *src_base;
> > +			u32 sbmr2;
> > +
> > +			np =3D of_find_compatible_node(NULL, NULL,
> > +						     "fsl,imx6ul-src");
> > +			src_base =3D of_iomap(np, 0);
> > +			WARN_ON(!src_base);
> > +			sbmr2 =3D readl_relaxed(src_base + SRC_SBMR2);
> > +			iounmap(src_base);
> > +
> > +			/* src_sbmr2 bit 6 is to identify if it is i.MX6ULZ */
> > +			if (sbmr2 & (1 << 6)) {
> > +				digprog &=3D ~(0xff << 16);
> > +				digprog |=3D (MXC_CPU_IMX6ULZ << 16);
> > +			}
> > +		}
> >  	}
> >
> >  	mxc_set_cpu_type(digprog >> 16 & 0xff); diff --git
> > a/arch/arm/mach-imx/cpu.c b/arch/arm/mach-imx/cpu.c index
> > c6b1bf9..c73593e 100644
> > --- a/arch/arm/mach-imx/cpu.c
> > +++ b/arch/arm/mach-imx/cpu.c
> > @@ -136,6 +136,9 @@ struct device * __init imx_soc_device_init(void)
> >  	case MXC_CPU_IMX6ULL:
> >  		soc_id =3D "i.MX6ULL";
> >  		break;
> > +	case MXC_CPU_IMX6ULZ:
> > +		soc_id =3D "i.MX6ULZ";
> > +		break;
> >  	case MXC_CPU_IMX6SLL:
> >  		soc_id =3D "i.MX6SLL";
> >  		break;
> > diff --git a/arch/arm/mach-imx/mach-imx6ul.c
> > b/arch/arm/mach-imx/mach-imx6ul.c index 6cb8a22..4ffe3c8 100644
> > --- a/arch/arm/mach-imx/mach-imx6ul.c
> > +++ b/arch/arm/mach-imx/mach-imx6ul.c
> > @@ -90,6 +90,7 @@ static void __init imx6ul_init_late(void)  static
> > const char * const imx6ul_dt_compat[] __initconst =3D {
> >  	"fsl,imx6ul",
> >  	"fsl,imx6ull",
> > +	"fsl,imx6ulz",
>=20
> Can we have "fsl,imx6ull" on the DT compatible, so that we can save the
> changes on kernel side, like this and the clock driver update (patch #2)?
>=20
>   compatible =3D "fsl,imx6ull", "fsl,imx6ulz";
>=20
> I'm not sure if there is any problem with this approach.  But you can thi=
nk
> about it.
>=20
> Shawn
=20
Using this approach will save the changes in clk-imx6ul.c and mach-imx6ul.c=
,
but other changes will be still needed, since it is defined as a new SoC ot=
her
than a i.MX6ULL with different fuse settings. I can do the changes you sugg=
ested
to save those 2 files changes if you prefer this way, but current implement=
ation
should also make sense if think about it from a new SoC perspective? What d=
o
you prefer?

Thanks.

Anson.

>=20
> >  	NULL,
> >  };
> >
> > diff --git a/arch/arm/mach-imx/mxc.h b/arch/arm/mach-imx/mxc.h index
> > 026e2ca..b130a53 100644
> > --- a/arch/arm/mach-imx/mxc.h
> > +++ b/arch/arm/mach-imx/mxc.h
> > @@ -40,6 +40,8 @@
> >  #define MXC_CPU_IMX6Q		0x63
> >  #define MXC_CPU_IMX6UL		0x64
> >  #define MXC_CPU_IMX6ULL		0x65
> > +/* virtual cpu id for i.mx6ulz */
> > +#define MXC_CPU_IMX6ULZ		0x6b
> >  #define MXC_CPU_IMX6SLL		0x67
> >  #define MXC_CPU_IMX7D		0x72
> >
> > @@ -80,6 +82,11 @@ static inline bool cpu_is_imx6ull(void)
> >  	return __mxc_cpu_type =3D=3D MXC_CPU_IMX6ULL;  }
> >
> > +static inline bool cpu_is_imx6ulz(void) {
> > +	return __mxc_cpu_type =3D=3D MXC_CPU_IMX6ULZ; }
> > +
> >  static inline bool cpu_is_imx6sll(void)  {
> >  	return __mxc_cpu_type =3D=3D MXC_CPU_IMX6SLL; diff --git
> > a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c index
> > 529f4b5..87f45b9 100644
> > --- a/arch/arm/mach-imx/pm-imx6.c
> > +++ b/arch/arm/mach-imx/pm-imx6.c
> > @@ -313,7 +313,7 @@ int imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
> >  		if (cpu_is_imx6sl())
> >  			val |=3D BM_CLPCR_BYPASS_PMIC_READY;
> >  		if (cpu_is_imx6sl() || cpu_is_imx6sx() || cpu_is_imx6ul() ||
> > -		    cpu_is_imx6ull() || cpu_is_imx6sll())
> > +		    cpu_is_imx6ull() || cpu_is_imx6sll() || cpu_is_imx6ulz())
> >  			val |=3D BM_CLPCR_BYP_MMDC_CH0_LPM_HS;
> >  		else
> >  			val |=3D BM_CLPCR_BYP_MMDC_CH1_LPM_HS; @@ -331,7
> +331,7 @@ int
> > imx6_set_lpm(enum mxc_cpu_pwr_mode mode)
> >  		if (cpu_is_imx6sl() || cpu_is_imx6sx())
> >  			val |=3D BM_CLPCR_BYPASS_PMIC_READY;
> >  		if (cpu_is_imx6sl() || cpu_is_imx6sx() || cpu_is_imx6ul() ||
> > -		    cpu_is_imx6ull() || cpu_is_imx6sll())
> > +		    cpu_is_imx6ull() || cpu_is_imx6sll() || cpu_is_imx6ulz())
> >  			val |=3D BM_CLPCR_BYP_MMDC_CH0_LPM_HS;
> >  		else
> >  			val |=3D BM_CLPCR_BYP_MMDC_CH1_LPM_HS;
> > --
> > 2.7.4
> >
