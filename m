From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] reset: socfpga: use arch_initcall for early
 initialization
Date: Thu, 9 Oct 2014 15:28:35 +0200
Message-ID: <20141009132835.GI15799@pengutronix.de>
References: <1412822646-11257-1-git-send-email-dinguyen@opensource.altera.com>
 <1412845410.6809.3.camel@pengutronix.de>
 <54368AA2.9000104@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <54368AA2.9000104-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 09, 2014 at 08:16:18AM -0500, Dinh Nguyen wrote:
> Hi Philipp,
> 
> On 10/9/14, 4:03 AM, Philipp Zabel wrote:
> > Am Mittwoch, den 08.10.2014, 21:44 -0500 schrieb
> > dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org:
> >> From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
> >>
> >> There are certain drivers that are required to get loaded very early using
> >> arch_initcall. An example of such a driver is the SOCFPGA's FPGA bridge driver.
> >> This driver has to get loaded early because it needs to enable FPGA components
> >> that are connected to the bridge.
> >>
> >> This FPGA bridge driver will using the reset controller API to toggle it's
> >> reset bits, thus, it needs the reset driver to be loaded as early as possible
> >> in order for it to get used properly.
> > 
> > Without knowing the details, this sounds like the wrong approach. Can't
> > the bridge driver return -EPROBE_DEFER until the reset controller is
> > available?
> > 
> 
> The bridge driver is also using arch_initcall, as it also needs to get
> loaded early for FPGA IPs to work, and so later driver loading will work
> for the FPGA IPs.
> 

For the bridge driver the same is true. I guess that there *might* be
IP cores where you need to be very early, but that shouldn't be the normal
case. If the driver can't get loaded properly, the right thing would be to
fix the driver.

I have developed a bridge driver, too (which only needs the devicetree binding
docu for a v1) and I have a driver+IP core that is directly connected to the
bridge. I don't need any messing around with the initcalls to work properly.
-EPROBE_DEFER works just fine.

What I do need however is loading the FPGA very early of course, if it is not
done in the bootloader.

Regards,
Steffen

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
