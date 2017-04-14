From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: at91: use correct compatible for the gpio mux
 controller
Date: Fri, 14 Apr 2017 12:07:05 +0200
Message-ID: <20170414100705.tiltc433lidqzcr2@piout.net>
References: <1492118578-15356-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1492118578-15356-1-git-send-email-peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13/04/2017 at 23:22:58 +0200, Peter Rosin wrote:
> The compatible string for a gpio based mux controller is "gpio-mux",
> and nothing else.
> 
> Fixes: 29dd89418007 ("ARM: dts: at91: add envelope detector mux to the Axentia TSE-850")
> Signed-off-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> ---
>  arch/arm/boot/dts/at91-tse850-3.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Hi!
> 
> The compatible string for the gpio based mux changed along the way (on
> request from Rob) but I failed to update the implementation in the
> gpio-mux driver when I made that change. Consequently, I didn't notice
> that I didn't update the compatible string here either, since it all
> continued to work in my tests...
> 
> The compatible string in the gpio-mux driver is being fixed to match
> documentation, so this of course needs fixing too. No TSE-850 devices
> are affected, except for the one on my desk.
> 
> Sorry for the churn.
> 

So, I folded that one in the previous one and updated my pull request.
Hopefully this will be OK.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
