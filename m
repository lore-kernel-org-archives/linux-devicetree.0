From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Qualcomm Synopsys High-Speed
 USB PHY binding
Date: Fri, 9 Nov 2018 14:31:37 +0800
Message-ID: <20181109063134.GA20049@tiger>
References: <20181108070449.23572-1-shawn.guo@linaro.org>
 <20181108070449.23572-2-shawn.guo@linaro.org>
 <20181109050819.GK12092@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181109050819.GK12092@vkoul-mobl>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 09, 2018 at 10:38:19AM +0530, Vinod Koul wrote:
> On 08-11-18, 15:04, Shawn Guo wrote:
> > From: Sriharsha Allenki <sallenki@codeaurora.org>
> > 
> > It adds bindings for Synopsys 28nm femto phy controller that supports
> > LS/FS/HS usb connectivity on Qualcomm chipsets.
> > 
> > Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
> > Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  .../phy/qcom,snps-28nm-usb-hs-phy.txt         | 101 ++++++++++++++++++
> >  1 file changed, 101 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt b/Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt
> > new file mode 100644
> > index 000000000000..75e7a09dd558
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt
> > @@ -0,0 +1,101 @@
> > +Qualcomm Synopsys 28nm Femto phy controller
> > +===========================================
> > +
> > +Synopsys 28nm femto phy controller supports LS/FS/HS usb connectivity on
> > +Qualcomm chipsets.
> > +
> > +Required properties:
> > +
> > +- compatible:
> > +    Value type: <string>
> > +    Definition: Should contain "qcom,usb-snps-hsphy".
> > +
> > +- reg:
> > +    Value type: <prop-encoded-array>
> > +    Definition: USB PHY base address and length of the register map.
> > +
> > +- #phy-cells:
> > +    Value type: <u32>
> > +    Definition: Should be 0.
> 
> I dont quite understand the definition that it should be 0, maybe you
> mean allowed value is 0, if so why have this property?

The property is defined by generic phy bindings phy/phy-bindings.txt.
I can add a pointer to it if you think that's necessary.  The property
should be 0 for our device, because there is zero number cell in phy
specifier from dwc3 node as shown in the example.

	dwc3@78c0000 {
		...
		phys = <&usb2_phy_prim>;
		phy-names = "usb2-phy";
	}

And for that reason, we can use the generic .of_xlate implementation
of_phy_simple_xlate() provided by phy core.  There are some comments
in kernel doc of of_phy_simple_xlate() which might be helpful.

Shawn
