From: Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V5 2/4] dt-bindings: arm: Add bindings for SP9860G
Date: Thu, 6 Apr 2017 18:00:24 +0800
Message-ID: <CAAfSe-ubWB2HihhxD0b8Z5iUT1GKnJi0RfMzazmodKSkS19LHg@mail.gmail.com>
References: <1490594802-27073-1-git-send-email-chunyan.zhang@spreadtrum.com> <1490594802-27073-3-git-send-email-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490594802-27073-3-git-send-email-chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?B?T3Jzb24gWmhhaSAo57+f5LqsKQ==?= <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Greg,

I guess there will be no further comments on this patchset :), could
you please take the patches 2/3/4 through tty git?

Thanks,
Chunyan

On 27 March 2017 at 14:06, Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org> wrote:
> Added bindings for Spreadtrum SP9860G board and SC9860 SoC.
> This patch also revised bindings of SC9836 to make the format
> more clear.
>
> Signed-off-by: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/sprd.txt | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/sprd.txt b/Documentation/devicetree/bindings/arm/sprd.txt
> index 31a629d..3df034b 100644
> --- a/Documentation/devicetree/bindings/arm/sprd.txt
> +++ b/Documentation/devicetree/bindings/arm/sprd.txt
> @@ -1,11 +1,14 @@
>  Spreadtrum SoC Platforms Device Tree Bindings
>  ----------------------------------------------------
>
> -Sharkl64 is a Spreadtrum's SoC Platform which is based
> -on ARM 64-bit processor.
> +SC9836 openphone Board
> +Required root node properties:
> +       - compatible = "sprd,sc9836-openphone", "sprd,sc9836";
>
> -SC9836 openphone board with SC9836 SoC based on the
> -Sharkl64 Platform shall have the following properties.
> +SC9860 SoC
> +Required root node properties:
> +       - compatible = "sprd,sc9860"
>
> +SP9860G 3GFHD Board
>  Required root node properties:
> -        - compatible = "sprd,sc9836-openphone", "sprd,sc9836";
> +       - compatible = "sprd,sp9860g-1h10", "sprd,sc9860";
> --
> 2.7.4
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
