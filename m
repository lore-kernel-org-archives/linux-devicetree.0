From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4][v4] ARM: imx: imx7d-pinfunc: add gpio pad iomuxc
 settings
Date: Fri, 17 Jul 2015 11:51:15 +0800
Message-ID: <20150717035115.GE12927@tiger>
References: <1437078887-2524-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437078887-2524-1-git-send-email-aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lznuaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank.Li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, nitin.garg-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Anson.Huang-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, yibin.gong-KZfg59tc24xl57MIdRCFDg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jul 16, 2015 at 03:34:44PM -0500, Adrian Alonso wrote:
> * Add iMX7D SoC imx7d-pinfunc gpio pad settings
>   <mux_reg conf_reg input_reg mux_mode input_val>
> * iMX7D GPIO1_IO7 to GPIO1_IO0 encode the pad group id in the most
>   significant bits of input_val to avoid group id overlap bweeten
>   iomuxc and iomuxc-lpsr.
> 
> Signed-off-by: Adrian Alonso <aalonso-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Unless you can convince me that this approach which hacks select input
value is better than two instances one, it's an NACK for me on the whole
patch series.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
