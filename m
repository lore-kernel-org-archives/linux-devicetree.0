From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v4 4/6] ARM: dts: r8a7794: add Audio-DMAC support
Date: Mon, 8 Aug 2016 15:15:15 +0200
Message-ID: <CAMuHMdVdb5EB7Pt3YYKXsRWAdCpKj6cg1dapZd-johzW7axpgg@mail.gmail.com>
References: <3910788.ckTpUWEs6B@wasted.cogentembedded.com> <6419837.qqlciQTB8q@wasted.cogentembedded.com>
 <CAMuHMdWofFF9PrBW4n0GTytP8Mm7_mwPU=O7mXRPWUDXBOfOTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWofFF9PrBW4n0GTytP8Mm7_mwPU=O7mXRPWUDXBOfOTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 8, 2016 at 3:14 PM, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> On Wed, Jul 27, 2016 at 11:02 PM, Sergei Shtylyov
> <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
>> Describe Audio-DMAC in the R8A7794 device tree.
>>
>> This patch is loosely based on the commit 8994fff67761 ("ARM: shmobile:
>> r8a7791: Add Audio DMAC devices to DT").
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>
>> ---
>> Changes in version 4:
>> - refreshed the patch.
>>
>> Changes in version 3:
>> - refreshed the patch.
>>
>>  arch/arm/boot/dts/r8a7794.dtsi |   28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
>> ===================================================================
>> --- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
>> +++ renesas/arch/arm/boot/dts/r8a7794.dtsi
>> @@ -296,6 +296,34 @@
>>                 dma-channels = <15>;
>>         };
>>
>> +       audma0: dma-controller@ec700000 {

>> +               dma-channels = <13>;
>> +       };
>
> According to R-Car-Gen2-common-v2.00.pdf (Audio-DMAC and INTC-SYS
> chapters), V2H has only 2 audio DMA channels, not 13.

Scrap it, this is a patch for E2, not V2H.

Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
