From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 07/11] arm64: dts: renesas: r8a77980: add [H]SCIF support
Date: Tue, 6 Feb 2018 19:41:07 +0300
Message-ID: <f440c853-d955-bba9-dc58-d7670f521a73@cogentembedded.com>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
 <169ed4ac-1b8b-cf8c-45c4-957ebbdf3f5e@cogentembedded.com>
 <CAMuHMdWXc=1s5rMU5Tc_=tH4jrH+5P6z52J3ihiyYfseTpQ-kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdWXc=1s5rMU5Tc_=tH4jrH+5P6z52J3ihiyYfseTpQ-kw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-MW
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/06/2018 02:58 PM, Geert Uytterhoeven wrote:

>> Describe [H]SCIF ports in the R8A77980 device tree.
>>
>> Based on the original (and large) patch by Vladimir Barinov.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> 
> Thanks for your patch!
> 
>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> 
>> @@ -85,6 +92,150 @@
>>                         #power-domain-cells = <1>;
>>                 };
>>
>> +               hscif0: serial@e6540000 {
>> +                       compatible = "renesas,hscif-r8a77980",
>> +                                    "renesas,rcar-gen3-hscif",
>> +                                    "renesas,hscif";
>> +                       reg = <0 0xe6540000 0 0x60>;
>> +                       interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks = <&cpg CPG_MOD 520>,
>> +                                <&cpg CPG_CORE 16>,
> 
> Shouldn't this be 19 (S3D1) instead of 16 (S2D1)?

   Seems like that... at least after out chat. :-)

> With that fixed (for all (H)SCIF ports);

   The manual tells me SCKi for the SCIF ports should be the same S3D1.

> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> 
> Gr{oetje,eeting}s,
> 

MBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
