From: Chen Peter-B29397 <B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [Patch v5 08/13] ARM: imx6q: add config-on-boot gpios
Date: Fri, 22 Jun 2012 00:03:20 +0000
Message-ID: <F281D0F91ED19E4D8E63A7504E8A649803BE45CD@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
 <1339590863-10564-9-git-send-email-richard.zhao@freescale.com>
 <4FD8AD42.6010702@gmail.com> <20120613152841.GA23590@richard-laptop>
 <4FD8C4DB.4020908@gmail.com>
 <20120614013343.GD29684@b20223-02.ap.freescale.net>
 <4FE1DE53.4070202@gmail.com> <4FE1EF26.9080401@wwwdotorg.org>
 <F281D0F91ED19E4D8E63A7504E8A649803BE3E73@039-SN2MPN1-023.039d.mgd.msft.net>
 <4FE39EA2.8050809@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FE39EA2.8050809-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Zhao Richard-B20223 <B20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, Li Frank-B20596 <B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Estevam Fabio-R49496 <r49496-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

 
> 
> That's a good point. We need those properties to be part of the device
> that controls the port/slot/connector, not the thing that plugs into it.
> Having each such binding and driver implement this themselves might not
> be a good idea though. Perhaps we can standardize on a mechanism for
> this; something vaguely like rfkill, but for arbitrary types of devices
> connected to ports.
> 
> For USB at least, where the power/reset/... GPIOs might affect just one
> port on a hub rather than the root USB host controller, the issue of
> representing these properties on a dynamically probed device still
> applies. Something like:
> 
> ehci {
>     /* The following node is dynamically detected, although the hub
>      * IC is physically soldered onto the board
>      */
>     hub {
>         hub { /* also dynamic */
>             port@2 {
>                 child-supply = <&regulator>;
>                 reset-gpios = <&gpio 0 0>;
>             };
>         };
>     };
> };
> 
> But without knowing what might be connected to port@2, how do we know
> how to sequence the power supply and reset GPIOs according to its
> requirements? I guess this is part of the specification of the port
> itself though, not the attached device, since anything that is allowed
> to plug in must conform to whatever sequencing the port is designed to
> give. If the connected device is known, the port@2 node in DT can encode
> whatever sequencing requirements are associated with the known connected
> device.

In fact, for specific usb/sdio interface device, there should be a specific interface 
class driver for it, the best place is at that class driver, like wifi or 3g driver,
as it is chip/device specific.

But the generic 3G and HUB devices are special, there is only one common driver
for each of them (drivers/usb/core/hub.c & drivers/serial/option.c)   



--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
