From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 03/14] dt-bindings: pinctrl: add compatible string for
  Allwinner V3 pinctrl
Date: Thu, 28 Mar 2019 08:18:43 -0500
Message-ID: <20190328131843.GA30336@bogus>
References: <20190312152256.35574-1-icenowy@aosc.io>
 <20190312152256.35574-4-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190312152256.35574-4-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Jagan Teki <jagan@amarulasolutions.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

On Tue, 12 Mar 2019 23:22:45 +0800, Icenowy Zheng wrote:
> The Allwinner V3 SoC, despite come with the same die with V3s, has more
> GPIO pins than V3s, and a different compatible string for pinctrl is
> needed.
> 
> Add the compatible string for V3 pinctrl.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt      | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
