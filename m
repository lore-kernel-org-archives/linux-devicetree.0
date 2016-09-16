From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: msm8996-pcie-phy: add support for
 msm8996 pcie phy
Date: Fri, 16 Sep 2016 17:51:00 +0100
Message-ID: <c1c7b4a0-009b-fcd7-22bc-98e914e7cbc2@linaro.org>
References: <1473245733-17260-1-git-send-email-srinivas.kandagatla@linaro.org>
 <1473245733-17260-2-git-send-email-srinivas.kandagatla@linaro.org>
 <f27f7641-d7ec-25cb-4b7e-42b343b32db0@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f27f7641-d7ec-25cb-4b7e-42b343b32db0@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 12/09/16 23:51, Stephen Boyd wrote:
> On 09/07/2016 03:55 AM, Srinivas Kandagatla wrote:
>> This patch adds bindings for pcie phy on MSM8996.
>>
>> This PHY has 3 Ports, including a common block. Each port is connected
>> to one root complex. Each port has dedicated reset control lines apart
>> from common reset and clocks for common block.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>  .../bindings/phy/qcom-msm8996-pcie-phy.txt         | 62 ++++++++++++++++++++++
>>  1 file changed, 62 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt b/Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt
>> new file mode 100644
>> index 0000000..51930ed
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt
>> @@ -0,0 +1,62 @@
>> +Qualcomm msm8996 pcie PHY
>> +------------------------
>> +
>> +Required properties:
>> +- compatible: compatible list, contains "qcom,msm8996-pcie-phy".
>> +- reg: offset and length of the pcie PHY register set;
>> +- #phy-cells: must be one
>> +- clocks: a list of phandles and clock-specifier pairs, one for each entry in
>> +  clock-names.
>> +- clock-names: must be "cfg" for phy config clock,
>> +	"aux" for phy aux clock,
>> +	"ref_clk" for 19.2 MHz ref clk and
>> +	"ref_clk_src" reference clock source.
>> +
>> +
>> +- resets: a list of phandles and reset controller specifier pairs, one for
>> +  each entry in reset-names.
>> +- reset-names: must be "phy" for reset of pcie phy block and "common" for
>> +  phy common reset.
>> +
>> +Required properties: (Child node)
>> +- reg: lane numer of the pcie phy.
>> +- resets: a list of phandles and reset controller specifier pairs, one for
>> +  each entry in reset-names.
>> +- reset-names: must be "phy" for reset of pcie phy lane.
>> +
>> +Example:
>> +
>> +	pcie_phy: qcom,pciephy@34000 {
>
> phy for node name? Or pcie-phy?
Yep, Will fix it.
>
>> +		compatible = "qcom,msm8996-pcie-phy";
>> +		reg = <0x00034000 0x4000>;
>> +		#phy-cells = <1>;
>> +		clocks = <&gcc GCC_PCIE_PHY_CFG_AHB_CLK>,
>> +			<&gcc GCC_PCIE_PHY_AUX_CLK>,
>> +			<&gcc GCC_PCIE_CLKREF_CLK>,
>> +			<&rpmcc MSM8996_RPM_SMD_LN_BB_CLK>;
>> +		clock-names = "cfg", "aux", "ref_clk", "ref_clk_src";
>> +
>> +		resets = <&gcc GCC_PCIE_PHY_BCR>,
>> +			<&gcc GCC_PCIE_PHY_COM_BCR>;
>> +		reset-names = "phy",  "common";
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		pcie_phy@0{
>> +			reg = <0>;
>> +			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
>> +			reset-names = "phy";
>> +		};
>
> Why not just have reset-names with strings like "lane0", "lane1",
> "lane2" in the toplevel node?
Thats good idea, Will take this into account in the next version which 
would be common driver for USB/PCIE/UFS phy.

Thanks,
srini
>
