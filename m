From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: phy: Add support for QMP phy
Date: Wed, 18 Jan 2017 12:24:17 +0530
Message-ID: <50612693-5345-55da-8207-8c5e721fb68a@codeaurora.org>
References: <1484045519-19030-1-git-send-email-vivek.gautam@codeaurora.org>
 <1484045519-19030-4-git-send-email-vivek.gautam@codeaurora.org>
 <587C88FE.2040900@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <587C88FE.2040900@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, sboyd@codeaurora.org, bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,


On 01/16/2017 02:19 PM, Kishon Vijay Abraham I wrote:
> Hi,
>
> On Tuesday 10 January 2017 04:21 PM, Vivek Gautam wrote:
>> Qualcomm chipsets have QMP phy controller that provides
>> support to a number of controller, viz. PCIe, UFS, and USB.
>> Adding dt binding information for the same.
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> Acked-by: Rob Herring <robh@kernel.org>
>> ---
>>
>> Changes since v3:
>>   - Added #clock-cells = <1>, indicating that phy is a clock provider.
>>
>> Changes since v2:
>>   - Removed binding for "ref_clk_src" since we don't request this
>>     clock in the driver.
>>   - Addressed s/ref_clk/ref. Don't need to add '_clk' suffix to clock names.
>>   - Using 'phy' for the node name.
>>
>> Changes since v1:
>>   - New patch, forked out of the original driver patch:
>>     "phy: qcom-qmp: new qmp phy driver for qcom-chipsets"
>>   - Added 'Acked-by' from Rob.
>>   - Updated bindings to include mem resource as a list of
>>     offset - length pair for serdes block and for each lane.
>>   - Added a new binding for 'lane-offsets' that contains offsets
>>     to tx, rx and pcs blocks from each lane base address.
>>
>>   .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 76 ++++++++++++++++++++++
>>   1 file changed, 76 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>> new file mode 100644
>> index 000000000000..6f510fe48f46
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>> @@ -0,0 +1,76 @@
>> +Qualcomm QMP PHY controller
>> +===========================
>> +
>> +QMP phy controller supports physical layer functionality for a number of
>> +controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
>> +
>> +Required properties:
>> + - compatible: compatible list, contains:
>> +	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
>> +	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996.
>> + - reg: list of offset and length pair of the PHY register sets.
>> +	at index 0: offset and length of register set for PHY common
>> +		    serdes block.
>> +	from index 1 - N: offset and length of register set for each lane,
>> +			  for N number of phy lanes (ports).
>> + - lane-offsets: array of offsets to tx, rx and pcs blocks for phy lanes.
>> + - #phy-cells: must be 1
>> +    - Cell after phy phandle should be the port (lane) number.
>> + - #clock-cells: must be 1
>> +    - Phy pll outputs a bunch of clocks for Tx, Rx and Pipe
>> +      interface (for pipe based PHYs). These clock are then gate-controlled
>> +      by gcc.
>> + - clocks: a list of phandles and clock-specifier pairs,
>> +	   one for each entry in clock-names.
>> + - clock-names: must be "cfg_ahb" for phy config clock,
>> +			"aux" for phy aux clock,
>> +			"ref" for 19.2 MHz ref clk,
>> +			"pipe<port-number>" for pipe clock specific to
>> +			each port/lane (Optional).
>> + - resets: a list of phandles and reset controller specifier pairs,
>> +	   one for each entry in reset-names.
>> + - reset-names: must be "phy" for reset of phy block,
>> +			"common" for phy common block reset,
>> +			"cfg" for phy's ahb cfg block reset (Optional).
>> +			"port<port-number>" for reset specific to
>> +			each port/lane (Optional).
>> + - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
>> + - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
>> +
>> +Optional properties:
>> + - vddp-ref-clk-supply: Phandle to a regulator supply to any specific refclk
>> +			pll block.
>> +
>> +Example:
>> +	pcie_phy: phy@34000 {
>> +		compatible = "qcom,msm8996-qmp-pcie-phy";
>> +		reg = <0x034000 0x48f>,
>> +			<0x035000 0x5bf>,
>> +			<0x036000 0x5bf>,
>> +			<0x037000 0x5bf>;
>> +				/* tx, rx, pcs */
>> +		lane-offsets = <0x0 0x200 0x400>;
>> +		#phy-cells = <1>;
>> +		#clock-cells = <1>;
>> +
>> +		clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
>> +			<&gcc GCC_PCIE_PHY_CFG_AHB_CLK>,
>> +			<&gcc GCC_PCIE_CLKREF_CLK>,
>> +			<&gcc GCC_PCIE_0_PIPE_CLK>,
>> +			<&gcc GCC_PCIE_1_PIPE_CLK>,
>> +			<&gcc GCC_PCIE_2_PIPE_CLK>;
>> +		clock-names = "aux", "cfg_ahb", "ref",
>> +				"pipe0", "pipe1", "pipe2";
>> +
>> +		vdda-phy-supply = <&pm8994_l28>;
>> +		vdda-pll-supply = <&pm8994_l12>;
>> +
>> +		resets = <&gcc GCC_PCIE_PHY_BCR>,
>> +			<&gcc GCC_PCIE_PHY_COM_BCR>,
>> +			<&gcc GCC_PCIE_PHY_COM_NOCSR_BCR>,
>> +			<&gcc GCC_PCIE_0_PHY_BCR>,
>> +			<&gcc GCC_PCIE_1_PHY_BCR>,
>> +			<&gcc GCC_PCIE_2_PHY_BCR>;
>> +		reset-names = "phy", "common", "cfg",
>> +				"lane0", "lane1", "lane2";
> Each lane has a separate clock, separate reset.. why not create sub-nodes for
> each lane?

Yes, each lane has separate pipe clock and resets.
I can have a binding such as written below.
Does it makes sense to pull in the tx, rx and pcs offsets as well
to the child node, and iomap the entire address space of the phy ?

+ pcie_phy: pciephy@34000 {
+               compatible = "qcom,qmp-14nm-phy";
+               reg = <0x034000 0x3fff>;
+               #address-cells = <1>;
+               #size-cells = <0>;

                   ...

+               port@0 {
+                       reg = <0>;
+                       tx-offset = <0x1000>;
+                       rx-offset = <0x1200>;
+                       pcs-offset = <0x1400>;
+                       clocks = <&gcc GCC_USB3_PHY_PIPE_CLK>;
+                       clock-names = "pipe0";
+                       resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+                       reset-names = "lane0";
+               };
+ };


Regards
Vivek
>
> Thanks
> Kishon
> --
> To unsubscribe from this list: send the line "unsubscribe linux-arm-msm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
