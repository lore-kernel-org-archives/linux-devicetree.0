From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH RESEND] phy: rcar-gen2: Add r8a7743/5 support
Date: Wed, 25 Oct 2017 12:32:37 +0200
Message-ID: <CAMuHMdUWtJvYsW3gaCr=Wh-tEauO6E=ue95MK0DXYJFb7c-OJw@mail.gmail.com>
References: <1507544543-28654-1-git-send-email-biju.das@bp.renesas.com>
 <bcfa1e90-c497-ee29-687d-9f9a04ce2d4b@ti.com> <87211738-8d65-32c0-fb6b-dc2cd395016a@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87211738-8d65-32c0-fb6b-dc2cd395016a-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi KIshon,

On Wed, Oct 25, 2017 at 12:30 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
> On Wednesday 18 October 2017 05:10 PM, Kishon Vijay Abraham I wrote:
>> On Monday 09 October 2017 03:52 PM, Biju Das wrote:
>>> Add USB PHY support for r8a7743/5 SoC. Renesas RZ/G1[ME] (R8A7743/5)
>>> USB PHY is identical to the R-Car Gen2 family.
>>>
>>> Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>>> Acked-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
>>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>
>> merged, thanks!
>
> just realized $subject is misleading since this is only dt-binding patch. Do
> you plan to send the driver patch too?

There's no need to update the driver, as it matches against the generic fallback
compatible value "renesas,rcar-gen2-usb-phy".

>>> ---
>>> This patch is tested against Linux next tag next-20170929.
>>>
>>>  Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
>>> index 91da947..eeb9e18 100644
>>> --- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
>>> +++ b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
>>> @@ -4,10 +4,13 @@ This file provides information on what the device node for the R-Car generation
>>>  2 USB PHY contains.
>>>
>>>  Required properties:
>>> -- compatible: "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
>>> +- compatible: "renesas,usb-phy-r8a7743" if the device is a part of R8A7743 SoC.
>>> +          "renesas,usb-phy-r8a7745" if the device is a part of R8A7745 SoC.
>>> +          "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
>>>            "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC.
>>>            "renesas,usb-phy-r8a7794" if the device is a part of R8A7794 SoC.
>>> -          "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 compatible device.
>>> +          "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 or
>>> +                                      RZ/G1 compatible device.
>>>
>>>            When compatible with the generic version, nodes must list the
>>>            SoC-specific version corresponding to the platform first

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
