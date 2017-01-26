From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: phy: Add support for QMP phy
Date: Thu, 26 Jan 2017 15:43:55 -0800
Message-ID: <20170126234355.GF8801@codeaurora.org>
References: <1484045519-19030-1-git-send-email-vivek.gautam@codeaurora.org>
 <1484045519-19030-4-git-send-email-vivek.gautam@codeaurora.org>
 <587C88FE.2040900@ti.com>
 <50612693-5345-55da-8207-8c5e721fb68a@codeaurora.org>
 <20170118182223.GP10531@minitux>
 <20170119004028.GA4857@codeaurora.org>
 <5cee25c5-434b-6e73-301e-3942dedd16fa@codeaurora.org>
 <20170119214258.GD7829@codeaurora.org>
 <58871F6D.1090206@ti.com>
 <CAFp+6iGBzUEFM-MjqerhoVWjFF8wahgwC_rnB6GMd2VsMuDm6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFp+6iGBzUEFM-MjqerhoVWjFF8wahgwC_rnB6GMd2VsMuDm6g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, robh+dt <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 01/24, Vivek Gautam wrote:
> 
> Below is one binding that works for me.
> --------------------
>                phy@34000 {
>                         compatible = "qcom,msm8996-qmp-pcie-phy";
>                         reg = <0x034000 0x488>;
>                         #clock-cells = <1>;
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>                         ranges;
> 
>                         clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
>                                 <&gcc GCC_PCIE_PHY_CFG_AHB_CLK>,
>                                 <&gcc GCC_PCIE_CLKREF_CLK>;
>                         clock-names = "aux", "cfg_ahb", "ref";
> 
>                         vdda-phy-supply = <&pm8994_l28>;
>                         vdda-pll-supply = <&pm8994_l12>;
> 
>                         resets = <&gcc GCC_PCIE_PHY_BCR>,
>                                 <&gcc GCC_PCIE_PHY_COM_BCR>,
>                                 <&gcc GCC_PCIE_PHY_COM_NOCSR_BCR>;
>                         reset-names = "phy", "common", "cfg";
> 
>                         pciephy_p0: port@0 {

The unit address '@0' should be replaced with something from the
reg properties. 

Also 'port' and 'ports' are almost keywords in DT now with the
graph binding so we need to be careful when using them.

>                                 reg = <0x035000 0x130>,
>                                         <0x035200 0x200>,
>                                         <0x035400 0x1dc>;
>                                 #phy-cells = <0>;
> 
>                                 clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
>                                 clock-names = "pipe0";
>                                 resets = <&gcc GCC_PCIE_0_PHY_BCR>;
>                                 reset-names = "lane0";
>                         };
> 
>                       pciephy_p1: port@1 {
>                                 reg = <0x036000 0x130>,
>                                         <0x036200 0x200>,
>                                         <0x036400 0x1dc>;
>                                 #phy-cells = <0>;
> 
>                                 clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
>                                 clock-names = "pipe1";
>                                 resets = <&gcc GCC_PCIE_1_PHY_BCR>;
>                                 reset-names = "lane1";
>                         };
> 
>                         pciephy_p2: port@2 {
>                                 reg = <0x037000 0x130>,
>                                         <0x037200 0x200>,
>                                         <0x037400 0x1dc>;
>                                 #phy-cells = <0>;
> 
>                                 clocks = <&gcc GCC_PCIE_2_PIPE_CLK>;
>                                 clock-names = "pipe2";
>                                 resets = <&gcc GCC_PCIE_2_PHY_BCR>;
>                                 reset-names = "lane2";
>                         };
>                 };
> --------------------
> 
> let me know if this looks okay.
> 
> 

What's the plan for non-pcie qmp phy binding? In that case we
don't have ports, so it gets folded into one node?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
