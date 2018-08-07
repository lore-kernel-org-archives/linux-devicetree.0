Return-Path: <robherring2@gmail.com>
Date: Tue, 7 Aug 2018 11:43:49 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: gpio: rcar: Add gpio-reserved-ranges
 support
Message-ID: <20180807174349.GA10321@rob-hp-laptop>
References: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
 <1533628626-26503-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1533628626-26503-3-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Aug 07, 2018 at 08:57:03AM +0100, Biju Das wrote:
> Update the DT bindings documentation with the optional gpio-reserved-ranges
> properties.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
> V2 --> V3
>   * Incorporated review comments.
> ---
>  .../devicetree/bindings/gpio/renesas,gpio-rcar.txt | 61 +++++++++++++---------
>  1 file changed, 35 insertions(+), 26 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
