From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH next v10 03/11] dt-bindings: usb: add binding for USB
 GPIO based connection detection driver
Date: Wed, 28 Aug 2019 09:28:15 +0800
Message-ID: <1566955695.7317.17.camel@mhfsdcap03>
References: <1566547041-20804-1-git-send-email-chunfeng.yun@mediatek.com>
         <1566547041-20804-4-git-send-email-chunfeng.yun@mediatek.com>
         <20190827183154.GA10374@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190827183154.GA10374@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Biju Das <biju.das@bp.renesas.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2019-08-27 at 13:31 -0500, Rob Herring wrote:
> On Fri, Aug 23, 2019 at 03:57:13PM +0800, Chunfeng Yun wrote:
> > It's used to support dual role switch via GPIO when use Type-B
> > receptacle, typically the USB ID pin is connected to an input
> > GPIO, and also used to enable/disable device when the USB Vbus
> > pin is connected to an input GPIO.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v9~v10 no changes
> > 
> > v8 changes:
> >  1. rename the title
> >  2. change the compatible as "linux,usb-conn-gpio" instead of
> >     "linux,typeb-conn-gpio"
> 
> I don't think that is an improvement. How about 'gpio-usb-b-connector' 
> to be consistent.
Ok

> 
> > 
> > v7 changes:
> >  1. add description for device only mode
> > 
> > v6 changes:
> >  1. remove status and port nodes in example
> >  2. make vbus-supply as optional property
> > 
> > v5 changes:
> >  1. treat type-B connector as child device of USB controller's, but not
> >     as a separate virtual device, suggested by Rob
> >  2. put connector's port node under connector node, suggested by Rob
> > 
> > v4 no changes
> > 
> > v3 changes:
> >  1. treat type-B connector as a virtual device, but not child device of
> >     USB controller's
> > 
> > v2 changes:
> >   1. new patch to make binding clear suggested by Hans
> > ---
> >  .../devicetree/bindings/usb/usb-conn-gpio.txt | 31 +++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/usb-conn-gpio.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/usb-conn-gpio.txt b/Documentation/devicetree/bindings/usb/usb-conn-gpio.txt
> > new file mode 100644
> > index 000000000000..d4d107fedc22
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/usb-conn-gpio.txt
> > @@ -0,0 +1,31 @@
> > +USB GPIO Based Connection Detection
> > +
> > +This is typically used to switch dual role mode from the USB ID pin connected
> > +to an input GPIO, and also used to enable/disable device mode from the USB
> > +Vbus pin connected to an input GPIO.
> > +
> > +Required properties:
> > +- compatible : should include "linux,usb-conn-gpio" and "usb-b-connector".
> > +- id-gpios, vbus-gpios : input gpios, either one of them must be present,
> > +	and both can be present as well.
> > +	see connector/usb-connector.txt
> > +
> > +Optional properties:
> > +- vbus-supply : can be present if needed when supports dual role mode.
> > +	see connector/usb-connector.txt
> > +
> > +- Sub-nodes:
> > +	- port : can be present.
> > +		see graph.txt
> > +
> > +Example:
> > +
> > +&mtu3 {
> > +	connector {
> > +		compatible = "linux,usb-conn-gpio", "usb-b-connector";
> > +		label = "micro-USB";
> 
> 'label' is for a human identifying a particular connector when there are 
> multiple (of the same type). So not a great example here.
Got it, will remove it

Thanks a lot
> 
> > +		type = "micro";
> > +		id-gpios = <&pio 12 GPIO_ACTIVE_HIGH>;
> > +		vbus-supply = <&usb_p0_vbus>;
> > +	};
> > +};
> > -- 
> > 2.23.0
> > 
