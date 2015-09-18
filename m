From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH V6 0/3] nvmem: add ocotp support for i.MX23 and i.MX28
Date: Fri, 18 Sep 2015 17:31:37 +0200
Message-ID: <55FC2E59.5030504@i2se.com>
References: <1439418116-1833-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439418116-1833-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, =?UTF-8?Q?Janusz_U=c5=bcycki?= <j.uzycki-cjVIcFy54eMe9JSWTWOYM+658FiBabzs@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Greg,

Am 13.08.2015 um 00:21 schrieb Stefan Wahren:
> This patch series brings read-only support for the On-Chip OTP cells
> in the i.MX23 and i.MX28 processor.
>
> changes in V6:
> - add COMPILE_TEST to dependancy
> - remove unnecessary headers
> - enable clock during read operation
> - fix module license
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

the merge window is closed and patch #3 has been applied by Shawn.

Is it possible for you to apply the rest of this series to char-misc-next?

Kind regards
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
