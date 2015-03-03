From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [version 2]  amba uarts - arm type uarts fifo size provided by
 device tree
Date: Tue, 3 Mar 2015 16:55:35 +0000
Message-ID: <20150303165534.GB10239@leverpostej>
References: <1424290069-8760-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424290069-8760-1-git-send-email-jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 18, 2015 at 08:07:47PM +0000, Jorge Ramirez-Ortiz wrote:
> [PATCH 1/2] Documentation: bindings: add optional fifo size property
> [PATCH 2/2] drivers/tty: pl011: read fifo size from OF if present [updated]
> 
> These patches aim at resolving an issue present on some of the amba pl011 uarts.
> 
> They were developed for the Hisilicon Hi6220 SoC where the fifo size on the
> uarts is 64 despite the amba revision having been set to 1. 

Are we certain that the FIFO length is the only difference between the
HI6220 PL011 and a regular PL011?

It may be worth adding a compatible string in addition, just in case.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
