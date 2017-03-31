From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v6 2/2] arm64: dts: move from ARCH_VULCAN to ARCH_THUNDER2
Date: Fri, 31 Mar 2017 11:44:13 +0200
Message-ID: <CAK8P3a1db5vs9MtbN2ZcKFF2=9AH+omVaGi0ndBcSEW2t0H7Hg@mail.gmail.com>
References: <1489313015-4783-1-git-send-email-jnair@caviumnetworks.com>
 <1489495634-2920-1-git-send-email-jnair@caviumnetworks.com> <1489495634-2920-3-git-send-email-jnair@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489495634-2920-3-git-send-email-jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 14, 2017 at 1:47 PM, Jayachandran C
<jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org> wrote:
> Move and update device tree files as part of transition from Broadcom
> Vulcan to Cavium ThunderX2.
>
> The changes are to:
>  * rename dts/broadcom/vulcan.dtsi to cavium/thunder2-99xx.dtsi,
>    update cpu cores to be "cavium,thunder2", and update SoC to be
>    "cavium,thunderx2-cn9900"
>  * move SoC dts/broadcom/vulcan-eval.dtsi to cavium/thunder2-99xx.dtsi
>    and update board name string
>  * Update dts/broadcom/Makefile not to build vulcan dtbs
>  * Update dts/cavium/Makefile to build thunder2 dtbs
>
> No changes to the dts contents except the updated "compatible" and
> "model" properties.
>
> Signed-off-by: Jayachandran C <jnair-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> Reviewed-by: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Applied to next/dt64.

The contents are fine, but I'd recommend using 'git format-patch -M'
when creating a submission for easier review, in case you do another
patch with a rename in the future.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
