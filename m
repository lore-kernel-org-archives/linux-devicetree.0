From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v6 3/4] dt-bindings: ASoC: Add WSA881x bindings
Date: Thu, 19 Sep 2019 12:22:44 +0100
Message-ID: <f488e01f-7ce9-09dd-676d-a476e7b00b46@linaro.org>
References: <20190829163514.11221-1-srinivas.kandagatla@linaro.org>
 <20190829163514.11221-4-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829163514.11221-4-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, robh+dt@kernel.org, vkoul@kernel.org
Cc: spapothi@codeaurora.org, bgoswami@codeaurora.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 29/08/2019 17:35, Srinivas Kandagatla wrote:
> This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
> Amplifier. This Amplifier also has a simple thermal sensor for
> over temperature and speaker protection.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Bindings for the codec have been Acked by Rob, SoundWire depended 
patches are already applied for 5.4 and codec driver is Acked by Pierre.

Do you want me to resend these two patches separately?


thanks,
srini

> ---
>   .../bindings/sound/qcom,wsa881x.yaml          | 62 +++++++++++++++++++
>   1 file changed, 62 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> new file mode 100644
> index 000000000000..faa90966a33a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wsa881x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  WSA8810 is a class-D smart speaker amplifier and WSA8815
> +  is a high-output power class-D smart speaker amplifier.
> +  Their primary operating mode uses a SoundWire digital audio
> +  interface. This binding is for SoundWire interface.
> +
> +properties:
> +  compatible:
> +    const: sdw10217201000
> +
> +  reg:
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    description: GPIO spec for Powerdown/Shutdown line to use
> +    maxItems: 1
> +
> +  '#thermal-sensor-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - powerdown-gpios
> +  - "#thermal-sensor-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soundwire@c2d0000 {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        reg = <0x0c2d0000 0x2000>;
> +
> +        speaker@0,1 {
> +            compatible = "sdw10217201000";
> +            reg = <0 1>;
> +            powerdown-gpios = <&wcdpinctrl 2 0>;
> +            #thermal-sensor-cells = <0>;
> +        };
> +
> +        speaker@0,2 {
> +            compatible = "sdw10217201000";
> +            reg = <0 2>;
> +            powerdown-gpios = <&wcdpinctrl 2 0>;
> +            #thermal-sensor-cells = <0>;
> +        };
> +    };
> +
> +...
> 
