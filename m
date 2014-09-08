From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v5 0/4] Patches to add support for Rockchip dwc2 controller
Date: Mon, 08 Sep 2014 20:43:40 +0200
Message-ID: <4508852.pY5QcWPyfZ@diego>
References: <1407470159-14722-1-git-send-email-kever.yang@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407470159-14722-1-git-send-email-kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xjq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org, hj-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Greg,

Am Freitag, 8. August 2014, 11:55:55 schrieb Kever Yang:
> These patches to add support for dwc2 controller found in
> Rockchip processors rk3066, rk3188 and rk3288,
> and enable dts for rk3288 evb.

will you take patches 1 and 2?


Thanks
Heiko


> 
> Changes in v5:
> - max_transfer_size change to 65535 to met the requirement of
>   header file
> - change the sort order of dwc2 in rk3288.dtsi
> - don't enable otg port for evb
> 
> Changes in v4:
> - max_transfer_size change to 65536, this should be enough
>   for most transfer, the hardware auto-detect will set this
>   to 0x7ffff which may make dma_alloc_coherent fail when
>   non-dword aligned buf from driver like usbnet happen.
> - remove EHCI and HSIC dts patch for Doug had post it seprately.
> 
> Changes in v3:
> - EHCI and HSIC move new for version 3.
> - Rebase
> 
> Changes in v2:
> - Split out dr_mode and rk3288 bindings.
> - add compatible "snps,dwc2" bingding info
> - set most parameters as driver auto-detect
> - evb patch added in version 2
> 
> Kever Yang (4):
>   Documentation: dt-bindings: add dt binding info for Rockchip dwc2
>   usb: dwc2: add compatible data for rockchip soc
>   ARM: dts: add rk3288 dwc2 controller support
>   ARM: dts: Enable USB host1(dwc) on rk3288-evb
> 
>  Documentation/devicetree/bindings/usb/dwc2.txt |  3 +++
>  arch/arm/boot/dts/rk3288-evb.dtsi              |  4 ++++
>  arch/arm/boot/dts/rk3288.dtsi                  | 20 ++++++++++++++++++
>  drivers/usb/dwc2/platform.c                    | 29
> ++++++++++++++++++++++++++ 4 files changed, 56 insertions(+)

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
