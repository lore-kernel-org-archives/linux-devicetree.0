From: Oleksij Rempel <ore-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v5 2/6] ARM: imx6: register pm_power_off handler if
 "fsl,pmic-stby-poweroff" is set
Date: Tue, 20 Jun 2017 17:25:31 +0200
Message-ID: <20170620152531.efdlbcrblil6oj64@pengutronix.de>
References: <20170619050245.2632-1-o.rempel@pengutronix.de>
 <20170619050245.2632-3-o.rempel@pengutronix.de>
 <1497872133.5380.11.camel@nxp.com>
 <7f2db0a8-a316-5ecb-24bf-46bcb625e123@pengutronix.de>
 <1497969136.3177.10.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497969136.3177.10.camel-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Leonard Crestez <leonard.crestez-3arQi8VN3Tc@public.gmane.org>
Cc: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jun 20, 2017 at 05:32:16PM +0300, Leonard Crestez wrote:
> On Tue, 2017-06-20 at 06:55 +0200, Oleksij Rempel wrote:
> > On 19.06.2017 13:35, Leonard Crestez wrote:
> > > On Mon, 2017-06-19 at 07:02 +0200, Oleksij Rempel wrote:
> > > > 
> > > > One of the Freescale recommended sequences for power off with
> > > > external
> > > > PMIC is the following:
> > > > ...
> > > > 3.  SoC is programming PMIC for power off when standby is asserted.
> > > > 4.  In CCM STOP mode, Standby is asserted, PMIC gates SoC supplies.
> > > > 
> > > > This patch implements step 4. of this sequence.
> > > > 
> > > > Signed-off-by: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > > ---
> > > >  arch/arm/mach-imx/pm-imx6.c | 25 +++++++++++++++++++++++++
> > > >  1 file changed, 25 insertions(+)
> > > > 
> > > > diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-
> > > > imx6.c
> > > > index e61b1d1027e1..cb76832935f0 100644
> > > > --- a/arch/arm/mach-imx/pm-imx6.c
> > > > +++ b/arch/arm/mach-imx/pm-imx6.c
> > > > @@ -602,6 +602,28 @@ static void __init imx6_pm_common_init(const
> > > > struct imx6_pm_socdata
> > > >  				   IMX6Q_GPR1_GINT);
> > > >  }
> > > > 
> > > > +static void imx6_pm_poweroff(void)
> > > > +{
> > > > +	imx6_set_lpm(STOP_POWER_OFF);
> > > > +	cpu_suspend(0, imx6q_suspend_finish);
> > > It's a bit strange that you're using parts of the suspend code for
> > > this. Perhaps you could just write your bits to CLPCR and then execute
> > > a WFI?
> > Well, every thing in this patch set, yell about using standby/suspend 
> > path in HW for power off. Even iMX code use STOP_POWER_OFF for 
> > configuring this regs. How can it be more strange? :) Should i really 
> > duplicate code to hide this?
> > 
> This code is used to set the power state the soc enters on WFI. These
> function try to ensure that it is possible to come back up when woken
> by an interrupt later. That part you don't want, right?
> 
> However I can't think of any obvious way this could misbehave so I
> guess it's fine.

ok, thx.

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
