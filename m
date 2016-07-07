From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 0/3] ARM: dts: the dts support for rk3288 firefly reload
Date: Thu, 07 Jul 2016 23:35:38 +0200
Message-ID: <2686572.mni1Mn7R6t@phil>
References: <3015470.z4L7UQJKa9@phil> <1467829380-16242-1-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467829380-16242-1-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Randy,

Am Donnerstag, 7. Juli 2016, 02:22:57 schrieb Randy Li:
> The rk3288 firefly reload  is a Rockchip RK3288 based board be found by
> core board and main board. The regulators are connected in a different
> way to the previous version of firefly boards, it is necessary to
> move some common code to uncommon place.
> 
> I only tested the ethernet and confirmed that works.
> The usb in this board won't caused by the bugs in the driver.
> 
> This version follow the suggests from Heiko Stuebner,
> except the duplicated supply name problem, I don't think
> it could be fixed in that way.

I've now had a chance to look at that reload board on the firefly site.
Firefly also is the company name, so a board named that way is not 
necessarily a "variant" :-) .

And looking at the "reload" board this definitly seems to be a very 
different product with it being a system-on-module+baseboard design with 
additional peripherals like that sata bridge, camera interfaces and probably 
more.

As you might've seen, most Rockchip boards are based on some reference-
design, so are similar in a big part of their core layout.
So, looking at the vastly different product the reload is, I'd really like 
to have a separate dts for the reload, to not run into more confusing 
differences later on.

Also, when adding a new board, please also add an entry to 
Documentation/devicetree/bindingd/arm/rockchip.txt


Thanks
Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
