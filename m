From: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 06/13] ARM: dts: armada-385-linksys: usb3 label cleanup
Date: Mon, 22 May 2017 20:13:17 +0200
Message-ID: <20170522201317.3f9a4d4b@gmail.com>
References: <20170521124903.11050-1-ralph.sennhauser@gmail.com>
 <20170521124903.11050-7-ralph.sennhauser@gmail.com>
 <20170522145515.GK29447@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170522145515.GK29447-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 22 May 2017 16:55:15 +0200
Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org> wrote:

> On Sun, May 21, 2017 at 02:48:55PM +0200, Ralph Sennhauser wrote:
> > Now that we use the reference for the USB3.0 port update the node
> > name and labels for the phy and vbus to match the label used by
> > armada-38x.dtsi.
> > 
> > Signed-off-by: Ralph Sennhauser <ralph.sennhauser-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > 
> > ---
> > 
> > Notes:
> > 
> >   Going by documentation regulator-name is only of informative
> > nature so changing it should be a non issue.  
> 
> Does the regulator name appear in /sys somewhere?

To differentiate between node-name and regulator-name property I changed
the regulator name to usb3_1-vbus-regulator-name

# find /sys -name *usb3_1-vbus*
/sys/kernel/debug/regulator/usb3_1-vbus-regulator-name
/sys/devices/platform/usb3_1-vbus
/sys/firmware/devicetree/base/soc/internal-regs/pinctrl@18000/usb3_1-vbus-pins
/sys/firmware/devicetree/base/usb3_1-vbus
/sys/bus/platform/devices/usb3_1-vbus
/sys/bus/platform/drivers/reg-fixed-voltage/usb3_1-vbus

So yes, however, only under /sys/kernel/debug and more importantly not
under /sys/class which would be covered by
Documentation/ABI/testing/sysfs-class-regulator.

How the description is worded in regulator.txt [1] under optional
properties, "regulator-name: A string used as a descriptive name for
regulator outputs" doesn't give the impression its considered part of
the ABI implicitly either, well, as you know this might just be my lack
of English skill. As I was uncertain and still am not under the
impression this to be an issue I decided to change it and leave a note
so it doesn't make it in unnoticed and can be discussed / clarified.

Changing the node name has a similar impact but the same can be said
for gpio_keys vs gpio-keys which got your Reviewed-by already.

The new name would better match some recent dts additions beside being
the more obvious choice with the related changes.

[1] Documentation/devicetree/bindings/regulator/regulator.txt 

Ralph
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
