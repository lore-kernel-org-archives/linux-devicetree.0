From: Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 5/9] usb: gadget: s3c-hsotg: enable generic phy support
Date: Sat, 02 Nov 2013 14:09:21 +0100
Message-ID: <1868561.m5DoOTCY2U@flatron>
References: <1383335158-19730-1-git-send-email-matt.porter@linaro.org> <1383335158-19730-6-git-send-email-matt.porter@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383335158-19730-6-git-send-email-matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Matt.

On Friday 01 of November 2013 15:45:54 Matt Porter wrote:
> Adds support for the generic PHY subsystem. Generic PHY
> support is probed and then the driver falls back to checking
> for an old style USB PHY and pdata if not found.
> 
> Signed-off-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/usb/gadget/s3c-hsotg.c | 54
> ++++++++++++++++++++++++++++-------------- 1 file changed, 36
> insertions(+), 18 deletions(-)

Patches that convert the driver to generic PHY have been already posted by 
Kamil Debski, as a part of a series[1] adding generic PHY drivers for S5P 
and Exynos SoCs. After that series, there will be no need to support the 
usb_phy subsystem in this driver anymore.

[1] http://www.mail-archive.com/linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg31189.html

Best regards,
Tomasz

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
