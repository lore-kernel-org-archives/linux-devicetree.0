From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
Date: Fri, 13 Sep 2019 09:06:51 -0500
Message-ID: <b6d9fa2c-c23b-7310-e192-cff6185a72b1@ti.com>
References: <20190912213257.24147-1-andreas@kemnade.info>
 <20190912213257.24147-2-andreas@kemnade.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190912213257.24147-2-andreas@kemnade.info>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Andreas

On 9/12/19 4:32 PM, Andreas Kemnade wrote:
> add enable-gpios to describe HWEN pin
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

Reviewed-by: Dan Murphy <dmurphy@ti.com>


> ---
> changes in v2: added example
> changes in v3: added Acked-by
> changes in v4: moved enable-gpios to the right position
>    in the example
>   .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> index dc129d9a329e..c8470628fe02 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> @@ -29,6 +29,10 @@ properties:
>     '#size-cells':
>       const: 0
>   
> +  enable-gpios:
> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> @@ -96,6 +100,7 @@ examples:
>           led-controller@38 {
>                   compatible = "ti,lm3630a";
>                   reg = <0x38>;
> +                enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
>   
>                   #address-cells = <1>;
>                   #size-cells = <0>;
