From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: device tree binding documentation outdated
Date: Fri, 27 Sep 2013 09:12:25 -0400
Message-ID: <20130927131225.GA31178@titan.lakedaemon.net>
References: <20130926195158.GS12758@n2100.arm.linux.org.uk>
 <CAOMZO5ANsZGcpvmtBE7d0q0E6+f0bE_U8CBF7G2v3xtqoLbqcA@mail.gmail.com>
 <CACRpkda9HZ4JKnidnJJh-HkhCgtvJwQPQJnv9CZ4iYcQP36_Nw@mail.gmail.com>
 <20130927025116.GG25146@S2101-09.ap.freescale.net>
 <20130927084504.GW12758@n2100.arm.linux.org.uk>
 <20130927122814.GK25146@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130927122814.GK25146-rvtDTF3kK1ictlrPMvKcciBecyulp+rMXqFh9Ls21Oc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Shawn,

On Fri, Sep 27, 2013 at 08:28:16PM +0800, Shawn Guo wrote:
> On Fri, Sep 27, 2013 at 09:45:04AM +0100, Russell King - ARM Linux wrote:
... 
> >                 PAD_CTL_PKE | PAD_CTL_PUE | \
> > +               PAD_CTL_PUS_100K_DOWN | PAD_CTL_SPEED_LOW |     \
> > +               PAD_CTL_DSE_80ohm | PAD_CTL_SRE_FAST | PAD_CTL_HYS),
> 
> The CONFIG number has nothing to do with imx*-pinfunc.h.  You will need
> to translate the setting here into the last number of fsl,pins entry.

The number entered into the dts{i} file still seems 'magic' to me.
Perhaps these should also be defined in imx*-pinfunc.h?  So an entry in
the dts file:

  esdhc1 {
          pinctrl_esdhc1: esdhc1grp {
                  fsl,pins = <
                          MX50_PAD_SD1_CMD__SD1_CMD      MX50_CFG_ESDHC
                          MX50_PAD_SD1_CLK__SD1_CLK      MX50_CFG_ESDHC
                          MX50_PAD_SD1_D0__SD1_D0        MX50_CFG_ESDHC
                          MX50_PAD_SD1_D1__SD1_D1        MX50_CFG_ESDHC
                          MX50_PAD_SD1_D2__SD1_D2        MX50_CFG_ESDHC
                          MX50_PAD_SD1_D3__SD1_D3        MX50_CFG_ESDHC
                          MX50_PAD_EIM_CRE__GPIO_1_27    0x0000
                          MX50_PAD_ECSPI2_SS0__GPIO_4_19 MX50_CFG_ESDHC
                  >;
          };
  };

And in imx50-pinfunc.h:

/* taken from the enum in fsl's BSP */

#define PAD_CTL_SRE_SLOW		0x0 << 0
#define PAD_CTL_SRE_FAST		0x1 << 0

#define PAD_CTL_DRV_LOW			0x0 << 1
#define PAD_CTL_DRV_MEDIUM		0x1 << 1
#define PAD_CTL_DRV_HIGH		0x2 << 1
#define PAD_CTL_DRV_MAX			0x3 << 1

#define PAD_CTL_ODE_OPENDRAIN_NONE	0x0 << 3
#define PAD_CTL_ODE_OPENDRAIN_ENABLE	0x1 << 3

#define PAD_CTL_100K_PD			0x0 << 4
#define PAD_CTL_360K_PD			0x0 << 4
#define PAD_CTL_47K_PU			0x1 << 4
#define PAD_CTL_75k_PU			0x1 << 4
#define PAD_CTL_100K_PU			0x2 << 4
#define PAD_CTL_22K_PU			0x3 << 4

#define PAD_CTL_PUE_KEEPER		0x0 << 6
#define PAD_CTL_PUE_PULL		0x1 << 6

#define PAD_CTL_PKE_NONE		0x0 << 7
#define PAD_CTL_PKE_ENABLE		0x1 << 7

#define PAD_CTL_HYS_NONE		0x0 << 8
#define PAD_CTL_HYS_ENABLE		0x1 << 8

#define PAD_CTL_DDR_INPUT_CMOS		0x0 << 9
#define PAD_CTL_DDR_INPUT_DDR		0x1 << 9

#define PAD_CTL_DRV_VOT_LOW		0x0 << 13
#define PAD_CTL_DRV_VOT_HIGH		0x1 << 13


#define MX50_CFG_ESDHC (PAD_CTL_DRV_HIGH | PAD_CTL_47K_PU | \
			PAD_CTL_PUE_PULL | PAD_CTL_PKE_ENABLE)

Or, we could at least have the PAD_CTL_* defined in one file for
everyone to use and individual boards could do the MX50_CFG_* on their
own.

I'm currently slogging through the exact same issues for adding imx50
(SanDisk Connect Wireless media Drive).  I thought I was just thick.
It's a relief to know I'm not the only one having trouble with this.

thx,

Jason.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
