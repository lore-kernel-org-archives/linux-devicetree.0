From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4][ 5/6] ARM: dts: i.MX35: Add display support.
Date: Mon, 4 Nov 2013 15:05:37 -0200
Message-ID: <CAOMZO5AScU=eNjnoBxUHibJihZewQdjT-PB-4yZ-fmQMgc4ZHA@mail.gmail.com>
References: <1383581724-14817-1-git-send-email-denis@eukrea.com>
	<1383581724-14817-5-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383581724-14817-5-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Denis,

On Mon, Nov 4, 2013 at 2:15 PM, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org> wrote:
> +                       ipu: ipu@53fc0000 {
> +                               compatible = "fsl,imx31-ipu";
> +                               reg = < 0x53fc0000 0x5f
> +                                       0x53fc0088 0x2b >;
> +                               interrupts = <42 41>;
> +                               clocks = <&clks 55>;
> +                               status = "disabled";
> +                       };
> +
> +                       lcdc: mx3fb@53fc00b4 {
> +                               compatible = "fsl,mx3-fb";
> +                               reg = <0x53fc00b4 0x0b>;
> +                               clocks = <&clks 55>;
> +                               status = "disabled";
> +                       };

MX35 Reference Manual states that the IPU address range is 0x53fc0000
- 0x53fc3fff

There is no 'lcdc' peripheral listed there, so I don't think 'lcdc'
should be included here.

Regards,

Fabio Estevam
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
