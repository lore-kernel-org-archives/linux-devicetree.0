From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v4 00/36] i.MX Media Driver
Date: Fri, 17 Feb 2017 16:04:30 +0100
Message-ID: <1487343870.3107.95.camel@pengutronix.de>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
         <20170216222006.GA21222@n2100.armlinux.org.uk>
         <923326d6-43fe-7328-d959-14fd341e47ae@gmail.com>
         <1487331818.3107.46.camel@pengutronix.de>
         <20170217122213.GQ16975@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170217122213.GQ16975-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-02-17 at 14:22 +0200, Sakari Ailus wrote:
> Hi Philipp, Steve and Russell,
> 
> On Fri, Feb 17, 2017 at 12:43:38PM +0100, Philipp Zabel wrote:
> > On Thu, 2017-02-16 at 14:27 -0800, Steve Longerbeam wrote:
> > > 
> > > On 02/16/2017 02:20 PM, Russell King - ARM Linux wrote:
> > > > On Wed, Feb 15, 2017 at 06:19:02PM -0800, Steve Longerbeam wrote:
> > > >> In version 4:
> > > >
> > > > With this version, I get:
> > > >
> > > > [28762.892053] imx6-mipi-csi2: LP-11 timeout, phy_state = 0x00000000
> > > > [28762.899409] ipu1_csi0: pipeline_set_stream failed with -110
> > > >
> > > 
> > > Right, in the imx219, on exit from s_power(), the clock and data lanes
> > > must be placed in the LP-11 state. This has been done in the ov5640 and
> > > tc358743 subdevs.
> > > 
> > > If we want to bring in the patch that adds a .prepare_stream() op,
> > > the csi-2 bus would need to be placed in LP-11 in that op instead.
> > > 
> > > Philipp, should I go ahead and add your .prepare_stream() patch?
> > 
> > I think with Russell's explanation of how the imx219 sensor operates,
> > we'll have to do something before calling the sensor s_stream, but right
> > now I'm still unsure what exactly.
> 
> Indeed there appears to be no other way to achieve the LP-11 state than
> going through the streaming state for this particular sensor, apart from
> starting streaming.
> 
> Is there a particular reason why you're waiting for the transmitter to
> transfer to LP-11 state? That appears to be the last step which is done in
> the csi2_s_stream() callback.
> 
> What the sensor does next is to start streaming, and the first thing it does
> in that process is to switch to LP-11 state.
> 
> Have you tried what happens if you simply drop the LP-11 check? To me that
> would seem the right thing to do.

Removing the wait for LP-11 alone might not be an issue in my case, as
the TC358743 is known to be in stop state all along. So I just have to
make sure that the time between s_stream(csi2) starting the receiver and
s_stream(tc358743) causing LP-11 to be changed to the next state is long
enough for the receiver to detect LP-11 (which I really can't, I just
have to pray I2C transmissions are slow enough).

The problems start if we have to enable the D-PHY and deassert resets
either before the sensor enters LP-11 state or after it already started
streaming, because we don't know when the sensor drives that state on
the bus.

The latter case I is simulated easily by again changing the order so
that the "sensor" (tc358743) is enabled before the CSI-2 receiver D-PHY
initialization. The result is that captures time out, presumably because
the receiver never entered HS mode because it didn't see LP-11. The
PHY_STATE register contains 0x200, meaning RXCLKACTIVEHS (which we
should wait for in step 7.) is never set.

I tried to test the former by instead modifying the tc358743 driver a
bit:

----------8<----------
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 39d4cdd328c0f..43df80903215b 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1378,8 +1378,6 @@ static int tc358743_s_dv_timings(struct v4l2_subdev *sd,
        state->timings = *timings;
 
        enable_stream(sd, false);
-       tc358743_set_pll(sd);
-       tc358743_set_csi(sd);
 
        return 0;
 }
@@ -1469,6 +1467,11 @@ static int tc358743_g_mbus_config(struct v4l2_subdev *sd,
 
 static int tc358743_s_stream(struct v4l2_subdev *sd, int enable)
 {
+       if (enable) {
+               tc358743_set_pll(sd);
+               tc358743_set_csi(sd);
+               tc358743_set_csi_color_space(sd);
+       }
        enable_stream(sd, enable);
        if (!enable) {
                /* Put all lanes in PL-11 state (STOPSTATE) */
@@ -1657,9 +1660,6 @@ static int tc358743_set_fmt(struct v4l2_subdev *sd,
        state->vout_color_sel = vout_color_sel;
 
        enable_stream(sd, false);
-       tc358743_set_pll(sd);
-       tc358743_set_csi(sd);
-       tc358743_set_csi_color_space(sd);
 
        return 0;
 }
---------->8----------

That should enable the CSI-2 Tx and put it in LP-11 only after the CSI-2
receiver is enabled, right before starting streaming.

That did seem to work the few times I tested, but I have no idea how
this will behave with other chips that do something else to the bus
while not streaming, and whether it is ok to enable the CSI right after
the sensor without waiting for the CSI-2 bus to settle.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
