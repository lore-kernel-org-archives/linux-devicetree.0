From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: add pinctrl nodes for SPDIF, LCDC, CIF, HDMI, USB and GPS
Date: Fri, 07 Nov 2014 17:52:23 +0100
Message-ID: <5384745.1WqprI8GVl@diego>
References: <1415373589-11650-1-git-send-email-julien.chauveau@neo-technologies.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415373589-11650-1-git-send-email-julien.chauveau-MwaZihP3oV2HdZQakrT3ElaPQRlvutdw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julien CHAUVEAU <julien.chauveau-MwaZihP3oV2HdZQakrT3ElaPQRlvutdw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "moderated list:ARM/Rockchip SoC..." <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Julien,

Am Freitag, 7. November 2014, 16:19:49 schrieb Julien CHAUVEAU:
> On RK3066, add pinctrl nodes for SPDIF, LCDC1, CIF0/1, HDMI and USB.
> On RK3188, add pinctrl nodes for SPDIF, LCDC1, CIF and GPS.

Please don't bulk-add pinctrl settings nobody is using for the forseeable 
future. There are currently no spdif, lcdc, cif and hdmi drivers for those 
socs and things like the usb_vbus and sd_pwr pins are used as gpios through 
regulators.

Pinctrl settings can be added in the same patch adding the device node, 
_after_ a driver got accepted.


> At the same time, add some missing pinctrl for SDMMC0 and SDMMC1
> and fix the unit addresses of GPIO0 and GPIO1 banks in rk3188.dtsi.

I you're concatenating change descriptions by "and" or your "At the same 
time", it's a good indicator that these should be two separate patches.
The general rule is, one patch - one issue.


So I'd suggest resending the address fix for the two gpios and leaving the pin 
settings be till something really uses them,


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
