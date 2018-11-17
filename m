From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add Qualcomm Synopsys High-Speed
 USB PHY binding
Date: Sat, 17 Nov 2018 09:13:38 -0600
Message-ID: <CAL_JsqKu3kf-zrKNtrtZsQEPi0LN_3jqs08i3-8vbSQDVxuRkA@mail.gmail.com>
References: <20181108070449.23572-1-shawn.guo@linaro.org> <20181108070449.23572-2-shawn.guo@linaro.org>
 <5bea0ed8.1c69fb81.8715.38b2@mx.google.com> <20181113034200.GD20049@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113034200.GD20049@tiger>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Sriharsha Allenki <sallenki@codeaurora.org>, Anu Ramanathan <anur@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod <vkoul@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 12, 2018 at 9:42 PM Shawn Guo <shawn.guo@linaro.org> wrote:
>
> Hi Rob,
>
> On Mon, Nov 12, 2018 at 01:24:51PM -0600, Rob Herring wrote:
> > On Thu, Nov 08, 2018 at 03:04:48PM +0800, Shawn Guo wrote:
> > > From: Sriharsha Allenki <sallenki@codeaurora.org>
> > >
> > > It adds bindings for Synopsys 28nm femto phy controller that supports
> > > LS/FS/HS usb connectivity on Qualcomm chipsets.
> > >
> > > Signed-off-by: Sriharsha Allenki <sallenki@codeaurora.org>
> > > Signed-off-by: Anu Ramanathan <anur@codeaurora.org>
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > ---
> > >  .../phy/qcom,snps-28nm-usb-hs-phy.txt         | 101 ++++++++++++++++++
> > >  1 file changed, 101 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt b/Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt
> > > new file mode 100644
> > > index 000000000000..75e7a09dd558
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,snps-28nm-usb-hs-phy.txt
> > > @@ -0,0 +1,101 @@
> > > +Qualcomm Synopsys 28nm Femto phy controller
> > > +===========================================
> > > +
> > > +Synopsys 28nm femto phy controller supports LS/FS/HS usb connectivity on
> > > +Qualcomm chipsets.
> > > +
> > > +Required properties:
> > > +
> > > +- compatible:
> > > +    Value type: <string>
> > > +    Definition: Should contain "qcom,usb-snps-hsphy".
> >
> > SoC specific compatible?
>
> Agreed.  A SoC prefixed compatible would be more specific and scalable
> for handling different programming model of the same IP.  I will use
> "qcom,qcs404-usb-hsphy" in v3.
>
> >
> > > +
> > > +- reg:
> > > +    Value type: <prop-encoded-array>
> > > +    Definition: USB PHY base address and length of the register map.
> > > +
> > > +- #phy-cells:
> > > +    Value type: <u32>
> > > +    Definition: Should be 0.
> > > +
> > > +- clocks:
> > > +    Value type: <prop-encoded-array>
> > > +    Definition: See clock-bindings.txt section "consumers". List of
> > > +           three clock specifiers for reference, phy core and
> > > +           sleep clocks.
> > > +
> > > +- clock-names:
> > > +    Value type: <string>
> > > +    Definition: Names of the clocks in 1-1 correspondence with the "clocks"
> > > +           property. Must contain "ref", "phy" and "sleep".
> > > +
> > > +- resets:
> > > +    Value type: <prop-encoded-array>
> > > +    Definition: See reset.txt section "consumers". PHY reset specifiers
> > > +           for phy core and POR resets.
> > > +
> > > +- reset-names:
> > > +    Value type: <string>
> > > +    Definition: Names of the resets in 1-1 correspondence with the "resets"
> > > +           property. Must contain "phy" and "por".
> > > +
> > > +- vdd-supply:
> > > +    Value type: <phandle>
> > > +    Definition: phandle to the regulator VDD supply node.
> > > +
> > > +- vdda1p8-supply:
> > > +    Value type: <phandle>
> > > +    Definition: phandle to the regulator 1.8V supply node.
> > > +
> > > +- vdda3p3-supply:
> > > +    Value type: <phandle>
> > > +    Definition: phandle to the regulator 3.3V supply node.
> > > +
> > > +- qcom,vdd-voltage-level:
> > > +    Value type: <prop-array>
> > > +    Definition: This is a list of three integer values <no min max> where
> > > +           each value corresponding to voltage corner in uV.
> > > +
> > > +Optional properties:
> > > +
> > > +- extcon:
> > > +    Value type: <prop-encoded-array>
> > > +    Definition: Should contain the vbus extcon.
> >
> > Don't use extcon for new bindings. Use usb-connector binding.
>
> Okay, I just did a bit of research and found that 'extcon' is becoming
> a deprecated DT property recently and we should OF graph bindings to
> specify the connector.  Will do in v3.
>
> >
> > > +
> > > +- qcom,init-seq:
> > > +    Value type: <u32 array>
> > > +    Definition: Should contain a sequence of <offset value delay> tuples to
> > > +                program 'value' into phy register at 'offset' with 'delay'
> > > +           in us afterwards.
> >
> > If we wanted this type of thing in DT, we'd have a generic binding (or
> > forth).
>
> Right now, this is a qualcomm usb phy specific bindings - first used in
> qcom,usb-hs-phy.txt and I extended it a bit for my phy.  As this is not
> a so good hardware description, I'm a little hesitated to make it
> generic for other platforms to use in general.  What about we put off it
> a little bit until we see more platforms need the same thing?

I'm not saying I want it generic. Quite the opposite. I don't think we
should have it either generically or vendor specific. The main thing I
have a problem with is the timing information because then we're more
that just data. Without that we're talking about a bunch of properties
for register fields or just raw register values in DT. That becomes
more of a judgement call. There's not too much value in making a
driver translate a bunch of properties just to stuff them into
registers on init. But then just allowing any raw register value to be
in DT could be easily abused.

Rob
