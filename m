From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [version 2]  amba uarts - arm type uarts fifo size provided by device tree
Date: Wed, 18 Feb 2015 15:07:47 -0500
Message-ID: <1424290069-8760-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
References: <amba uarts - arm type uarts fifo size provided by device tree>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <amba uarts - arm type uarts fifo size provided by device tree>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

[PATCH 1/2] Documentation: bindings: add optional fifo size property
[PATCH 2/2] drivers/tty: pl011: read fifo size from OF if present [updated]

These patches aim at resolving an issue present on some of the amba pl011 uarts.

They were developed for the Hisilicon Hi6220 SoC where the fifo size on the
uarts is 64 despite the amba revision having been set to 1. 

This makes the current way of detecting the fifo size based on the value of the
amba_rev non usable.

A mechanism for those uarts to retrieve the fifo sizes using the optional
property "fifo-size" in the device tree declared in PATCH1/2 is implemented
under PATCH2/2.

This device tree setting shall take precedence over any other calculated values.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
