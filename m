From: Patrick Uiterwijk <patrick-TjDN7UKZo3m+BTG0ijDn3Q@public.gmane.org>
Subject: [patch] ARM: mvebu: fix usb on Linksys Caiman
Date: Tue, 29 Mar 2016 13:56:51 +0000
Message-ID: <1459259813-5278-1-git-send-email-patrick@puiterwijk.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pbrobinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

These patches fix the USB ports on Linksys Caiman (WRT1200AC) on 4.6rc1.
After a lot of trial and error, I found out that if there's any unit
with name "usb@58000" defined, none of the USB ports work, but if I
change it to anything else, the USB3 port comes up. And if I then also
bring the linksys.dtsi unit name in sync (and different from USB@58000),
the USB2 port also comes up.

I can change it to literally anything else: nonsense@58000 and usb@58001
work, it's only usb@58000 that doesn't work as far as I have found.
Since the ehci-orion documentation gives the example of ehci@50000, I just
brought all of the Orion EHCI device tree definitions in sync with this.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
