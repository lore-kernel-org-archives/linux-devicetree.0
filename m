From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] dt-bindings: usb: dwc2: document the vbus-supply property
Date: Thu, 28 Mar 2019 21:00:23 +0100
Message-ID: <CAFBinCDzYDH8NTwedUMaaN-gxtP29FEmvPtrmnQ+d2_N_PZ+=A@mail.gmail.com>
References: <20190306212431.5779-1-martin.blumenstingl@googlemail.com> <20190327234217.GA8346@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190327234217.GA8346@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: hminas@synopsys.com, gregkh@linuxfoundation.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, amelie.delaunay@st.com, felipe.balbi@linux.intel.com
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, Mar 28, 2019 at 12:42 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Mar 06, 2019 at 10:24:31PM +0100, Martin Blumenstingl wrote:
> > Various boards have an external VBUS supply regulator. This regulator
> > depends on the current mode of the controller which is defined as:
> > - dr_mode set to either "host" or "peripheral" (fixed value)
> > - dr_mode set to "otg", based on the OTG status the dwc2 controller
> >   internally switches between "host" and "peripheral" mode (selection
> >   happens at runtime)
> >
> > Based on the current mode the regulator has to be enabled or disabled:
> > - host: provide power to the connected USB device, thus the regulator
> >   has to be enabled
> > - peripheral: the host device to which the controller is connected
> >   provides power, thus the regulator has to be disabled
> >
> > Add the dt-bindings documentation for this property so .dts authors know
> > that this property exists and how it behaves.
> >
> > Fixes: 531ef5ebea9639 ("usb: dwc2: add support for host mode external vbus supply")
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  Documentation/devicetree/bindings/usb/dwc2.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> > index 6dc3c4a34483..1e8a775a0e72 100644
> > --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> > +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> > @@ -31,6 +31,10 @@ Refer to clk/clock-bindings.txt for generic clock consumer properties
> >  Optional properties:
> >  - phys: phy provider specifier
> >  - phy-names: shall be "usb2-phy"
> > +- vbus-supply: reference to the VBUS regulator. Depending on the current mode
> > +  this is enabled (in "host" mode") or disabled (in "peripheral" mode). The
> > +  regulator is updated if the controller is configured in "otg" mode and the
> > +  status changes between "host" and "peripheral".
>
> This is actually wrong IMO unless Vbus is powering the controller
> itself. If it is just a regulator routed to the USB connector, then the
> DT should use the usb-connector binding and put vbus-supply there. If
> the driver needs it, then it can walk the tree/graph and get it. For
> some reason folks seem to think everything the driver needs has to be in
> the node associated with the driver.
I didn't know about the usb-connector binding yet - thank you for
pointing it out (rather than saying that this is bad without giving a
reason)!

do you want me to re-spin this with a notice (stating that this should
be implemented in another way)?
I'm asking because I suggested that Neil adds a "vbus-supply" property
to "dt-bindings: usb: dwc3: Add Amlogic G12A DWC3 Glue Bindings" [0].
He already added it and you reviewed it (it's easy to miss though, the
patches are not merged yet though).

> </rant>
>
> I guess given this is already in use:
I know of at least two consumers:
- arch/arm/boot/dts/meson8b-ec100.dts (I'm guilty of adding that
because I thought that the only problem with this binding was the
missing documentation)
- (downstream) OpenWrt has switched the lantiq target to use this property: [1]


Regards
Martin


[0] https://patchwork.kernel.org/patch/10868515/
[1] https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=d8b475212bbf9e5f80c1c923a9701dca5ceb23e2
