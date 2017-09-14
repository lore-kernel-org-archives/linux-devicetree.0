From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 01/18] dt: arm: shmobile: add M3ULCB Kingfisher board
 DT bindings
Date: Thu, 14 Sep 2017 17:19:03 +0200
Message-ID: <CAMuHMdXQrOh3=JXwnaVvari7HC463iPOZYZp1OT8fap=agYBRw@mail.gmail.com>
References: <1505398720-4535-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdXtp0w071eAes0Khpi4jHkkgpZ36vbnReGsNWZ-73qa0g@mail.gmail.com> <0bbc8962-c7f3-3889-1add-9984fa8cea88@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0bbc8962-c7f3-3889-1add-9984fa8cea88-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Thu, Sep 14, 2017 at 5:00 PM, Vladimir Barinov
<vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> On 14.09.2017 17:55, Geert Uytterhoeven wrote:
>> On Thu, Sep 14, 2017 at 4:18 PM, Vladimir Barinov
>> <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
>>> Add M3ULCB Kingfisher Device tree bindings Documentation, listing it as a
>>> supported board.
>>>
>>> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>> ---
>>> Changes in version 2:
>>> - added own compatible value "shimafuji,kingfisher"
>>
>> Thanks for the update!
>>
>>> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
>>> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
>>> @@ -85,6 +85,8 @@ Boards:
>>>       compatible = "renesas,lager", "renesas,r8a7790"
>>>     - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKBX0010SA09 (M3 ES1.0))
>>>       compatible = "renesas,m3ulcb", "renesas,r8a7796";
>>> +  - M3ULCB Kingfisher (SBEV-RCAR-KF-M03)
>>> +    compatible = "shimafuji,kingfisher", "renesas,m3ulcb",
>>> "renesas,r8a7796";
>>>     - Marzen (R0P7779A00010S)
>>>       compatible = "renesas,marzen", "renesas,r8a7779"
>>>     - Porter (M2-LCDP)
>>
>> As Kingfisher is an extension board, I meant to have a separate entry for
>> it,
>> not tied to M3ULCB or H3ULCB:
>>
>>    - M3ULCB Kingfisher (SBEV-RCAR-KF-M03)

Sorry, bogus "M3ULCB" above.

>>      compatible = "shimafuji,kingfisher"
>>
>> That way you don't need to list it twice (the board part number is the
>> same
>> for M3ULCB Kingfisher and H3ULCB Kingfisher anyway).
>> Do you agree?
>
> Sorry for misunderstanding.
>
> Do you mean to add such entry:
>
>   - Kingfisher (SBEV-RCAR-KF-M03)
>     compatible = "shimafuji,kingfisher"

Exactly.

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
