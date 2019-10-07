From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC][PATCH v2 4/5] dt-bindings: usb: dwc3: of-simple: add
 compatible for HiSi
Date: Mon, 7 Oct 2019 16:11:02 -0500
Message-ID: <CAL_JsqJ9uUtqTDEkLi86-BCvW+wM6Pgz_K+JuTsuOqHfFOHStA@mail.gmail.com>
References: <20191007175553.66940-1-john.stultz@linaro.org>
 <20191007175553.66940-5-john.stultz@linaro.org> <CAL_JsqJLY2n7hfneNptAGswVZtGm3vJbSR6W2wUG+ZTzMN8wZA@mail.gmail.com>
 <CALAqxLWB7Vd-H70LLLSW0Fv=_4-saQ9CE2k3-L_43E+F8mLj2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALAqxLWB7Vd-H70LLLSW0Fv=_4-saQ9CE2k3-L_43E+F8mLj2w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Yu Chen <chenyu56@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Linux USB List <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 7, 2019 at 2:07 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Mon, Oct 7, 2019 at 11:38 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Mon, Oct 7, 2019 at 12:56 PM John Stultz <john.stultz@linaro.org> wrote:
> > >
> > > Add necessary compatible flag for HiSi's DWC3 so
> > > dwc3-of-simple will probe.
> > >
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Felipe Balbi <balbi@kernel.org>
> > > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Mark Rutland <mark.rutland@arm.com>
> > > Cc: Yu Chen <chenyu56@huawei.com>
> > > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > > Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > Cc: linux-usb@vger.kernel.org
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > > ---
> > > v2: Tweaked clock names as clk_usb3phy_ref didn't seem right.
> > > ---
> > >  .../devicetree/bindings/usb/hisi,dwc3.txt     | 52 +++++++++++++++++++
> > >  1 file changed, 52 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/usb/hisi,dwc3.txt
> >
> > Can you make this a schema.
>
> Sorry, I'm not sure exactly what you're asking. I'm guessing from
> grepping around you want the bindings in yaml instead (I see a few
> examples)?

Yes.

> Is there some pointer to documentation? The
> Documentation/devicetree/bindings/writing-bindings.txt file doesn't
> seem to say much on it.

You mean Documentation/devicetree/writing-schemas.rst? There's that
and Documentation/devicetree/bindings/example-schema.yaml which has a
bunch of annotations on what each part means.

> > > diff --git a/Documentation/devicetree/bindings/usb/hisi,dwc3.txt b/Documentation/devicetree/bindings/usb/hisi,dwc3.txt
> > > new file mode 100644
> > > index 000000000000..3a3e5c320f2a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/hisi,dwc3.txt
> > > @@ -0,0 +1,52 @@
> > > +HiSi SuperSpeed DWC3 USB SoC controller
> > > +
> > > +Required properties:
> > > +- compatible:          should contain "hisilicon,hi3660-dwc3" for HiSi SoC
> > > +- clocks:              A list of phandle + clock-specifier pairs for the
> > > +                       clocks listed in clock-names
> > > +- clock-names:         Should contain the following:
> > > +  "clk_abb_usb"                USB reference clk

Probably 'ref' from dwc3.txt.

> > > +  "aclk_usb3otg"       USB3 OTG aclk

'bus_early'? IIRC, 'aclk' is the clock name for AXI bus clock.

> > > +
> > > +- assigned-clocks:     Should be:
> > > +                               HI3660_ACLK_GATE_USB3OTG
> > > +- assigned-clock-rates: Should be:
> > > +                               229Mhz (229000000) for HI3660_ACLK_GATE_USB3OTG
> > > +
> > > +Optional properties:
> > > +- resets:              Phandle to reset control that resets core and wrapper.
> >
> > Looks like 4 resets though.
>
> Good point. I'll fix that up.
>
> > > +
> > > +Required child node:
> > > +A child node must exist to represent the core DWC3 IP block. The name of
> > > +the node is not important. The content of the node is defined in dwc3.txt.
> > > +
> > > +Example device nodes:
> > > +
> > > +       usb3: hisi_dwc3 {
> > > +               compatible = "hisilicon,hi3660-dwc3";
> > > +               #address-cells = <2>;
> > > +               #size-cells = <2>;
> > > +               ranges;
> > > +
> > > +               clocks = <&crg_ctrl HI3660_CLK_ABB_USB>,
> > > +                        <&crg_ctrl HI3660_ACLK_GATE_USB3OTG>;
> > > +               clock-names = "clk_abb_usb", "aclk_usb3otg";
> > > +
> > > +               assigned-clocks = <&crg_ctrl HI3660_ACLK_GATE_USB3OTG>;
> > > +               assigned-clock-rates = <229 000 000>;
> > > +               resets = <&crg_rst 0x90 8>,
> > > +                        <&crg_rst 0x90 7>,
> > > +                        <&crg_rst 0x90 6>,
> > > +                        <&crg_rst 0x90 5>;
> > > +
> > > +               dwc3: dwc3@ff100000 {
> >
> > If it's only clocks and resets for the wrapper node, just make this
> > all one node.
>
> Just to make sure I'm following, you're suggesting I put all the
> clocks/resets in the dwc3 node (renamed to usb for the node name) and
> not add the wrapper?

Yes.

> I'll have to see if that's possible. The generic dwc3 binding wants 3
> clocks, but I only have two in the code I've worked with (similarly it
> seems to only want two resets, not 4) so I'll have to see if I can
> figure out how to adapt that.

Possible since commit fe8abf332b8f ("usb: dwc3: support clocks and
resets for DWC3 core").

>
> If that approach is preferred, do I also no longer need a separate
> binding document/schema?

Correct. And then no need to convert to schema yet (though feel free
to convert dwc3.txt :)).

Rob
