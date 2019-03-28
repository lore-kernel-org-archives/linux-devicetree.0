From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 06/14] dt-bindings: clock: sunxi-ccu: remove bogus +
 before R40 compatible
Date: Thu, 28 Mar 2019 08:19:14 -0500
Message-ID: <20190328131914.GA31098@bogus>
References: <20190312152256.35574-1-icenowy@aosc.io>
 <20190312152256.35574-7-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190312152256.35574-7-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Tue, 12 Mar 2019 23:22:48 +0800, Icenowy Zheng wrote:
> When adding the R40 compatible string to the binding document, a + is
> left behind the string, which seems to be a fault when dealing with
> patches.
> 
> Remove the bogus + sign.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
