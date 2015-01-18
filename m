From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] AT91: DT: Watchdog, remove property idle halt by
 default
Date: Sun, 18 Jan 2015 09:08:20 +0100
Message-ID: <20150118090820.07856398@bbrezillon>
References: <1421531396-20188-1-git-send-email-sylvain.rochet@finsecur.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421531396-20188-1-git-send-email-sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylvain Rochet <sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>
Cc: Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sylvain,

On Sat, 17 Jan 2015 22:49:56 +0100
Sylvain Rochet <sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org> wrote:

> The behavior changed when watchdog properties were added to DT, it makes
> the watchdog not counting when CPU is in idle state, therefore the
> watchdog reset time depend on mean CPU usage and will not reset at all
> if the CPU stop working while it is in idle state, which is a very weird
> behavior.
> 
> Apply principle of least surprise on at91sam9260-wdt by removing idle
> halt flag by default.
> 
> Signed-off-by: Sylvain Rochet <sylvain.rochet-ETtyaVkrhkNWk0Htik3J/w@public.gmane.org>

Can you do this change for all impacted SoCs (here is a patch
doing it [1]) ?

Apart from that you can add my:

Acked-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Best Regards,

Boris

[1]http://code.bulix.org/weg3zv-87745

> ---
>  arch/arm/boot/dts/at91sam9x5.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
> index bbb3ba6..ce61f91 100644
> --- a/arch/arm/boot/dts/at91sam9x5.dtsi
> +++ b/arch/arm/boot/dts/at91sam9x5.dtsi
> @@ -1125,7 +1125,6 @@
>  				atmel,watchdog-type = "hardware";
>  				atmel,reset-type = "all";
>  				atmel,dbg-halt;
> -				atmel,idle-halt;
>  				status = "disabled";
>  			};
>  



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
