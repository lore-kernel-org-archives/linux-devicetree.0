From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] dt-bindings: usb: dwc2: document the vbus-supply property
Date: Fri, 12 Apr 2019 00:06:48 +0200
Message-ID: <CAFBinCCq8eZs+mirGg4qih4B0Oux-58jRkQXGmuCMOA-GmxrUA@mail.gmail.com>
References: <20190306212431.5779-1-martin.blumenstingl@googlemail.com>
 <20190327234217.GA8346@bogus> <CAFBinCDzYDH8NTwedUMaaN-gxtP29FEmvPtrmnQ+d2_N_PZ+=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFBinCDzYDH8NTwedUMaaN-gxtP29FEmvPtrmnQ+d2_N_PZ+=A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: hminas@synopsys.com, gregkh@linuxfoundation.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, amelie.delaunay@st.com, felipe.balbi@linux.intel.com
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, Mar 28, 2019 at 9:00 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> > > diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> > > index 6dc3c4a34483..1e8a775a0e72 100644
> > > --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> > > +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> > > @@ -31,6 +31,10 @@ Refer to clk/clock-bindings.txt for generic clock consumer properties
> > >  Optional properties:
> > >  - phys: phy provider specifier
> > >  - phy-names: shall be "usb2-phy"
> > > +- vbus-supply: reference to the VBUS regulator. Depending on the current mode
> > > +  this is enabled (in "host" mode") or disabled (in "peripheral" mode). The
> > > +  regulator is updated if the controller is configured in "otg" mode and the
> > > +  status changes between "host" and "peripheral".
> >
> > This is actually wrong IMO unless Vbus is powering the controller
> > itself. If it is just a regulator routed to the USB connector, then the
> > DT should use the usb-connector binding and put vbus-supply there. If
> > the driver needs it, then it can walk the tree/graph and get it. For
> > some reason folks seem to think everything the driver needs has to be in
> > the node associated with the driver.
> I didn't know about the usb-connector binding yet - thank you for
> pointing it out (rather than saying that this is bad without giving a
> reason)!
>
> do you want me to re-spin this with a notice (stating that this should
> be implemented in another way)?
please let me know whether I should re-spin this with a notice.
if not: can you please take this patch through your tree?


Thank you!
Martin
