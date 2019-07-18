From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: stm32: Fix missing 'clocks'
 property in examples
Date: Thu, 18 Jul 2019 18:21:48 +0200
Message-ID: <634fce00-182d-80b8-b435-0cbdae57913c@st.com>
References: <20190716215618.29757-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190716215618.29757-1-robh@kernel.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob

On 7/16/19 11:56 PM, Rob Herring wrote:
> Now that examples are validated against the DT schema, an error with
> required 'clocks' property missing is exposed:
> 
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
> pinctrl@40020000: gpio@0: 'clocks' is a required property
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
> pinctrl@50020000: gpio@1000: 'clocks' is a required property
> Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
> pinctrl@50020000: gpio@2000: 'clocks' is a required property
> 
> Add the missing 'clocks' properties to the examples to fix the errors.
> 
> Fixes: 2c9239c125f0 ("dt-bindings: pinctrl: Convert stm32 pinctrl bindings to json-schema")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Alexandre TORGUE <alexandre.torgue@st.com>

Thanks
Alex


> ---
>   .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> index 3ac5d2088e49..91d3e78b3395 100644
> --- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> @@ -197,6 +197,7 @@ required:
>   examples:
>     - |
>       #include <dt-bindings/pinctrl/stm32-pinfunc.h>
> +    #include <dt-bindings/mfd/stm32f4-rcc.h>
>       //Example 1
>         pinctrl@40020000 {
>                 #address-cells = <1>;
> @@ -210,6 +211,7 @@ examples:
>                         #gpio-cells = <2>;
>                         reg = <0x0 0x400>;
>                         resets = <&reset_ahb1 0>;
> +                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOA)>;
>                         st,bank-name = "GPIOA";
>                 };
>          };
> @@ -227,6 +229,7 @@ examples:
>                         #gpio-cells = <2>;
>                         reg = <0x1000 0x400>;
>                         resets = <&reset_ahb1 0>;
> +                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOB)>;
>                         st,bank-name = "GPIOB";
>                         gpio-ranges = <&pinctrl 0 0 16>;
>                 };
> @@ -236,6 +239,7 @@ examples:
>                         #gpio-cells = <2>;
>                         reg = <0x2000 0x400>;
>                         resets = <&reset_ahb1 0>;
> +                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOC)>;
>                         st,bank-name = "GPIOC";
>                         ngpios = <5>;
>                         gpio-ranges = <&pinctrl 0 16 3>,
> 
