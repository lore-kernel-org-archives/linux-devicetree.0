From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/2] i2c: sunxi: add P2WI controller support
Date: Tue, 27 May 2014 13:45:31 +0200
Message-ID: <53847ADB.9080707@free-electrons.com>
References: <1399715163-11291-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399715163-11291-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Wolfram,

No news from you regarding this patch series.

Is there anything you want me to fix ?

Otherwise It would be great to have this series merged, because the PMIC
used on Allwinner's A31 boards are connected through this P2WI bus.

Best Regards,

Boris

On 10/05/2014 11:46, Boris BREZILLON wrote:
> Hello,
>
> This series adds support for the P2WI block used by some Allwinner
> boards to interface with the AXP221 PMIC.
>
> Best Regards,
>
> Boris
>
> Changes since v3:
> - update the DT bindings doc
> - fix a comment that was no longer true
>
> Changes since v2:
> - drop the initialization (switch from I2C to P2WI mode) part
> - print devm_ioremap_resource err code
>
> Changes since v1:
> - implement P2WI initilization
> - implement P2WI bus frequency configuration
> - implement address consistency check
> - fix devm_request_and_ioremap return check
> - rework the macro definitions
> - fix typos
>
> [1] http://www.spinics.net/lists/linux-i2c/msg15066.html
> [2] http://comments.gmane.org/gmane.comp.hardware.netbook.arm.sunxi/8947
> Boris BREZILLON (2):
>   i2c: sunxi: add P2WI DT bindings documentation
>   i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support
>
>  .../devicetree/bindings/i2c/i2c-sunxi-p2wi.txt     |  41 +++
>  drivers/i2c/busses/Kconfig                         |  12 +
>  drivers/i2c/busses/Makefile                        |   1 +
>  drivers/i2c/busses/i2c-sun6i-p2wi.c                | 349 +++++++++++++++++++++
>  4 files changed, 403 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-sunxi-p2wi.txt
>  create mode 100644 drivers/i2c/busses/i2c-sun6i-p2wi.c
>

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
