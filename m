From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] gpio: rcar: Add R8A7743 (RZ/G1M) support
Date: Fri, 16 Jun 2017 20:24:56 +0300
Message-ID: <d7242a3b-bf30-1683-29e0-90c847ce8eaf@cogentembedded.com>
References: <1497619944-61410-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1497619944-61410-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello!

On 06/16/2017 04:32 PM, Biju Das wrote:

> Renesas RZ/G1M (R8A7743 SoC) GPIO blocks are identical to the R-Car Gen2

    SoC should be outside the parens.

> family. Add support for its GPIO controllers.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> ---
>  Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 1 +
>  drivers/gpio/gpio-rcar.c                                     | 4 ++++
>  2 files changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> index 7c1ab3b..1cc3cfe 100644
> --- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> +++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> @@ -3,6 +3,7 @@
>  Required Properties:
>
>    - compatible: should contain one of the following.
> +    - "renesas,gpio-r8a7743": for R8A7743 (RZ-G1M) compatible GPIO controller.

    Not RZ/G1M?

[...]

MBR, Sergei
