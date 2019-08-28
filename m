From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: phy: Modify Stingray USB PHY #phy-cells
Date: Wed, 28 Aug 2019 11:24:43 +0530
Message-ID: <CABe79T6rcm2OatYYf2j6Ht5Ft6YQAZ26es2txVuPyRUNdW8Q3Q@mail.gmail.com>
References: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
 <1564568395-9980-3-git-send-email-srinath.mannam@broadcom.com> <20190821182119.GA27408@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821182119.GA27408@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for the review.
I will modify commit message and send new patch set.
We have a plan to upstream DTS files. We will send DTS changes in
different patch set once this is done.

Regards,
Srinath.

On Wed, Aug 21, 2019 at 11:51 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jul 31, 2019 at 03:49:52PM +0530, Srinath Mannam wrote:
> > Increase #phy-cells from 1 to 2 to have bitmask of PHY enabled ports.
>
> And from 0 to 1...
>
> Are you going to update all the dts files so when we convert this to
> schema we don't get a bunch of warnings? (Feel free to convert this
> to schema too).
>
> >
> > Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> > ---
> >  .../devicetree/bindings/phy/brcm,stingray-usb-phy.txt      | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
> > index 4ba2989..aeb0568 100644
> > --- a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
> > +++ b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
> > @@ -6,9 +6,11 @@ Required properties:
> >       - "brcm,sr-usb-hs-phy" is a single HS PHY.
> >   - reg: offset and length of the PHY blocks registers
> >   - #phy-cells:
> > -   - Must be 1 for brcm,sr-usb-combo-phy as it expects one argument to indicate
> > -     the PHY number of two PHYs. 0 for HS PHY and 1 for SS PHY.
> > -   - Must be 0 for brcm,sr-usb-hs-phy.
> > +   - Must be 2 for brcm,sr-usb-combo-phy.
> > +     - Cell 1 - PHY Number, 0 for HS PHY and 1 for SS PHY.
> > +     - Cell 2 - Bitmask of enabled ports connected to USB Host controller.
> > +   - Must be 1 for brcm,sr-usb-hs-phy to indicate Bit mask of ports connected
> > +     to USB Host controller.
> >
> >  Refer to phy/phy-bindings.txt for the generic PHY binding properties
> >
> > @@ -16,17 +18,17 @@ Example:
> >       usbphy0: usb-phy@0 {
> >               compatible = "brcm,sr-usb-combo-phy";
> >               reg = <0x00000000 0x100>;
> > -             #phy-cells = <1>;
> > +             #phy-cells = <2>;
> >       };
> >
> >       usbphy1: usb-phy@10000 {
> >               compatible = "brcm,sr-usb-combo-phy";
> >               reg = <0x00010000 0x100>,
> > -             #phy-cells = <1>;
> > +             #phy-cells = <2>;
> >       };
> >
> >       usbphy2: usb-phy@20000 {
> >               compatible = "brcm,sr-usb-hs-phy";
> >               reg = <0x00020000 0x100>,
> > -             #phy-cells = <0>;
> > +             #phy-cells = <1>;
> >       };
> > --
> > 2.7.4
> >
