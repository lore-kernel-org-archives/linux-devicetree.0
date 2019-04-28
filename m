From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v4 2/6] dt-bindings: usb: add binding for Type-B GPIO
 connector driver
Date: Sun, 28 Apr 2019 09:50:57 +0800
Message-ID: <1556416257.10179.210.camel@mhfsdcap03>
References: <1556261237-13823-1-git-send-email-chunfeng.yun@mediatek.com>
         <1556261237-13823-3-git-send-email-chunfeng.yun@mediatek.com>
         <20190426204537.GA15074@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190426204537.GA15074@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2019-04-26 at 15:45 -0500, Rob Herring wrote:
> On Fri, Apr 26, 2019 at 02:47:13PM +0800, Chunfeng Yun wrote:
> > It's used to support dual role switch via GPIO when use Type-B
> > receptacle, typically the USB ID pin is connected to an input
> > GPIO pin
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v4 no changes
> > 
> > v3 changes:
> >  1. treat type-B connector as a virtual device, but not child device of
> >     USB controller's
> > 
> > v2 changes:
> >   1. new patch to make binding clear suggested by Hans
> > ---
> >  .../bindings/usb/typeb-conn-gpio.txt          | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt b/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
> > new file mode 100644
> > index 000000000000..d2e1c4e01b6d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/typeb-conn-gpio.txt
> > @@ -0,0 +1,49 @@
> > +USB Type-B GPIO Connector
> > +
> > +This is a virtual device used to switch dual role mode from the USB ID pin
> > +connected to an input GPIO pin.
> > +
> > +Required properties:
> > +- compatible : Should be "linux,typeb-conn-gpio"
> 
> There's no need for this virtual node. The USB host or device driver can 
> instantiate a connector driver by walking the OF graph to the connector 
> and creating a device.
Got it.
> 
> > +
> > +Sub-nodes:
> > +- connector : should be present.
> > +	- compatible : should be "usb-b-connector".
> > +	- id-gpios, vbus-gpios : either one of them must be present,
> > +		and both can be present as well.
> > +	- vbus-supply : can be present if needed when supports dual role mode.
> > +	see connector/usb-connector.txt
> > +
> > +- port : should be present.
> > +	see graph.txt
> > +
> > +Example:
> > +
> > +rsw_iddig: role_sw_iddig {
> > +	compatible = "linux,typeb-conn-gpio";
> > +	status = "okay";
> > +
> > +	connector {
> > +		compatible = "usb-b-connector";
> > +		label = "micro-USB";
> > +		type = "micro";
> > +		id-gpios = <&pio 12 GPIO_ACTIVE_HIGH>;
> > +		vbus-supply = <&usb_p0_vbus>;
> > +	};
> > +
> > +	port {
> 
> Humm, same mistake as Hikey patches...
> 
> This goes under the connector node as defined in the connector binding.
Ok, will fix it.

Thanks a lot.

> 
> > +		bconn_ep: endpoint@0 {
> > +			remote-endpoint = <&usb_role_sw>;
> > +		};
> > +	};
> > +};
> > +
> > +&mtu3 {
> > +	status = "okay";
> > +
> > +	port {
> > +		usb_role_sw: endpoint@0 {
> > +			remote-endpoint = <&bconn_ep>;
> > +		};
> > +	};
> > +};
> > -- 
> > 2.21.0
> > 
