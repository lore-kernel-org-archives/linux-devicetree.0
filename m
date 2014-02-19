From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/4] Phytec phyFLEX-i.MX6 : Added USB_OTG Support
Date: Wed, 19 Feb 2014 14:59:53 +0800
Message-ID: <20140219065949.GD3010@S2101-09.ap.freescale.net>
References: <1392731185-4885-1-git-send-email-ashutosh.s@phytec.in>
 <20140219022307.GL15716@S2101-09.ap.freescale.net>
 <20140219055824.GB3010@S2101-09.ap.freescale.net>
 <53045225.50509@phytec.in>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53045225.50509-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ashutosh <Ashutosh.s-mS2nBM426Az/PtFMR13I2A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Do not send email in html.

On Wed, Feb 19, 2014 at 12:11:41PM +0530, Ashutosh wrote:
> By seeing the discussion would the below changes is appropriate
> 
> regulators {
>                 compatible = "simple-bus";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> 
>                 reg_usb_otg_vbus: regulator@0 {
>                                compatible = "regulator-fixed";
>                                 reg = <0>;
>                                 regulator-name = "usb_otg_vbus";
>                                 regulator-min-microvolt = <5000000>;
>                                 regulator-max-microvolt = <5000000>;
>                                 gpio = <&gpio4 15 0>;
>                 };
> 
> But as Mark [1] suggested not to use simple bus. Which one is more appropriate
> ?

Since it's already been used so widely and provided us a nice way to use
the generic node name, I believe Mark is giving up his position.

Shawn

> 
> [1] http://www.spinics.net/lists/linux-usb/msg101477.html

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
