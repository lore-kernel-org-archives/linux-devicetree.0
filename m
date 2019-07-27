From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: iio: avia-hx711: Fix avdd-supply typo
 in example
Date: Sat, 27 Jul 2019 22:22:56 +0100
Message-ID: <20190727222256.2d451e82@archlinux>
References: <20190716203324.12198-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190716203324.12198-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>, linux-iio@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 16 Jul 2019 14:33:23 -0600
Rob Herring <robh@kernel.org> wrote:

> Now that examples are validated against the DT schema, a typo in
> avia-hx711 example generates a warning:
> 
> Documentation/devicetree/bindings/iio/adc/avia-hx711.example.dt.yaml: weight: 'avdd-supply' is a required property
> 
> Fix the typo.
> 
> Fixes: 5150ec3fe125 ("avia-hx711.yaml: transform DT binding to YAML")
> Cc: Andreas Klinger <ak@it-klinger.de>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: linux-iio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Jonathan,
> 
> I have some other fixes I'm sending to Linus and can take these 2 if 
> that's easier.
> 
> Rob

Thanks for dealing with these, I missed this thread entirely in my email
whilst travelling / playing catch up.

Jonathan
> 
>  Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> index 8a4100ceeaf2..d76ece97c76c 100644
> --- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
> @@ -61,6 +61,6 @@ examples:
>          compatible = "avia,hx711";
>          sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
>          dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
> -        avdd-suppy = <&avdd>;
> +        avdd-supply = <&avdd>;
>          clock-frequency = <100000>;
>      };
