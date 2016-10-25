From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/12] dt: arm: shmobile: add H3ULCB board DT bindings
Date: Tue, 25 Oct 2016 14:48:59 +0200
Message-ID: <CAMuHMdWsxu0bBTFHZYh6+eowXkx=G-Uo06g7TOLE7Ek7vaHHYA@mail.gmail.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637741-14624-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1472637741-14624-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Wed, Aug 31, 2016 at 12:02 PM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> Add H3ULCB Device tree bindings Documentation, listing it as a supported
> board.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes in version 2:
> - none
> Changes in version 3:
> - none
>
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index 5484c31d..2f0b716 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -49,6 +49,8 @@ Boards:
>      compatible = "renesas,genmai", "renesas,r7s72100"
>    - Gose
>      compatible = "renesas,gose", "renesas,r8a7793"
> +  - H3ULCB (RTP0RC7795SKB00010S)
> +    compatible = "renesas,h3ulcb", "renesas,r8a7795";

Should this have been

        H3SK (R-Car Starter Kit Premier, RTP0RC7795SKB00010S)
        compatible = "renesas,h3sk", "renesas,r8a7795";

instead?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
