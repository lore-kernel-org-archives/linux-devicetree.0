From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: phy: Add support for QMP phy
Date: Tue, 24 Jan 2017 19:35:40 +0530
Message-ID: <CAFp+6iGBzUEFM-MjqerhoVWjFF8wahgwC_rnB6GMd2VsMuDm6g@mail.gmail.com>
References: <1484045519-19030-1-git-send-email-vivek.gautam@codeaurora.org>
 <1484045519-19030-4-git-send-email-vivek.gautam@codeaurora.org>
 <587C88FE.2040900@ti.com> <50612693-5345-55da-8207-8c5e721fb68a@codeaurora.org>
 <20170118182223.GP10531@minitux> <20170119004028.GA4857@codeaurora.org>
 <5cee25c5-434b-6e73-301e-3942dedd16fa@codeaurora.org> <20170119214258.GD7829@codeaurora.org>
 <58871F6D.1090206@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <58871F6D.1090206@ti.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, robh+dt <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 3:03 PM, Kishon Vijay Abraham I <kishon@ti.com> wrote:
> Hi,
>
> On Friday 20 January 2017 03:12 AM, Stephen Boyd wrote:
>> On 01/19, Vivek Gautam wrote:
>>>
>>> On 01/19/2017 06:10 AM, Stephen Boyd wrote:
>>>>>
>>>> Didn't we already move away from subnodes for lanes in an earlier
>>>> revision of these patches? I seem to recall we did that because
>>>> lanes are not devices and the whole "phy as a bus" concept not
>>>> making sense.
>>>
>>> Yea, we started out without having any sub-nodes and we
>>> argued that we don't require them since the qmp device is
>>> represented by the qmp node itself.
>>> The lanes otoh are representative of gen_phys and related properties.
>>>
>>> In the driver -
>>> "struct qmp_phy " represents the lanes and holds "struct phy",
>>> "struct qcom_qmp" represents the qmp block as a whole and holds
>>> "struct device"
>>> Does this make lanes qualify to be childs of qmp ?
>>
>> Hmm... maybe I was recalling the DSI phy binding. I think there
>> are lanes there too but we decided to just have one node.
>>
>>>
>>> "phy as a bus" (just trying to understand here) -
>>> let's say a usb phy controller has one HSIC phy port and one USB2 phy port.
>>> So, should this phy controller be a bus providing two ports (and so
>>> we will have
>>> couple of child nodes to the phy controller) ?
>>>
>>
>> Typically in DT a subnode or collection of subnodes means there's
>> some sort of bus involved. Usually each node corresponds to a
>> struct device, and the parent node corresponds to the bus or
>> controller for the logical bus.
>>
>> In this case (only PCIe though? not UFS or USB?) it seems like we
>> have multiple phys that share a common register space, but
>> otherwise they have their own register space and power
>> management. Would you have each PCIe controller point to a
>> different subnode for their associated phy? I'm trying to
>> understand the benefit of the subnodes if they aren't treated as
>> struct devices.
>
> Yes, instead of having all the controller having a phandle to the same PHY and
> then using other mechanisms to differentiate between the PHYs, each controller
> can have a phandle to the exact port that it is connected to.
>
> This also gives a better representation of the hardware and can avoid lot of
> boilerplate code in the driver.

Below is one binding that works for me.
--------------------
               phy@34000 {
                        compatible = "qcom,msm8996-qmp-pcie-phy";
                        reg = <0x034000 0x488>;
                        #clock-cells = <1>;
                        #address-cells = <1>;
                        #size-cells = <1>;
                        ranges;

                        clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
                                <&gcc GCC_PCIE_PHY_CFG_AHB_CLK>,
                                <&gcc GCC_PCIE_CLKREF_CLK>;
                        clock-names = "aux", "cfg_ahb", "ref";

                        vdda-phy-supply = <&pm8994_l28>;
                        vdda-pll-supply = <&pm8994_l12>;

                        resets = <&gcc GCC_PCIE_PHY_BCR>,
                                <&gcc GCC_PCIE_PHY_COM_BCR>,
                                <&gcc GCC_PCIE_PHY_COM_NOCSR_BCR>;
                        reset-names = "phy", "common", "cfg";

                        pciephy_p0: port@0 {
                                reg = <0x035000 0x130>,
                                        <0x035200 0x200>,
                                        <0x035400 0x1dc>;
                                #phy-cells = <0>;

                                clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
                                clock-names = "pipe0";
                                resets = <&gcc GCC_PCIE_0_PHY_BCR>;
                                reset-names = "lane0";
                        };

                      pciephy_p1: port@1 {
                                reg = <0x036000 0x130>,
                                        <0x036200 0x200>,
                                        <0x036400 0x1dc>;
                                #phy-cells = <0>;

                                clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
                                clock-names = "pipe1";
                                resets = <&gcc GCC_PCIE_1_PHY_BCR>;
                                reset-names = "lane1";
                        };

                        pciephy_p2: port@2 {
                                reg = <0x037000 0x130>,
                                        <0x037200 0x200>,
                                        <0x037400 0x1dc>;
                                #phy-cells = <0>;

                                clocks = <&gcc GCC_PCIE_2_PIPE_CLK>;
                                clock-names = "pipe2";
                                resets = <&gcc GCC_PCIE_2_PHY_BCR>;
                                reset-names = "lane2";
                        };
                };
--------------------

let me know if this looks okay.


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
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
