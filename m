From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v4 00/12] ARM: dts: renesas: Update DTS for CMT DT
 binding rework
Date: Wed, 29 Nov 2017 11:46:44 +0100
Message-ID: <20171129104643.7gcfalflbbcxqf3y@verge.net.au>
References: <1511876856-9495-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1511876856-9495-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 28, 2017 at 02:47:24PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series updates the CMT device nodes in the various Renesas DTS
> files sh_cmt clocksource driver for the recent DT binding rework that was
> merged in v4.14-rc1 and v4.15-rc1.
> 
> This series is an evolutionary improvement of Magnus Damm's series "[PATCH
> v2 00/11] clocksource: sh_cmt: DT binding rework V2":
> 
>   - Patches 1-5 update the compatible values for the CMT0 and CMT1 device
>     nodes on R-Mobile APE6 and R-Car Gen2,
>   - Patches 6-12 remove the now obsolete "renesas,channels-mask" properties
>     from the CMT device nodes on all affected SoCs.
> 
> Changes compared to v3:
>   - Rebase against renesas-devel-20171127-v4.15-rc1,
> 
> Changes compared to v2:
>   - Take over from Magnus,
>   - Update compatible values,
>   - Split in per-SoC patches,
> 
> Dependencies:
>   - "[PATCH v3 0/7] clocksource: sh_cmt: Update driver for DT binding
>     rework" was merged in v4.15-rc1.
> 
> This has been part of renesas-drivers for more than two months, and part
> of my local development tree for more than two years.
> 
> Thanks for applying!

Thanks, applied.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
