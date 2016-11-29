From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: phy: Add support for QMP phy
Date: Tue, 29 Nov 2016 10:55:11 +0530
Message-ID: <CAFp+6iGeNQKuP=WmshPG0088CNy8hosdfN+unuS6bhYqJJaKRQ@mail.gmail.com>
References: <1479816163-5260-1-git-send-email-vivek.gautam@codeaurora.org>
 <1479816163-5260-4-git-send-email-vivek.gautam@codeaurora.org> <20161128225543.GM6095@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161128225543.GM6095@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: kishon <kishon@ti.com>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,


On Tue, Nov 29, 2016 at 4:25 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 11/22, Vivek Gautam wrote:
>> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>> new file mode 100644
>> index 0000000..ffb173b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>> @@ -0,0 +1,74 @@
>> +Qualcomm QMP PHY
>> +----------------
>> +
>> +QMP phy controller supports physical layer functionality for a number of
>> +controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
>> +
>> +Required properties:
>> + - compatible: compatible list, contains:
>> +            "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
>> +            "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996.
>> + - reg: list of offset and length pair of the PHY register sets.
>> +     at index 0: offset and length of register set for PHY common
>> +                 serdes block.
>> +     from index 1 - N: offset and length of register set for each lane,
>> +                       for N number of phy lanes (ports).
>> + - lane-offsets: array of offsets to tx, rx and pcs blocks for phy lanes.
>> + - #phy-cells: must be 1
>> +    - Cell after phy phandle should be the port (lane) number.
>> + - clocks: a list of phandles and clock-specifier pairs,
>> +        one for each entry in clock-names.
>> + - clock-names: must be "cfg_ahb" for phy config clock,
>> +                     "aux" for phy aux clock,
>> +                     "ref_clk" for 19.2 MHz ref clk,
>> +                     "ref_clk_src" for reference clock source,
>
> We typically leave "clk" out of clk names because it's redundant.

Right, will drop 'clk' from these names.

>
>> +                     "pipe<port-number>" for pipe clock specific to
>> +                     each port/lane (Optional).
>
> The pipe clocks are orphaned right now. We should add an output
> clock from the phy to go into the controller and back into the
> phy if I recall correctly. The phy should be a clock provider
> itself so it can output the pipe clock source into GCC and back
> into the phy and controller.
>
>> + - resets: a list of phandles and reset controller specifier pairs,
>> +        one for each entry in reset-names.
>> + - reset-names: must be "phy" for reset of phy block,
>> +                     "common" for phy common block reset,
>> +                     "cfg" for phy's ahb cfg block reset (Optional).
>> +                     "port<port-number>" for reset specific to
>> +                     each port/lane (Optional).
>> + - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
>> + - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
>> +
>> +Optional properties:
>> + - vddp-ref-clk-supply: Phandle to a regulator supply to any specific refclk
>> +                     pll block.
>> +
>> +Example:
>> +     pcie_phy: pciephy@34000 {
>
> pcie-phy or just phy as the node name?

How about just 'phy'? The label pcie_phy anyways explains the use.


Thanks
Vivek

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
