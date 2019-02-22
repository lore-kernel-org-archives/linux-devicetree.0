From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: Add Stingray USB PHY binding document
Date: Fri, 22 Feb 2019 13:35:06 -0600
Message-ID: <CAL_JsqKyYoc3wLWGhbBdQxn=1NLhGbxfB2sUZUXm13_YTEyTGw@mail.gmail.com>
References: <1550658842-19167-1-git-send-email-srinath.mannam@broadcom.com>
 <1550658842-19167-2-git-send-email-srinath.mannam@broadcom.com>
 <20190222172042.GA6792@bogus> <CABe79T5SqQJhF0GY06-+-aSCV-ya-RODEeV0DLg0Poupjeq+fA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABe79T5SqQJhF0GY06-+-aSCV-ya-RODEeV0DLg0Poupjeq+fA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>, Tejun Heo <tj@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 22, 2019 at 11:29 AM Srinath Mannam
<srinath.mannam@broadcom.com> wrote:
>
> Hi Rob,
>
> Thanks for the review, Please find my comments below in line.
>
> On Fri, Feb 22, 2019 at 10:50 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Feb 20, 2019 at 04:04:00PM +0530, Srinath Mannam wrote:
> > > Add DT binding document for Stingray USB PHY.
> > >
> > > Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> > > Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> > > Reviewed-by: Scott Branden <scott.branden@broadcom.com>
> > > ---
> > >  .../bindings/phy/brcm,stingray-usb-phy.txt         | 62 ++++++++++++++++++++++
> > >  1 file changed, 62 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
> > > new file mode 100644
> > > index 0000000..da19236
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
> > > @@ -0,0 +1,62 @@
> > > +Broadcom Stingray USB PHY
> > > +
> > > +Required properties:
> > > + - compatible : should be one of the listed compatibles
> > > +     - "brcm,sr-usb-combo-phy" is a combo PHY has one SS PHY and one HS PHY.
> > > +     - "brcm,sr-usb-hs-phy" has a single HS PHY.
> > > + - reg: offset and length of the PHY blocks registers
> > > + - address-cells: should be 1
> > > + - size-cells: should be 0
> > > +
> > > +Sub-nodes:
> > > +  brcm,sr-usb-combo-phy have two sub-nodes for one SS PHY and one HS PHY.
> > > +
> > > +Sub-nodes required properties:
> > > + - reg: required for brcm,sr-usb-phy model PHY.
> > > +     reg value 0 is HS PHY and 1 is SS PHY.
> > > + - phy-cells: generic PHY binding; must be 0
> > > +
> > > +Refer to phy/phy-bindings.txt for the generic PHY binding properties
> > > +
> > > +Example:
> > > +     usbphy0: usb-phy@0 {
> > > +             compatible = "brcm,sr-usb-combo-phy";
> > > +             reg = <0x00000000 0x100>;
> > > +             #address-cells = <1>;
> > > +             #size-cells = <0>;
> > > +
> > > +             usb0_phy0: phy@0 {
> > > +                     reg = <0>;
> > > +                     #phy-cells = <0>;
> > > +             };
> > > +
> > > +             usb0_phy1: phy@1 {
> > > +                     reg = <1>;
> > > +                     #phy-cells = <0>;
> > > +             };
> >
> > Again, you don't need child nodes here. There are not any per child
> > resources. Clients can refer to <&usbphy0 1> just as easily as
> > <&usb0_phy1>. This is why we have #phy-cells.
> This phy controller is combo PHY it has one Super Speed USB PHY and
> one High Speed USB PHY.
> We required to create two PHY devices inside driver to initialize and
> service(reset) both SS and HS PHYs separately.
> That is the reason we used two child nodes.

What you do in the driver is your business. That is independent of the
binding. Go look at other phy drivers which use #phy-cells=1.
.of_xlate() function is what converts the phy cells to a struct phy.

Rob
