From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: add a 'drive-strength-uA'
 property
Date: Tue, 30 Apr 2019 10:12:43 -0500
Message-ID: <20190430151243.GA6879@bogus>
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <20190418124758.24022-2-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190418124758.24022-2-glaroque@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: linus.walleij@linaro.org, mark.rutland@arm.com, khilman@baylibre.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 18, 2019 at 02:47:55PM +0200, Guillaume La Roque wrote:
> This property allow drive-strength parameter in uA instead of mA.
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> index cef2b5855d60..fc7018459aa2 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> @@ -258,6 +258,7 @@ drive-push-pull		- drive actively high and low
>  drive-open-drain	- drive with open drain
>  drive-open-source	- drive with open source
>  drive-strength		- sink or source at most X mA
> +drive-strength-uA	- sink or source at most X uA
>  input-enable		- enable input on pin (no effect on output, such as
>  			  enabling an input buffer)
>  input-disable		- disable input on pin (no effect on output, such as
> @@ -326,6 +327,8 @@ arguments are described below.
>  
>  - drive-strength takes as argument the target strength in mA.
>  
> +- drive-strength-uA takes as argument the target strength in uA.
> +

We have standard unit suffixes defined in bindings/property-units.txt. 
Use them please.

Rob
