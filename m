From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] dmaengine: usb-dmac: Add compatible string for r8a7743/5
Date: Fri, 6 Oct 2017 09:36:09 +0200
Message-ID: <CAMuHMdXMgwyJQfEb3_326vW6Kwsf548Yz=PuCoCABDa63R4gbg@mail.gmail.com>
References: <1507216771-8957-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507216771-8957-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Vinod Koul <vinod.koul@intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Biju,

On Thu, Oct 5, 2017 at 5:19 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds support for r8a7743/5 SoC. The Renesas RZ/G1[ME]
> (R8A7743/5) usbdmac engine is identical to the R-Car Gen2 family.
>
> This doesn't change the driver, so it does nothing by itself.  But it does

Wording it like this may give the wrong impression to the casual reader
that a driver change will be submitted separately.
No driver change is needed due to the fallback compatible value
"renesas,usb-dmac".

> mean that checkpatch won't complain about a future patch that adds
> "renesas,r8a7743-usb-dmac" or "renesas,r8a7745-usb-dmac" to a DT,
> which helps ensure that shipped DTs use documented compatibility strings.

Adding the SoC-specific compatible values here has two purposes:
  1. Document which SoCs have this hardware module,
  2. Allow checkpatch to validate compatible values.

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> +++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> @@ -3,6 +3,8 @@
>  Required Properties:
>  -compatible: "renesas,<soctype>-usb-dmac", "renesas,usb-dmac" as fallback.
>         Examples with soctypes are:
> +         - "renesas,r8a7743-usb-dmac" (RZ/G1M)
> +         - "renesas,r8a7745-usb-dmac" (RZ/G1E)
>           - "renesas,r8a7790-usb-dmac" (R-Car H2)
>           - "renesas,r8a7791-usb-dmac" (R-Car M2-W)
>           - "renesas,r8a7793-usb-dmac" (R-Car M2-N)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
