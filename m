From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] rtc: omap: Support ext_wakeup configuration
Date: Mon, 11 Apr 2016 08:57:53 -0500
Message-ID: <20160411135753.GA29858@rob-hp-laptop>
References: <1459960367-29399-1-git-send-email-m.niestroj@grinn-global.com>
 <1459960367-29399-2-git-send-email-m.niestroj@grinn-global.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1459960367-29399-2-git-send-email-m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 06, 2016 at 06:32:47PM +0200, Marcin Niestroj wrote:
> Support configuration of ext_wakeup sources. This patch makes it
> possible to enable ext_wakeup (and set it's polarity), depending on
> board configuration. AM335x's dedicated PMIC (tps65217) uses ext_wakeup
> in SLEEP mode (RTC-only) to notify about power-button presses. Handling
> power-button presses enables to recover from RTC-only power states
> correctly.
> 
> Implementation uses gpiochip to utilize standard bindings. However,
> configuration is possible only using device-tree (no runtime changes).
> 
> Signed-off-by: Marcin Niestroj <m.niestroj-z3quKL4iOrmQ6ZAhV5LmOA@public.gmane.org>
> ---

Why are you doing a cover letter for a single patch. Put any commentary 
and version history here instead.

>  Documentation/devicetree/bindings/rtc/rtc-omap.txt |  18 ++-
>  drivers/rtc/Kconfig                                |   2 +-
>  drivers/rtc/rtc-omap.c                             | 137 ++++++++++++++++++++-
>  3 files changed, 154 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-omap.txt b/Documentation/devicetree/bindings/rtc/rtc-omap.txt
> index bf7d11a..4a7738e 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-omap.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-omap.txt
> @@ -18,8 +18,12 @@ Optional properties:
>    through pmic_power_en
>  - clocks: Any internal or external clocks feeding in to rtc
>  - clock-names: Corresponding names of the clocks
> +- gpio-controller: Mark as gpio controller when using ext_wakeup
> +- #gpio-cells: Should be set to 2
> +- ngpios: Number of ext_wakeup sources supported by processor (board)

This is not how this property is intended to be used.

> +- ext-wakeup-gpios: List of ext_wakeup sources to configure

This doesn't belong here. It should be in the PMIC node if that is where 
it is attached.

Rob

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
