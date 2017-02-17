From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 00/36] i.MX Media Driver
Date: Fri, 17 Feb 2017 12:21:52 +0100
Message-ID: <1487330512.3107.36.camel@pengutronix.de>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
         <20170216222006.GA21222@n2100.armlinux.org.uk>
         <923326d6-43fe-7328-d959-14fd341e47ae@gmail.com>
         <20170216225742.GB21222@n2100.armlinux.org.uk>
         <1487327951.3107.19.camel@pengutronix.de>
         <20170217105624.GC21222@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170217105624.GC21222-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media@v
List-Id: devicetree@vger.kernel.org

On Fri, 2017-02-17 at 10:56 +0000, Russell King - ARM Linux wrote:
> On Fri, Feb 17, 2017 at 11:39:11AM +0100, Philipp Zabel wrote:
> > On Thu, 2017-02-16 at 22:57 +0000, Russell King - ARM Linux wrote:
> > > On Thu, Feb 16, 2017 at 02:27:41PM -0800, Steve Longerbeam wrote:
> > > > 
> > > > 
> > > > On 02/16/2017 02:20 PM, Russell King - ARM Linux wrote:
> > > > >On Wed, Feb 15, 2017 at 06:19:02PM -0800, Steve Longerbeam wrote:
> > > > >>In version 4:
> > > > >
> > > > >With this version, I get:
> > > > >
> > > > >[28762.892053] imx6-mipi-csi2: LP-11 timeout, phy_state = 0x00000000
> > > > >[28762.899409] ipu1_csi0: pipeline_set_stream failed with -110
> > > > >
> > > > 
> > > > Right, in the imx219, on exit from s_power(), the clock and data lanes
> > > > must be placed in the LP-11 state. This has been done in the ov5640 and
> > > > tc358743 subdevs.
> > > 
> > > The only way to do that is to enable streaming from the sensor, wait
> > > an initialisation time, and then disable streaming, and wait for the
> > > current line to finish.  There is _no_ other way to get the sensor to
> > > place its clock and data lines into LP-11 state.
> > 
> > I thought going through LP-11 is part of the D-PHY transmitter
> > initialization, during the LP->HS wakeup sequence. But then I have no
> > access to MIPI specs.
> 
> The D-PHY transmitter initialisation *only* happens as part of the
> wake-up from standby to streaming mode.  That is because Sony expect
> that you program the sensor, and then when you switch it to streaming
> mode, it computes the D-PHY parameters from the PLL, input clock rate
> (you have to tell it the clock rate in 1/256 MHz units), number of
> lanes, and other parameters.
> 
> It is possible to program the D-PHY parameters manually, but that
> doesn't change the above sequence in any way (it just avoids the
> chip computing the values, it doesn't result in any change of
> behaviour on the bus.)
>
> The IMX219 specifications are clear: the clock and data lines are
> held low (LP-00 state) after releasing the hardware enable signal.
> There's a period of chip initialisation, and then you can access the
> I2C bus and configure it.  There's a further period of initialisation
> where charge pumps are getting to their operating state.  Then, you
> set the streaming bit, and a load more initialisation happens before
> the CSI bus enters LP-11 state and the first frame pops out.  When
> entering standby, the last frame is completed, and then the CSI bus
> enters LP-11 state.

How about firing off a thread in imx6-mipi-csi2 prepare_stream that
spins on the LP-11 check and then continues with the receiver D-PHY
initialization once the condition is met? I think we should have at
least 100 us to do this, but maybe the IMX219 can be programmed to stay
in LP-11 for a longer time.

> SMIA are slightly different - mostly following what I've said above,
> but the clock and data lines are tristated after releasing the
> xshutdown signal, and they remain tristated until the clock line
> starts toggling before the first frame appears.  There appears to
> be no point that the clock line enters LP-11 state before it starts
> toggling.  When entering standby, the last frame is completed, and
> the CSI bus enters tristate mode (so floating.)  There is no way to
> get these sensors into LP-11 state.

I have no idea what to do about those.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
