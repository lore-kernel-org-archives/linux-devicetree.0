From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V5 0/3] nvmem: add ocotp support for i.MX23 and i.MX28
Date: Tue, 11 Aug 2015 18:54:30 +0200
Message-ID: <201508111854.30933.marex@denx.de>
References: <1439299818-8495-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439299818-8495-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Janusz =?utf-8?q?U=C5=BCycki?= <j.uzycki-cjVIcFy54eMe9JSWTWOYM+658FiBabzs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday, August 11, 2015 at 03:30:15 PM, Stefan Wahren wrote:
> This patch series brings read-only support for the On-Chip OTP cells
> in the i.MX23 and i.MX28 processor.
> 
> changes in V5:
> - rebase to char-misc-next
> - add nvmem prefix to module name
> - set status in dtsi files
> 
> changes in V4:
> - rename fsl_ocotp.c to mxs-ocotp.c
> - adapt driver to use NVMEM framework V7
> - take care of hbus clock
> - increase too small timeout
> - implement a wait function
> - use defines from stmp_device.h
> - remove owner init
> - more code cleanup
> 
> changes in V3:
> - drop write support
> - take care of i.MX23 which has less registers
> - drop unnecessary header file
> - move static variables into driver data
> - add devicetree probing
> - fix missing bank closing in error case
> - use kobj from platform device for sysfs
> - add SYSFS to Kconfig
> - add binding file
> - code cleanup
> 
> Stefan Wahren (3):
>   DT: nvmem: add binding for mxs-ocotp
>   nvmem: add driver for ocotp in i.MX23 and i.MX28
>   ARM: mxs: enable ocotp for i.MX23 and i.MX28
> 
>  .../devicetree/bindings/nvmem/mxs-ocotp.txt        |   24 ++
>  arch/arm/boot/dts/imx23.dtsi                       |    7 +-
>  arch/arm/boot/dts/imx28.dtsi                       |    7 +-
>  drivers/nvmem/Kconfig                              |   11 +
>  drivers/nvmem/Makefile                             |    2 +
>  drivers/nvmem/mxs-ocotp.c                          |  252
> ++++++++++++++++++++ 6 files changed, 299 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mxs-ocotp.txt
>  create mode 100644 drivers/nvmem/mxs-ocotp.c

Very nice, other than the comments from Srinivas, you can add my

Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>

Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
