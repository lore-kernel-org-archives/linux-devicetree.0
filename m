From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 0/7] Add R8A7743/SK-RZG1M board support
Date: Wed, 26 Oct 2016 16:23:33 +0300
Message-ID: <1a85f851-29ec-1c14-8905-8b0645f5bb1c@cogentembedded.com>
References: <2719479.geOc9vqcRS@wasted.cogentembedded.com>
 <CAMuHMdUNgnYc1O7DATNH1r9SQ72eqtxwFvqcen08Tq+Er3LuvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUNgnYc1O7DATNH1r9SQ72eqtxwFvqcen08Tq+Er3LuvQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/26/2016 03:08 PM, Geert Uytterhoeven wrote:

>>    Here's the set of 8 patches against Simon Horman's 'renesas.git' repo's
>> 'renesas-devel-20161021-v4.9-rc1' tag. I'm adding the device tree support for
>> the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the board
>> seems identical to the R8A7791/Porter board. The device tree patches depend on
>> the R8A7743 CPG/MSSR driver series just posted in order to compile and work.
>
> They depend only on "[PATCH v3 1/2] ARM: shmobile: r8a7743: add CPG clock
> index macros" of that series, right?
>
> "[PATCH v3 2/2] clk: renesas: cpg-mssr: add R8A7743 support" is not needed,

    How would "clocks" props _work_ without this patch?

> and introduces an additional dependency on "[PATCH 1/3] clk: renesas:
> cpg-mssr: add common R-Car Gen2 support".

    Yes, of course...

> Gr{oetje,eeting}s,
>
>                         Geert

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
