From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: phy: Add support for QMP phy
Date: Wed, 30 Nov 2016 11:12:07 -0800
Message-ID: <20161130191207.GJ6095@codeaurora.org>
References: <1479816163-5260-1-git-send-email-vivek.gautam@codeaurora.org>
 <1479816163-5260-4-git-send-email-vivek.gautam@codeaurora.org>
 <20161128225543.GM6095@codeaurora.org>
 <CAFp+6iGeNQKuP=WmshPG0088CNy8hosdfN+unuS6bhYqJJaKRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFp+6iGeNQKuP=WmshPG0088CNy8hosdfN+unuS6bhYqJJaKRQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Vivek Gautam <vivek.gautam@codeaurora.org>
Cc: kishon <kishon@ti.com>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/29, Vivek Gautam wrote:
> On Tue, Nov 29, 2016 at 4:25 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 11/22, Vivek Gautam wrote:
> >> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> >> new file mode 100644
> >> index 0000000..ffb173b
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> >> @@ -0,0 +1,74 @@
> 
> >
> >> +                     "pipe<port-number>" for pipe clock specific to
> >> +                     each port/lane (Optional).
> >
> > The pipe clocks are orphaned right now. We should add an output
> > clock from the phy to go into the controller and back into the
> > phy if I recall correctly. The phy should be a clock provider
> > itself so it can output the pipe clock source into GCC and back
> > into the phy and controller.
> >
> >> + - resets: a list of phandles and reset controller specifier pairs,
> >> +        one for each entry in reset-names.
> >> + - reset-names: must be "phy" for reset of phy block,
> >> +                     "common" for phy common block reset,
> >> +                     "cfg" for phy's ahb cfg block reset (Optional).
> >> +                     "port<port-number>" for reset specific to
> >> +                     each port/lane (Optional).
> >> + - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
> >> + - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
> >> +
> >> +Optional properties:
> >> + - vddp-ref-clk-supply: Phandle to a regulator supply to any specific refclk
> >> +                     pll block.
> >> +
> >> +Example:
> >> +     pcie_phy: pciephy@34000 {
> >
> > pcie-phy or just phy as the node name?
> 
> How about just 'phy'? The label pcie_phy anyways explains the use.
> 
> 

phy is a great color choice for the shed.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
