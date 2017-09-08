From: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 01/18] dt: arm: shmobile: add M3ULCB Kingfisher board DT
 bindings
Date: Fri, 8 Sep 2017 10:05:40 +0300
Message-ID: <a106fe34-d584-1560-797c-581ffc33a305@cogentembedded.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737303-22874-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdUi9THE7nTd54C22K6kOo_Ye5LkhTrRZPNfcHfWCiBsUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUi9THE7nTd54C22K6kOo_Ye5LkhTrRZPNfcHfWCiBsUQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

On 07.09.2017 13:58, Geert Uytterhoeven wrote:
> Hi Vladimir,
>
> On Thu, Sep 7, 2017 at 12:35 AM, Vladimir Barinov
> <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
>> Add M3ULCB Kingfisher Device tree bindings Documentation, listing it as a
>> supported board.
>>
>> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> Thanks for your patch!
>
>> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
>> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
>> @@ -85,6 +85,7 @@ Boards:
>>     - Lager (RTP0RC7790SEB00010S)
>>       compatible = "renesas,lager", "renesas,r8a7790"
>>     - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
>> +    M3ULCB Kingfisher (SBEV-RCAR-KF-M03)
> As the Kingfisher is an extension board (and you added the same board part
> number to the H3ULCB section in patch 02/18), shouldn't it have its own
> compatible value "shimafuji,kingfisher" instead?
Thank you for this suggestion.

This looks very meaningful for boards differentiation.

> Then this can be used in ulcb-kf.dtsi:
>
>      compatible = "shimafuji,kingfisher";
>
> and appended (overridden, as there's no /append-property/ directive in dtc
> yet?) in the board files, e.g. r8a7796-m3ulcb-kf.dts:
>
>      compatible = "shimafuji,kingfisher", "renesas,m3ulcb", "renesas,r8a7796";
>
> Does that make sense?
Yes.
I will rework this in V2 patchset according to your suggestion.

>
>>       compatible = "renesas,m3ulcb", "renesas,r8a7796";
>>     - Marzen (R0P7779A00010S)
>>       compatible = "renesas,marzen", "renesas,r8a7779"
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds


-- 
Regards,
Vladimir

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
