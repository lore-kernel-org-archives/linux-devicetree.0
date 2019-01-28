MIME-Version: 1.0
Date: Mon, 28 Jan 2019 10:19:45 -0600
References: <20190128085529.20538-1-geert+renesas@glider.be>
In-Reply-To: <20190128085529.20538-1-geert+renesas@glider.be>
Message-ID: <CAL_JsqLERj+YvUKkSXGankR9+uraQPhy4iY=9HNpZZ-R=xh2yA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Fix SoC mismatch for Stout
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "open list:MEDIA DRIVERS FOR RENESAS - FCP" <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Jan 28, 2019 at 2:55 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> make dtbs_check:
>
>     arch/arm/boot/dts/r8a7790-stout.dt.yaml: compatible: ['renesas,stout', 'renesas,r8a7790'] is not valid under any of the given schemas
>
> The Stout development board has an R-Car H2 (r8a7790) SoC, not an R-Car
> H1 (r8a7779).
>
> Fixes: 12749350567c819d ("dt-bindings: arm: Convert Renesas board/soc bindings to json-schema")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
