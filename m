From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH 1/7] dt-bindings: soc: new driver for DaVinci genpd
Date: Wed, 7 Feb 2018 15:47:09 -0600
Message-ID: <36aebdca-2a7d-07a3-8632-95992d74cae6@lechnology.com>
References: <20180207134553.13510-1-brgl@bgdev.pl>
 <20180207134553.13510-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180207134553.13510-2-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 02/07/2018 07:45 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Add a simple document for the DaVinci genpd driver. We use clock pm
> exclusively hence no reg property.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   .../devicetree/bindings/soc/ti,davinci-pm-domains.txt       | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/ti,davinci-pm-domains.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti,davinci-pm-domains.txt b/Documentation/devicetree/bindings/soc/ti,davinci-pm-domains.txt
> new file mode 100644
> index 000000000000..935d063c7b35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/ti,davinci-pm-domains.txt
> @@ -0,0 +1,13 @@
> +Device tree bindings for the genpd driver for Texas Instruments DaVinci SoCs
> +
> +Required properties:
> +
> +- compatible:           must be "ti,davinci-pm-domains"
> +- #power-domain-cells:  must be 0
> +
> +Example:
> +
> +pwc1: power-controller@227000 {
> +	compatible = "ti,davinci-pm-domains";
> +	#power-domain-cells = <0>;
> +};
> 


We already have the PSC @227000. Why not just add
#power-domain-cells = <0>; to that node instead of creating
a new "device" when this is really the same device?
