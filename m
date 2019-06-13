From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: regulator: Add labibb regulator
Date: Thu, 13 Jun 2019 09:28:08 -0700
Message-ID: <20190613162808.GG22737@tuxbook-pro>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-2-git-send-email-nishakumari@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560337252-27193-2-git-send-email-nishakumari@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nisha Kumari <nishakumari@codeaurora.org>
Cc: broonie@kernel.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org, linux-kernel@vger.kernel.org, kgunda@codeaurora.org, rnayak@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wed 12 Jun 04:00 PDT 2019, Nisha Kumari wrote:

> Adding the devicetree binding for labibb regulator.
> 
> Signed-off-by: Nisha Kumari <nishakumari@codeaurora.org>
> ---
>  .../bindings/regulator/qcom-labibb-regulator.txt   | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
> new file mode 100644
> index 0000000..79aad6f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.txt
> @@ -0,0 +1,57 @@
> +Qualcomm's LAB(LCD AMOLED Boost)/IBB(Inverting Buck Boost) Regulator
> +
> +LAB can be used as a positive boost power supply and IBB can be used as a negative
> +boost power supply for display panels.
> +
> +Main node required properties:
> +
> +- compatible:			Must be:
> +				"qcom,lab-ibb-regulator"

In order to handle variations in future LABIBB implementations, make
this "qcom,pmi8998-lab-ibb";

> +- #address-cells:		Must be 1
> +- #size-cells:			Must be 0
> +
> +LAB subnode required properties:
> +
> +- reg:				Specifies the SPMI address and size for this peripheral.
> +- regulator-name:		A string used to describe the regulator.
> +- interrupts:			Specify the interrupts as per the interrupt
> +				encoding.
> +- interrupt-names:		Interrupt names to match up 1-to-1 with
> +				the interrupts specified in 'interrupts'
> +				property.
> +
> +IBB subnode required properties:
> +
> +- reg:				Specifies the SPMI address and size for this peripheral.
> +- regulator-name:		A string used to describe the regulator.
> +- interrupts:			Specify the interrupts as per the interrupt
> +				encoding.
> +- interrupt-names:		Interrupt names to match up 1-to-1 with
> +				the interrupts specified in 'interrupts'
> +				property.
> +
> +Example:
> +	pmi8998_lsid1: pmic@3 {
> +		qcom-labibb-regulator {

We typically want to use generic names here, but as the spmi regulator
binding suggest the use of "regulators" without a unit address that
wouldn't work.

But you can shorten this to either "labibb" or at least
"labibb-regulator".

> +			compatible = "qcom,lab-ibb-regulator";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			lab_regulator: qcom,lab@de00 {

Don't use "qcom," in the node names.

> +				reg = <0xde00>;

Please follow the spmi-regulator and hide these in the driver.

> +				regulator-name = "lab_reg";

We know it's a regulator, so no need for _reg, which means that if you
drop "qcom," from the node name and use the node name as the default
regulator name you don't need this.

> +
> +				interrupts = <0x3 0xde 0x0 IRQ_TYPE_EDGE_RISING>;
> +				interrupt-names = "lab-sc-err";
> +			};
> +
> +			ibb_regulator: qcom,ibb@dc00 {
> +				reg = <0xdc00>;
> +				regulator-name = "ibb_reg";
> +
> +				interrupts = <0x3 0xdc 0x2 IRQ_TYPE_EDGE_RISING>;
> +				interrupt-names = "ibb-sc-err";
> +			};
> +
> +		};
> +	};

Regards,
Bjorn
