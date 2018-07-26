Return-Path: <SRS0=Qj0e=KK=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <20180725212220.44525-1-chris.brandt@renesas.com> <20180725212220.44525-4-chris.brandt@renesas.com>
In-Reply-To: <20180725212220.44525-4-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Jul 2018 09:25:18 +0200
Message-ID: <CAMuHMdV5CW8MN6hfE4WUH+7b8yKBwChVc5rXGSAbAyf+KiQ+7g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: arm: Document RZ/A2 SoC DT bindings
Content-Type: text/plain; charset="UTF-8"
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris,

On Wed, Jul 25, 2018 at 11:22 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add device tree bindings documentation for Renesas RZ/A2 (r7s9210) SoC.
> Also document new option for "renesas,bsid"
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for ypur patch!

> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt

> @@ -148,7 +150,7 @@ product and revision information.  If present, a device node for this register
>  should be added.

Please add "or Boundary Scan ID Register" to the paragraph above.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
