From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v6 03/17] dts: mpc512x: add clock related device tree
 specs
Date: Sat, 7 Dec 2013 10:34:34 +0100
Message-ID: <20131207103434.54a057ab@crub>
References: <1385851897-23475-1-git-send-email-gsi@denx.de>
	<1385851897-23475-4-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385851897-23475-4-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 30 Nov 2013 23:51:23 +0100
Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org> wrote:

> this addresses the clock driver aka provider's side of clocks
> - introduce a 'clocks' subtree with an 'osc' node for the crystal
>   or oscillator SoC input (fixed frequency)
> - the 'clock@f00' clock-control-module node references the 'osc' for
>   its input, and is another provider for all the clocks which the
>   CCM component manages
> - prepare for future references to clocks from peripheral nodes
>   by means of the <&clks ID> syntax and symbolic ID names which a
>   header file provides
> - provide default values with 33MHz oscillator frequency in the
>   common include (the 66MHz IPS bus already was there), and add
>   override values for the ifm AC14xx board which deviates from
>   the reference design (25MHz xtal, 80MHz IPS bus)
> 
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Reviewed-by: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> # for v3, before &osc
> Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
> ---
>  arch/powerpc/boot/dts/ac14xx.dts   |    7 +++++++
>  arch/powerpc/boot/dts/mpc5121.dtsi |   18 +++++++++++++++++-
>  2 files changed, 24 insertions(+), 1 deletion(-)

applied to next. Thanks!

Anatolij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
