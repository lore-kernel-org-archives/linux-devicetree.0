From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] usb: renesas_usbhs: Add compatible string for r8a7743/5
Date: Fri, 6 Oct 2017 09:34:22 +0200
Message-ID: <CAMuHMdVOWn97YnyO5A3_3cjYfykrWYaaSVun2dVX2RrHSuB5tw@mail.gmail.com>
References: <1507216358-917-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1507216358-917-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Chris Paterson <chris.paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Biju,

On Thu, Oct 5, 2017 at 5:12 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds support for r8a7743/5 SoC.  The Renesas RZ/G1[ME]
> (R8A7743/5) usbhs is identical to the R-Car Gen2 family.
>
> This doesn't change the driver, so it does nothing by itself.  But it does

Wording it like this may give the wrong impression to the casual reader
that a driver change will be submitted separately.
No driver change is needed due to the fallback compatible value
"renesas,rcar-gen2-usbhs".

> mean that checkpatch won't complain about a future patch that adds
> "renesas,usbhs-r8a7743" or "renesas,usbhs-r8a7745" to a DT, which helps
> ensure that shipped DTs use documented compatibility strings.

Adding the SoC-specific compatible values here has two purposes:
  1. Document which SoCs have this hardware module,
  2. Allow checkpatch to validate compatible values.

> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -3,6 +3,8 @@ Renesas Electronics USBHS driver
>  Required properties:
>    - compatible: Must contain one or more of the following:
>
> +       - "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
> +       - "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
>         - "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
>         - "renesas,usbhs-r8a7791" for r8a7791 (R-Car M2-W) compatible device
>         - "renesas,usbhs-r8a7792" for r8a7792 (R-Car V2H) compatible device
> @@ -10,7 +12,7 @@ Required properties:
>         - "renesas,usbhs-r8a7794" for r8a7794 (R-Car E2) compatible device
>         - "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
>         - "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
> -       - "renesas,rcar-gen2-usbhs" for R-Car Gen2 compatible device
> +       - "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible device
>         - "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
