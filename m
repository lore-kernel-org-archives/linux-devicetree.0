From: Igor Grinberg <grinberg@compulab.co.il>
Subject: Re: [PATCH 06/12] ARM: DT: apq8064: add pci support in CM QS600
Date: Mon, 23 Feb 2015 13:31:11 +0200
Message-ID: <54EB0F7F.1050307@compulab.co.il>
References: <424678035-12862-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1424678135-13178-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1424678135-13178-1-git-send-email-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-msm@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Nicolas Dechesne <nicolas.dechesne@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Srini,

On 02/23/15 09:55, Srinivas Kandagatla wrote:
> From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> 
> This patch adds PCIE support to APQ8064, tested with Ethernet on Compulab QS600 board.
> 
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

Thanks for submitting these!
I currently have a hard time submitting anything...

Acked-by: Igor Grinberg <grinberg@compulab.co.il>

> ---
>  arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> index 5d75666..6e62f24 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> @@ -1,4 +1,5 @@
>  #include "qcom-apq8064-v2.0.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	model = "CompuLab CM-QS600";
> @@ -40,6 +41,24 @@
>  			};
>  		};
>  
> +		/* on board fixed 3.3v supply */
> +		v3p3_pcieclk: v3p3-pcieclk {
> +			compatible = "regulator-fixed";
> +			regulator-name = "PCIE V3P3";
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-always-on;
> +		};
> +
> +		pci@1b500000 {
> +			status = "ok";
> +			pcie-clk-supply	= <&v3p3_pcieclk>;
> +			avdd-supply	= <&pm8921_s3>;
> +			vdd-supply	= <&pm8921_lvs6>;
> +			qcom,external-phy-refclk;
> +			reset-gpio = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
> +		};
> +
>  		amba {
>  			/* eMMC */
>  			sdcc1: sdcc@12400000 {
> 

-- 
Regards,
Igor.
