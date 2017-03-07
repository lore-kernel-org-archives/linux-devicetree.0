From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: phy: Add support for QMP phy
Date: Tue, 7 Mar 2017 06:00:35 -0800
Message-ID: <20170307140035.GA10239@codeaurora.org>
References: <587C88FE.2040900@ti.com>
 <50612693-5345-55da-8207-8c5e721fb68a@codeaurora.org>
 <20170118182223.GP10531@minitux>
 <20170119004028.GA4857@codeaurora.org>
 <5cee25c5-434b-6e73-301e-3942dedd16fa@codeaurora.org>
 <20170119214258.GD7829@codeaurora.org>
 <58871F6D.1090206@ti.com>
 <CAFp+6iGBzUEFM-MjqerhoVWjFF8wahgwC_rnB6GMd2VsMuDm6g@mail.gmail.com>
 <20170126234355.GF8801@codeaurora.org>
 <fa09ef66-9d0d-7817-b6f5-8f958344fbf3@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fa09ef66-9d0d-7817-b6f5-8f958344fbf3@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, robh+dt <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

(Not sure I replied so here it is)

On 01/27, Vivek Gautam wrote:
> 
> 
> On 01/27/2017 05:13 AM, Stephen Boyd wrote:
> >On 01/24, Vivek Gautam wrote:
> 
> From "./Documentation/devicetree/bindings/graph.txt" -
> "The device tree graph bindings described herein abstract more complex
> devices that can have multiple specifiable ports, each of which can be
> linked to one or more ports of other devices."
> 
> So, this means we use 'port', 'ports' and 'endpoint' for devices whose one
> or more ports is connected to other device's one or more ports.
> 
> I can use 'lane' for the node name here.

Ok.

> 
> >
> >>                                 reg = <0x035000 0x130>,
> >>                                         <0x035200 0x200>,
> >>                                         <0x035400 0x1dc>;
> >>                                 #phy-cells = <0>;
> >>
> >>                                 clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
> >>                                 clock-names = "pipe0";
> >>                                 resets = <&gcc GCC_PCIE_0_PHY_BCR>;
> >>                                 reset-names = "lane0";
> >>                         };
> >>
> >>                       pciephy_p1: port@1 {
> >>                                 reg = <0x036000 0x130>,
> >>                                         <0x036200 0x200>,
> >>                                         <0x036400 0x1dc>;
> >>                                 #phy-cells = <0>;
> >>
> >>                                 clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
> >>                                 clock-names = "pipe1";
> >>                                 resets = <&gcc GCC_PCIE_1_PHY_BCR>;
> >>                                 reset-names = "lane1";
> >>                         };
> >>
> >>                         pciephy_p2: port@2 {
> >>                                 reg = <0x037000 0x130>,
> >>                                         <0x037200 0x200>,
> >>                                         <0x037400 0x1dc>;
> >>                                 #phy-cells = <0>;
> >>
> >>                                 clocks = <&gcc GCC_PCIE_2_PIPE_CLK>;
> >>                                 clock-names = "pipe2";
> >>                                 resets = <&gcc GCC_PCIE_2_PHY_BCR>;
> >>                                 reset-names = "lane2";
> >>                         };
> >>                 };
> >>--------------------
> >>
> >>let me know if this looks okay.
> >>
> >>
> >What's the plan for non-pcie qmp phy binding? In that case we
> >don't have ports, so it gets folded into one node?
> >
> The non-pcie qmp phys still have one lane, that provides tx/rx.
> 
> I am of the opinion that we don't have two different ways to create
> phys in the driver, and keep one port/lane for such phys in dt.
> 

Ok so we would still have a subnode in that case. Sounds ok.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
