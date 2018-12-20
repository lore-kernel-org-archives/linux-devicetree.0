From: Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: Add Qualcomm USB Super-Speed PHY
 bindings
Date: Thu, 20 Dec 2018 09:37:17 -0800
Message-ID: <20181220173633.GA19912@jackp-linux.qualcomm.com>
References: <1544176558-7946-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1544176558-7946-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20181220170531.GA19862@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181220170531.GA19862@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org, Manu Gautam <mgautam@codeaurora.org>, Sriharsha Allenki <sallenki@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Rob, Jorge,

On Thu, Dec 20, 2018 at 11:05:31AM -0600, Rob Herring wrote:
> On Fri, Dec 07, 2018 at 10:55:57AM +0100, Jorge Ramirez-Ortiz wrote:
> > Binding description for Qualcomm's Synopsys 1.0.0 super-speed PHY
> > controller embedded in QCS404.
> > 
> > Based on Sriharsha Allenki's <sallenki@codeaurora.org> original
> > definitions.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > Reviewed-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  .../devicetree/bindings/usb/qcom,usb-ssphy.txt     | 78 ++++++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt b/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
> > new file mode 100644
> > index 0000000..fcf4e01
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/qcom,usb-ssphy.txt
> > @@ -0,0 +1,78 @@
> > +Qualcomm Synopsys 1.0.0 SS phy controller
> > +===========================================
> > +
> > +Synopsys 1.0.0 ss phy controller supports SS usb connectivity on Qualcomm
> > +chipsets
> > +
> > +Required properties:
> > +
> > +- compatible:
> > +    Value type: <string>
> > +    Definition: Should contain "qcom,usb-ssphy".
> 
> What is "qcom,dwc3-ss-usb-phy" which already exists then?

Uh, apparently only the bindings doc is there but the driver never
landed. I guess it fell through the cracks nearly 4 years ago.

https://lore.kernel.org/patchwork/patch/499502/

Jorge, does Andy's version of this driver at all resemble what can be
used for QCS404?

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
