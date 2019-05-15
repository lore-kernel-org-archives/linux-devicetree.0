Return-Path: <SRS0=4cVb=TP=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20190514145605.19112-1-chris.brandt@renesas.com> <20190514145605.19112-13-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-13-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 May 2019 10:00:45 +0200
Message-ID: <CAMuHMdVKAB0CtqgEgyeoeFoFrg5sFdm03F_PDHztq224G_ugXg@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] dt-bindings: usb: renesas_usbhs: Add support for r7s9210
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, May 14, 2019 at 4:58 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for r7s9210 (RZ/A2M) SoC
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> index b8acc2a994a8..11c99d079dfb 100644
> --- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> +++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
> @@ -20,9 +20,11 @@ Required properties:
>         - "renesas,usbhs-r8a77990" for r8a77990 (R-Car E3) compatible device
>         - "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
>         - "renesas,usbhs-r7s72100" for r7s72100 (RZ/A1) compatible device
> +       - "renesas,usbhs-r7s9210" for r7s72100 (RZ/A2) compatible device

for r7s9210 ...

>         - "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
>         - "renesas,rcar-gen3-usbhs" for R-Car Gen3 or RZ/G2 compatible devices
>         - "renesas,rza1-usbhs" for RZ/A1 compatible device
> +       - "renesas,rza2-usbhs" for RZ/A2 compatible device
>
>         When compatible with the generic version, nodes must list the
>         SoC-specific version corresponding to the platform first followed

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
