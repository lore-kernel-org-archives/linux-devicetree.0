From: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v4 00/36] i.MX Media Driver
Date: Thu, 16 Feb 2017 22:57:42 +0000
Message-ID: <20170216225742.GB21222@n2100.armlinux.org.uk>
References: <1487211578-11360-1-git-send-email-steve_longerbeam@mentor.com>
 <20170216222006.GA21222@n2100.armlinux.org.uk>
 <923326d6-43fe-7328-d959-14fd341e47ae@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <923326d6-43fe-7328-d959-14fd341e47ae-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, nick-gcszYUEDH4VrovVCs/uTlw@public.gmane.org, markus.heiser-O6JHGLzbNUwb1SvskN2V4Q@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, bparrot-l0cyMroinI0@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, minghsiu.tsai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jean-christophe.trotin-qxv4g6HH51o@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, niklas.soderlund+renesas-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 16, 2017 at 02:27:41PM -0800, Steve Longerbeam wrote:
> 
> 
> On 02/16/2017 02:20 PM, Russell King - ARM Linux wrote:
> >On Wed, Feb 15, 2017 at 06:19:02PM -0800, Steve Longerbeam wrote:
> >>In version 4:
> >
> >With this version, I get:
> >
> >[28762.892053] imx6-mipi-csi2: LP-11 timeout, phy_state = 0x00000000
> >[28762.899409] ipu1_csi0: pipeline_set_stream failed with -110
> >
> 
> Right, in the imx219, on exit from s_power(), the clock and data lanes
> must be placed in the LP-11 state. This has been done in the ov5640 and
> tc358743 subdevs.

The only way to do that is to enable streaming from the sensor, wait
an initialisation time, and then disable streaming, and wait for the
current line to finish.  There is _no_ other way to get the sensor to
place its clock and data lines into LP-11 state.

For that to happen, we need to program the sensor a bit more than we
currently do at power on (to a minimal resolution, and setting up the
PLLs), and introduce another 4ms on top of the 8ms or so that the
runtime resume function already takes.

Looking at the SMIA driver, things are worse, and I suspect that it also
will not work with the current setup - the SMIA spec shows that the CSI
clock and data lines are tristated while the sensor is not streaming,
which means they aren't held at a guaranteed LP-11 state, even if that
driver momentarily enabled streaming.  Hence, Freescale's (or is it
Synopsis') requirement may actually be difficult to satisfy.

However, I regard runtime PM broken with the current imx-capture setup.
At the moment, power is controlled at the sensor by whether the media
links are enabled.  So, if you have an enabled link coming off the
sensor, the sensor will be powered up, whether you're using it or not.

Given that the number of applications out there that know about the
media subdevs is really quite small, this combination makes having
runtime PM in sensor devices completely pointless - they can't sleep
as long as they have an enabled link, which could be persistent over
many days or weeks.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
