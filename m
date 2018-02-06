From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 05/11] arm64: dts: renesas: initial R8A77980 SoC device
 tree
Date: Tue, 6 Feb 2018 13:52:26 +0100
Message-ID: <20180206125225.apsqhtozwy4iaijc@verge.net.au>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
 <32142684-d5cf-035f-8401-86a36dcbafd6@cogentembedded.com>
 <CAMuHMdWad2OJ33Hu0KbYS3nLWhgmj81_wRbtwApw-N81q3+nsA@mail.gmail.com>
 <ad83625d-c166-cacb-eae2-a6d64f7d2b26@cogentembedded.com>
 <CAMuHMdVfuruK36OUVdOcHaJogoM8oee_+b+4UzjBfUBoMiEbOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVfuruK36OUVdOcHaJogoM8oee_+b+4UzjBfUBoMiEbOQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Feb 05, 2018 at 02:51:43PM +0100, Geert Uytterhoeven wrote:
> Hi Sergei,
> 
> On Mon, Feb 5, 2018 at 2:48 PM, Sergei Shtylyov
> <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> > On 2/5/2018 4:32 PM, Geert Uytterhoeven wrote:
> >>> The initial R8A77980 SoC device tree including Cortex-A53 CPU, GIC,
> >>> timer,
> >>> CPG, RST, and SYSC.
> >>>
> >>> Based on the original (and large) patch by Vladimir Barinov.
> >>>
> >>> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> >>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> >>
> >>
> >> Thanks for your patch!
> >>
> >>> --- /dev/null
> >>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >>> @@ -0,0 +1,122 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +/*
> >>> + * Device Tree Source for the r8a77980 SoC
> >>> + *
> >>> + * Copyright (C) 2018 Renesas Electronics Corp.
> >>> + * Copyright (C) 2018 Cogent Embedded, Inc.
> >>> + */
> >>> +
> >>> +#include <dt-bindings/interrupt-controller/irq.h>
> >>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> >>> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> >>
> >> I think you want to leave out the above #include, as it will go upstream
> >> through a different path (you're already using hardcoded clock numbers,
> >> assuming the same).
> >
> >    I still need CPG_{CORE|MOD}.
> 
> You're right. Please ignore my comment.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Thanks, applied.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
