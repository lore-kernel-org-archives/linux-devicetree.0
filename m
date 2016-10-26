From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH v3 01/12] dt: arm: shmobile: add H3ULCB board DT bindings
Date: Wed, 26 Oct 2016 13:27:26 +0300
Message-ID: <936e63bd-4f01-891f-24da-4c34caf94bcf@cogentembedded.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637741-14624-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdWsxu0bBTFHZYh6+eowXkx=G-Uo06g7TOLE7Ek7vaHHYA@mail.gmail.com>
 <83a48012-888e-3f86-c9a0-8cddb05ee2fe@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <83a48012-888e-3f86-c9a0-8cddb05ee2fe@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Yusuke Goda <yusuke.goda.sx@renesas.com>
List-Id: devicetree@vger.kernel.org

Hi Geert,

I've got this message from Renesas:
"

Please use H3ULCB/M3ULCB in upstream.
# I got an agreement among parties.

Board name in community: ULCB (= development code name)
Official name (product/brand name): Starter Kit Pro/Premier
"

Renaming  H3ULCB -> H3SK is not desired for Renesas.

What do you think to append the product/brand name only? :

-        H3ULCB (RTP0RC7795SKB00010S)
+       H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKB00010S)
          compatible = "renesas,h3ulcb", "renesas,r8a7795";

Regards,
Vladimir

On 25.10.2016 18:06, Vladimir Barinov wrote:
> Hi Geert,
>
> On 25.10.2016 15:48, Geert Uytterhoeven wrote:
>> Hi Vladimir,
>>
>> On Wed, Aug 31, 2016 at 12:02 PM, Vladimir Barinov
>> <vladimir.barinov@cogentembedded.com> wrote:
>>> Add H3ULCB Device tree bindings Documentation, listing it as a 
>>> supported
>>> board.
>>>
>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
>>> Acked-by: Rob Herring <robh@kernel.org>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> Changes in version 2:
>>> - none
>>> Changes in version 3:
>>> - none
>>>
>>>   Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt 
>>> b/Documentation/devicetree/bindings/arm/shmobile.txt
>>> index 5484c31d..2f0b716 100644
>>> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
>>> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
>>> @@ -49,6 +49,8 @@ Boards:
>>>       compatible = "renesas,genmai", "renesas,r7s72100"
>>>     - Gose
>>>       compatible = "renesas,gose", "renesas,r8a7793"
>>> +  - H3ULCB (RTP0RC7795SKB00010S)
>>> +    compatible = "renesas,h3ulcb", "renesas,r8a7795";
>> Should this have been
>>
>>          H3SK (R-Car Starter Kit Premier, RTP0RC7795SKB00010S)
>>          compatible = "renesas,h3sk", "renesas,r8a7795";
>>
>> instead?
> Actually you are right, since Renesas naming policy changed: 
> originally the assigned name was H3ULCB and all boards that I have 
> labled as ULCB.
> Now the official name is  "R-Car Starter Kit Premier" and "R-Car 
> Starter Kit Pro" for H3/M3 respectively.
>
> I've got this message from Renesas:
> "
>
> 1. Official name for Gen3 low cost board
>
>  R-Car Starter Kit Premier (We called "H3ULCB")
>  R-Car Starter Kit Pro     (We called "M3ULCB")
>
>  1-1. Please change the "M3ULCB/H3ULCB" to
>       "R-Car Starter Kit Pro/Premier" on elinux.
>  1-2. You DON'T have to change in source code.
>       You can use ULCB in Kernel, u-boot, Yocto recipe.
>  1-3. Please explain relations of "ULCB" and "Starter Kit" on elinux.
>     Ex) R-Car Starter Kit Premier = H3ULCB
> "
>
>
> What do think about changing only first line and leave "compatible" as 
> is, since h3ulcb have been using a while by different customers and 
> renaming of the board name will confuse? (If we change it to 
> "renesas,h3sk " then probably we need to rename the dts file 
> r8a7795-h3ulcb.dts and its content)
>
> -  - H3ULCB (RTP0RC7795SKB00010S)
> +  - H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKB00010S)
>
>
> And would be the best for M3 Starter Kit?
> The M3 Starter Kit board labeled as "M3 StarterKit", bit it is the 
> same board with different SiP.
>
> Should it look like:
>
>         M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKB00010S)
>         compatible = "renesas,m3ulcb", "renesas,r8a7796";
>
> or
>
>         M3SK (R-Car Starter Kit Pro, RTP0RC7796SKB00010S)
>         compatible = "renesas,m3sk", "renesas,r8a7796";
>
>
> Regards,
> Vladimir
>>
>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
>> -- 
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
>> geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a 
>> hacker. But
>> when I'm talking to journalists I just say "programmer" or something 
>> like that.
>>                                  -- Linus Torvalds
>
>
