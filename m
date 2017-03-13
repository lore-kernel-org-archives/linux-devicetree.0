From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: [PATCH v2 21/23] MAINTAINERS: Add file patterns for w1 device tree bindings
Date: Mon, 13 Mar 2017 22:08:53 +0300
Message-ID: <427591489432133@web24o.yandex.ru>
References: <1489324627-19126-1-git-send-email-geert@linux-m68k.org> <1489324627-19126-22-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489324627-19126-22-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

Hi

12.03.2017, 16:17, "Geert Uytterhoeven" <geert@linux-m68k.org>:
> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.

I have no objection on this patch, but I do not really know who is responsible for this and which tree should it come into.
If it is ok, Greg, please pull it into your one, or I see devicetree@ mail in copy... Stumbled

> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Evgeniy Polyakov <zbr@ioremap.net>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Please apply this patch directly if you want to be involved in device
> tree binding documentation for your subsystem.
>
> v2:
>   - No changes.
>
> Impact on next-20170310:
>
> +Evgeniy Polyakov <zbr@ioremap.net> (maintainer:W1 DALLAS'S 1-WIRE BUS)
>  Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>  Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>  devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
>  linux-kernel@vger.kernel.org (open list)
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 000342ab65971a8c..e80f00a3368587c7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13518,6 +13518,7 @@ F: drivers/mmc/host/vub300.c
>  W1 DALLAS'S 1-WIRE BUS
>  M: Evgeniy Polyakov <zbr@ioremap.net>
>  S: Maintained
> +F: Documentation/devicetree/bindings/w1/
>  F: Documentation/w1/
>  F: drivers/w1/
>
> --
> 2.7.4
