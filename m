From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: realtek: Clean up RTD1295 UART reg property
Date: Mon, 14 Aug 2017 19:45:08 +0200
Message-ID: <0c16bc3f-8e5d-3c35-a017-09000abd6e96@suse.de>
References: <20170730111737.22888-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170730111737.22888-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roc He <hepeng-qoVzM6YEWSw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?B?6JKL5Li955C0?= <jiang.liqin-31gW8twSeR21Z/+hSey0Gg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 30.07.2017 um 13:17 schrieb Andreas Färber:
> The downstream RTD1195 and apparently RTD1295 trees have a modified 8250
> serial driver that acknowledges its interrupts using the second reg area,
> which is an irq mux.
> 
> Drop these unused second reg entries for the UART nodes.
> 
> Fixes: 72a7786c0a0d ("ARM64: dts: Add Realtek RTD1295 and Zidoo X9S")
> Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
> ---
>  arch/arm64/boot/dts/realtek/rtd1295.dtsi | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Applied to v4.14/dt64:

https://git.kernel.org/pub/scm/linux/kernel/git/afaerber/linux-realtek.git/log/?h=v4.14/dt64

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
