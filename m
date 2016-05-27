From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/2] dt: binding: Add Qualcomm WCNSS control binding
Date: Thu, 26 May 2016 21:28:38 -0700
Message-ID: <20160527042838.GZ1256@tuxbot>
References: <1463095068-32225-1-git-send-email-bjorn.andersson@linaro.org>
 <CAL_JsqLBF+r4JyG5r_WdFOUDPk0BVW-o6rnFa+twztOUtmh2yg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLBF+r4JyG5r_WdFOUDPk0BVW-o6rnFa+twztOUtmh2yg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu 26 May 20:58 PDT 2016, Rob Herring wrote:

> +dt list
> 
> On Thu, May 12, 2016 at 6:17 PM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
[..]
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
> > new file mode 100644
> > index 000000000000..5413098a1e1a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.txt
> > @@ -0,0 +1,115 @@
> > +Qualcomm WCNSS Binding
> > +
> > +This binding describes the Qualcomm WCNSS hardware. It consists of control
> > +block and a BT, WiFi and FM radio block, all useing SMD as command channels.
> 
> s/useing/using/
> 

Right.

> > +
> > +- compatible:
> > +       Usage: required
> > +       Value type: <string>
> > +       Definition: must be: "qcom,wcnss",
> > +
> > +- qcom,smd-channel:
> > +       Usage: required
> > +       Value type: <string>
> > +       Definition: standard SMD property specifying the SMD channel used for
> > +                   communication with the WiFi firmware
> 
> Is the string value defined somewhere?
> 

It's never been anything else than WCNSS_CTRL so I guess I could
document that.

> > +
> > +- qcom,mmio:
> > +       Usage: required
> > +       Value type: <prop-encoded-array>
> > +       Definition: reference to a node specifying the wcnss "ccu" and "dxe"
> > +                   register blocks. The node must be compatible with one of
> > +                   the following:
> > +                   "qcom,riva",
> > +                   "qcom,pronto"
> > +
[..]
> > +
> > +- qcom,state:
> 
> This is kind of generic.
> 

We can rename it qcom,smem-state to make it less likely to collide in
the future. I believe this is the first binding referencing one of
those.

> > +       Usage: required
> > +       Value type: <prop-encoded-array>
> > +       Definition: should reference the tx-enable and tx-rings-empty SMEM states
> > +
> > +- qcom,state-names:

And then qcom,smem-state-names here

> > +       Usage: required
> > +       Value type: <stringlist>
> > +       Definition: must contain "tx-enable" and "tx-rings-empty"
> > +
> > += EXAMPLE
> > +The following example represents a SMD node, with one edge representing the
> > +"pronto" subsystem, with the wcnss device and its wcn3680 BT and WiFi blocks
> > +described; as found on the 8974 platform.
> 
> So somewhere in here I'd expect to see 8974 in a compatible string.
> 

The "Wireless CoNnectivity Sub-System" version is "pronto" and this is
the only thing that has a hardware dependency. So the only part that
makes this 8974 and not 8016 is the placing of those blocks in the
memory space (and the interrupts).

And the compatible qcom,iris would make this a 8064 node.

> > +
> > +smd {
> > +       compatible = "qcom,smd";
> > +
> > +       pronto {
> > +               interrupts = <0 142 1>;
> > +
> > +               qcom,ipc = <&apcs 8 17>;
> > +               qcom,smd-edge = <6>;
> > +
> > +               wcnss {
> > +                       compatible = "qcom,wcnss";
> > +                       qcom,smd-channels = "WCNSS_CTRL";
> > +
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +
> > +                       qcom,wcnss = <&pronto>;
> 
> Not documented and poorly named. The property name should reflect what
> this is for or points too.
> 

It's documented as qcom,mmio, so the example is wrong.

> > +
> > +                       bt {
> > +                               compatible = "qcom,wcnss-bt";
> > +                       };
> > +
> > +                       wlan {
> > +                               compatible = "qcom,wcnss-wlan";
> > +
> > +                               interrupts = <0 145 0>, <0 146 0>;
> > +                               interrupt-names = "tx", "rx";
> > +
> > +                               qcom,state = <&apps_smsm 10>, <&apps_smsm 9>;
> > +                               qcom,state-names = "tx-enable", "tx-rings-empty";
> > +                       };
> > +               };
> > +       };
> > +};
> > +
> > +soc {
> > +       pronto: pronto {
> 
> 2 pronto nodes? That's confusing...
> 

This one denotes the pronto register space, the one above denotes the
communication channel to the firmware running on the cpu in the wcnss.

But in SMD terms the one above is the "pronto edge", so I can change
that to pronto-edge.

> > +               compatible = "qcom,pronto";
> > +
> > +               reg = <0xfb204000 0x2000>, <0xfb202000 0x1000>, <0xfb21b000 0x3000>;
> > +               reg-names = "ccu", "dxe", "pmu";
> > +       };
> > +};

Thanks for your review.

Regards,
Bjorn
