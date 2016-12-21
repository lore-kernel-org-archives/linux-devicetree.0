From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] doc: DT: add new compatible to fixed regulator's
 binding
Date: Tue, 20 Dec 2016 21:40:22 -0600
Message-ID: <20161221034022.henwykufq3c7nax3@rob-hp-laptop>
References: <1481903550-3582-1-git-send-email-bgolaszewski@baylibre.com>
 <1481903550-3582-3-git-send-email-bgolaszewski@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1481903550-3582-3-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>, Patrick Titiano <ptitiano@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 16, 2016 at 04:52:29PM +0100, Bartosz Golaszewski wrote:
> Extend the fixed regulator's device tree bindings with a new
> compatible describing GPIO-driven power load switches.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  Documentation/devicetree/bindings/regulator/fixed-regulator.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
> index 4fae41d..306931c 100644
> --- a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
> +++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
> @@ -1,7 +1,9 @@
>  Fixed Voltage regulators
>  
>  Required properties:
> -- compatible: Must be "regulator-fixed";
> +- compatible:
> +	"regulator-fixed" for regular fixed-regulators
> +	"gpio-power-switch" for gpio-driven power load switches

Probably add "... which do no regulation" along the lines of Mark's 
comment.

>  
>  Optional properties:
>  - gpio: gpio to use for enable control
> -- 
> 2.9.3
> 
