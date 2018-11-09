From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Qualcomm Synopsys High-Speed
 USB PHY binding
Date: Fri, 9 Nov 2018 16:36:47 +0530
Message-ID: <20181109110647.GS12092@vkoul-mobl>
References: <20181108070449.23572-1-shawn.guo@linaro.org>
 <20181108070449.23572-2-shawn.guo@linaro.org>
 <20181109050819.GK12092@vkoul-mobl>
 <20181109063134.GA20049@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181109063134.GA20049@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09-11-18, 14:31, Shawn Guo wrote:
> On Fri, Nov 09, 2018 at 10:38:19AM +0530, Vinod Koul wrote:
> > On 08-11-18, 15:04, Shawn Guo wrote:
> > > +
> > > +- #phy-cells:
> > > +    Value type: <u32>
> > > +    Definition: Should be 0.
> > 
> > I dont quite understand the definition that it should be 0, maybe you
> > mean allowed value is 0, if so why have this property?
> 
> The property is defined by generic phy bindings phy/phy-bindings.txt.
> I can add a pointer to it if you think that's necessary.  The property
> should be 0 for our device, because there is zero number cell in phy
> specifier from dwc3 node as shown in the example.

That makes sense, also does it make sense it mention the properties in
phy/phy-bindings.txt, why not refer that here for the properties we use
and vlaues.

> 
> 	dwc3@78c0000 {
> 		...
> 		phys = <&usb2_phy_prim>;
> 		phy-names = "usb2-phy";
> 	}
> 
> And for that reason, we can use the generic .of_xlate implementation
> of_phy_simple_xlate() provided by phy core.  There are some comments
> in kernel doc of of_phy_simple_xlate() which might be helpful.
> 
> Shawn

-- 
~Vinod
