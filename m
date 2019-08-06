From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: imx-ocotp: Add i.MX8MN compatible
Date: Tue, 6 Aug 2019 10:39:10 +0100
Message-ID: <e38b758f-13b9-e2fe-188b-373861716ef8@linaro.org>
References: <20190711023714.16000-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190711023714.16000-1-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org



On 11/07/2019 03:37, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Add compatible for i.MX8MN and add i.MX8MM/i.MX8MN to the description.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied both the patches.

Thanks,
srini

> ---
>   Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> index 96ffd06..904dadf 100644
> --- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> +++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
> @@ -2,7 +2,7 @@ Freescale i.MX6 On-Chip OTP Controller (OCOTP) device tree bindings
>   
>   This binding represents the on-chip eFuse OTP controller found on
>   i.MX6Q/D, i.MX6DL/S, i.MX6SL, i.MX6SX, i.MX6UL, i.MX6ULL/ULZ, i.MX6SLL,
> -i.MX7D/S, i.MX7ULP and i.MX8MQ SoCs.
> +i.MX7D/S, i.MX7ULP, i.MX8MQ, i.MX8MM and i.MX8MN SoCs.
>   
>   Required properties:
>   - compatible: should be one of
> @@ -16,6 +16,7 @@ Required properties:
>   	"fsl,imx7ulp-ocotp" (i.MX7ULP),
>   	"fsl,imx8mq-ocotp" (i.MX8MQ),
>   	"fsl,imx8mm-ocotp" (i.MX8MM),
> +	"fsl,imx8mn-ocotp" (i.MX8MN),
>   	followed by "syscon".
>   - #address-cells : Should be 1
>   - #size-cells : Should be 1
> 
