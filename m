Return-Path: <robherring2@gmail.com>
Date: Mon, 11 Jun 2018 12:27:34 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: mfd: fix documentation of tps65911
Message-ID: <20180611182734.GA17896@rob-hp-laptop>
References: <1528146863.2818.23.camel@googlemail.com>
 <20180605070457.GF21163@dell>
 <1528190809.2527.5.camel@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528190809.2527.5.camel@googlemail.com>
To: Christoph Fritz <chf.fritz@googlemail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Tony Lindgren <tony@atomide.com>, devicetree <devicetree@vger.kernel.org>, linux-omap@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Jun 05, 2018 at 11:26:49AM +0200, Christoph Fritz wrote:
> This patch fixes documentation of tps65911 because its list of
> compatible regulators contains wrongly vdd3 instead of vdd2.
> 
> Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
> ---
>  Documentation/devicetree/bindings/mfd/tps65910.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
