From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 03/54] MAINTAINERS: Add file patterns for mediatek device
 tree bindings
Date: Tue, 31 May 2016 10:49:11 +0200
Message-ID: <574D5007.6070003@gmail.com>
References: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
 <1463907991-7916-4-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463907991-7916-4-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 22/05/16 11:05, Geert Uytterhoeven wrote:
> Submitters of device tree binding documentation may forget to CC
> the subsystem maintainer if this is missing.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com

> Please apply this patch directly if you want to be involved in device
> tree binding documentation for your subsystem.
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e1bf10e4ad021483..80d97eebcccec449 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1424,6 +1424,7 @@ M:	Matthias Brugger <matthias.bgg@gmail.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
> +F:	Documentation/devicetree/bindings/soc/mediatek/
>   F:	arch/arm/boot/dts/mt6*
>   F:	arch/arm/boot/dts/mt8*
>   F:	arch/arm/mach-mediatek/
>
