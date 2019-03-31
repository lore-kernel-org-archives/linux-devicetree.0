From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: meson: Add drive-strength
 property
Date: Sun, 31 Mar 2019 01:40:26 -0500
Message-ID: <20190330212830.GA28281@bogus>
References: <20190314163725.7918-1-jbrunet@baylibre.com>
 <20190314163725.7918-2-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314163725.7918-2-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Guillaume La Roque <glaroque@baylibre.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 14, 2019 at 05:37:24PM +0100, Jerome Brunet wrote:
> From: Guillaume La Roque <glaroque@baylibre.com>
> 
> Add optional drive-strength property
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> index a47dd990a8d3..4e3d5a27c91c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> @@ -51,6 +51,9 @@ Configuration nodes support the generic properties "bias-disable",
>  "bias-pull-up" and "bias-pull-down", described in file
>  pinctrl-bindings.txt
>  
> +Optional properties :
> + - drive-strength: Drive strength for the specified pins in uA.

The standard definition says this is in mA.

> +
>  === Example ===
>  
>  	pinctrl: pinctrl@c1109880 {
> -- 
> 2.20.1
> 
