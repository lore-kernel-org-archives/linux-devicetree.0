From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH RFC 3/5] ARM: dts: at91-sama5d4: use IRQ_TYPE_* to
 specify irq flags
Date: Wed, 31 May 2017 11:52:35 +0200
Message-ID: <20170531095235.nzkce75ffekkr65e@piout.net>
References: <20170526180609.2699-1-uwe@kleine-koenig.org>
 <20170526180609.2699-3-uwe@kleine-koenig.org>
 <8bbb5802-518b-6ae1-6ea2-642b1f0b3d2e@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8bbb5802-518b-6ae1-6ea2-642b1f0b3d2e-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26/05/2017 at 21:17:37 +0200, Marek Vasut wrote:
> On 05/26/2017 08:06 PM, Uwe Kleine-König wrote:
> > According to the binding documentation and the source code the atmel-gpio
> > controller takes IRQ_TYPE_* as its flags values, not GPIO_ACTIVE_*.
> > 
> > This patch uses the right variable type which yields the same result
> > when compiled. Note that this might be wrong and actually
> > IRQ_TYPE_LEVEL_LOW is intended by the dt author.
> > 
> > Signed-off-by: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
> > ---
> > Hello,
> > 
> > can somebody with the hardware or it's documentation please check which
> > flag is the right one?
> 
> It's correct, I tested the CAN, so:
> 
> Acked-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
> 
> > Best regards
> > Uwe
> > 
> >  arch/arm/boot/dts/at91-sama5d4_ma5d4.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
