From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [Urgent PATCH] arm64: dts: uniphier: fix IRQ trigger type of ARMv8 timer
Date: Wed, 10 Aug 2016 22:52:13 +0200
Message-ID: <1769666.3m3onKVFl3@wuerfel>
References: <1470039140-3801-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470039140-3801-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, August 1, 2016 5:12:20 PM CEST Masahiro Yamada wrote:
> Since commit 1e2a7d78499e ("irqdomain: Don't set type when mapping
> an IRQ"), the interrupt type is strictly checked.  Without this
> patch, this board would not boot any more.
> 
> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
> says that the 3rd cell should be either 1 (edge) or 4 (level)
> depending on the trigger type.  As the CA72 Generic Timer provides
> active-low interrupts, the value of the 3rd cell should be 4.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> Suggested-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> 

I've added it to the fixes branch now, sorry for the delay.

	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
