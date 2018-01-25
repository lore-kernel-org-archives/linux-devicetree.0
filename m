From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: timer: renesas, cmt: Document
 r8a774[35] CMT support
Date: Thu, 25 Jan 2018 09:09:59 +0100
Message-ID: <1acdad3b-c2fd-df1d-f25b-cf80b79a9842@linaro.org>
References: <1513618743-4773-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513618743-4773-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <SG2PR06MB088625944BCD8F4307315520C0E20@SG2PR06MB0886.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SG2PR06MB088625944BCD8F4307315520C0E20-ESzmfEwOt/zNWVFMfLWNqm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24/01/2018 17:49, Fabrizio Castro wrote:
> Hello Daniel,
> 
> I am sorry to bother you, just wondering if you think there are any chances for this patch to applied on top of v4.16?

You can take it through the renesas tree.

Acked-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>


>> Subject: [PATCH v2 1/3] dt-bindings: timer: renesas, cmt: Document r8a774[35] CMT support
>>
>> Document SoC specific compatible strings for r8a7743 and r8a7745.
>> No driver change is needed as the fallback strings will activate
>> the right code.
>>
>> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>> Reviewed-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Reviewed-by: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
>> ---
>> v1->v2:
>> * "R-Car Gen2 or RZ/G1." -> "R-Car Gen2 and RZ/G1."
>> * "all the R-Car" -> "R-Car"
>>
>>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>> index d740989..b40add2 100644
>> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
>> @@ -22,6 +22,10 @@ Required Properties:
>>
>>      - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
>>      - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
>> +    - "renesas,r8a7743-cmt0" for the 32-bit CMT0 device included in r8a7743.
>> +    - "renesas,r8a7743-cmt1" for the 48-bit CMT1 device included in r8a7743.
>> +    - "renesas,r8a7745-cmt0" for the 32-bit CMT0 device included in r8a7745.
>> +    - "renesas,r8a7745-cmt1" for the 48-bit CMT1 device included in r8a7745.
>>      - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
>>      - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
>>      - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
>> @@ -31,10 +35,12 @@ Required Properties:
>>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
>>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
>>
>> -    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2.
>> -    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2.
>> -These are fallbacks for r8a73a4 and all the R-Car Gen2
>> -entrieslisted above.
>> +    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
>> +and RZ/G1.
>> +    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2
>> +and RZ/G1.
>> +These are fallbacks for r8a73a4, R-Car Gen2 and RZ/G1 entries
>> +listed above.
>>
>>    - reg: base address and length of the registers block for the timer module.
>>    - interrupts: interrupt-specifier for the timer, one per channel.
>> --
>> 2.7.4
> 
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
