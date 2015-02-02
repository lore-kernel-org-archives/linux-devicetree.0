From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: shmobile: silk: initial device tree
Date: Mon, 02 Feb 2015 23:49:32 +0300
Message-ID: <54CFE2DC.10100@cogentembedded.com>
References: <201404250239.39150.sergei.shtylyov@cogentembedded.com> <1608366.HtA9yBksdO@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1608366.HtA9yBksdO-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 01/31/2015 01:52 AM, Sergei Shtylyov wrote:

> Add the initial device tree for the R8A7794 SoC based SILK low cost board.
> SCIF2 serial port support is included, so that the serial console can work.

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>

> ---
> This patch is against the 'renesas-devel-20150129-v3.19-rc6' tag of Simon
> Horman's 'renesas.git' repo.
>
>   arch/arm/boot/dts/Makefile         |    1
>   arch/arm/boot/dts/r8a7794-silk.dts |   41 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 42 insertions(+)
>
> Index: renesas/arch/arm/boot/dts/Makefile
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/Makefile
> +++ renesas/arch/arm/boot/dts/Makefile
> @@ -421,6 +421,7 @@ dtb-$(CONFIG_ARCH_SHMOBILE_MULTI) += eme
>   	r8a7791-koelsch.dtb \
>   	r8a7791-porter.dtb \

    Oops, the patch was additionally against the Henninger->Porter rename 
patch. I will fix that.

>   	r8a7794-alt.dtb \
> +	r8a7794-silk.dtb \
>   	sh73a0-kzm9g.dtb

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
