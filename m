From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: armada388-clearfog: number LAN ports properly
Date: Wed, 27 Jul 2016 12:26:41 +0200
Message-ID: <87r3afnzq6.fsf@free-electrons.com>
References: <E1bLWIh-0001ZK-Ai@rmk-PC.armlinux.org.uk>
	<20160708152616.GF8426@lunn.ch> <87vazro02y.fsf@free-electrons.com>
	<20160727102120.GV1041@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160727102120.GV1041-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org> (Russell King's
	message of "Wed, 27 Jul 2016 11:21:20 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Russell King,
 
 On mer., juil. 27 2016, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:

> On Wed, Jul 27, 2016 at 12:19:01PM +0200, Gregory CLEMENT wrote:
>> Hi,
>>  
>>  On ven., juil. 08 2016, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:
>> 
>> > On Fri, Jul 08, 2016 at 02:58:39PM +0100, Russell King wrote:
>> >> Currently, the ports as seen from the rear number as:
>> >> 
>> >> 	eth0 sfp lan5 lan4 lan3 lan2 lan1 lan6
>> >> 
>> >> which is illogical - this came about because the rev 2.0 boards have the
>> >> LEDs on the front for the DSA switch (lan5-1) reversed.  Rev 2.1 boards
>> >> fixed the LED issue, and the Clearfog case numbers the lan ports
>> >> increasing from left to right.
>> >> 
>> >> Maintaining this illogical numbering causes confusion, with reports that
>> >> "my link isn't coming up" and "my connection negotiates 10base-Half"
>> >> both of which are due to people thinking that the port next to the SFP
>> >> is lan1.
>> >> 
>> >> Fix this by renumbering the ports to match people's expectations.
>> >> 
>> >> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
>> >
>> > Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
>> 
>> I missed this patch, but I now applied it on mvebu/dt-4.9
>
> It would be much better to get it into 4.8-rc so that we don't spread
> the port renumbering over a large range of kernels, as well as forcing
> vendors to carry patches like this to fix problems.

I can move it to the mvebu/fixes branch, it is not too late. Also what
about to apply it on the stable kernel?

Gregory

>
> -- 
> RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
> FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
> according to speedtest.net.

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
