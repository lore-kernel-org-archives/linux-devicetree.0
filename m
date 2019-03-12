Return-Path: <SRS0=wiQx=RP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga17.intel.com ([192.55.52.151]:60839 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbfCLKpS (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 12 Mar 2019 06:45:18 -0400
Date: Tue, 12 Mar 2019 12:45:12 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: add documentation for typec
 switch via GPIO
Message-ID: <20190312104512.GA7752@kuha.fi.intel.com>
References: <1552299557-6306-1-git-send-email-jun.li@nxp.com>
 <afcbc9c0-d3f6-98ff-f7bc-9919cda6a034@redhat.com>
 <AM0PR04MB454795707E40FDDBB61DD12D89490@AM0PR04MB4547.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM0PR04MB454795707E40FDDBB61DD12D89490@AM0PR04MB4547.eurprd04.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
To: Jun Li <jun.li@nxp.com>, Hans de Goede <hdegoede@redhat.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On Tue, Mar 12, 2019 at 10:32:00AM +0000, Jun Li wrote:
> Hi Hans
> > -----Original Message-----
> > From: Hans de Goede <hdegoede@redhat.com>
> > Sent: 2019年3月11日 19:03
> > To: Jun Li <jun.li@nxp.com>; robh+dt@kernel.org; heikki.krogerus@linux.intel.com
> > Cc: gregkh@linuxfoundation.org; andy.shevchenko@gmail.com;
> > linux-usb@vger.kernel.org; devicetree@vger.kernel.org; dl-linux-imx
> > <linux-imx@nxp.com>
> > Subject: Re: [PATCH v3 1/2] dt-bindings: usb: add documentation for typec switch
> > via GPIO
> > 
> > Hi,
> > 
> > On 11-03-19 11:40, Jun Li wrote:
> > > Some typec super speed active channel switch can be controlled via a
> > > GPIO, this binding can be used to specify the switch node by a GPIO
> > > and the remote endpoint of its consumer.
> > >
> > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > ---
> > >   .../devicetree/bindings/usb/typec-switch-gpio.txt  | 30
> > ++++++++++++++++++++++
> > >   1 file changed, 30 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
> > > b/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
> > > new file mode 100644
> > > index 0000000..4ef76cf
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
> > > @@ -0,0 +1,30 @@
> > > +Typec orientation switch via a GPIO
> > > +-----------------------------------
> > > +
> > > +Required properties:
> > > +- compatible: should be set one of following:
> > > +	- "nxp,ptn36043" for NXP Type-C SuperSpeed active switch.
> > > +
> > > +- gpios: the GPIO used to switch the super speed active channel,
> > > +		GPIO_ACTIVE_HIGH: GPIO state high for cc1;
> > > +		GPIO_ACTIVE_LOW:  GPIO state low for cc1.
> > > +- orientation-switch: must be present.
> > 
> > Shouldn't this have usb-c in the propery name, e.g.:
> > usb-c-orientation-switch  ?
> 
> This is decided by drivers/usb/typec/mux.c:36
> /*
>  * With OF graph the mux node must have a boolean device property named
>  * "orientation-switch".
>  */

Yes, but it's still OK to change it. It's not documented anywhere yet.

> > > +
> > > +Required sub-node:
> > > +- port: specify the remote endpoint of typec switch consumer.
> > > +
> > > +Example:
> > > +
> > > +ptn36043 {
> > > +	compatible = "nxp,ptn36043";
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&pinctrl_ss_sel>;
> > > +	gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
> > > +	orientation-switch;
> > > +
> > > +	port {
> > > +		usb3_data_ss: endpoint {
> > > +			remote-endpoint = <&typec_con_ss>;
> > 
> > 
> > Isn't this the wrong way around, shouldn't the "usb-c-connector"
> > compatible port be pointing to the orientation switch, rather then the other way
> > around?  

Hans, in OF graph both endpoints will have a remote-endpoint pointing
to each other..

> I am not sure I am getting your point, "usb-c-connector" is the user of typec switch,
> yes, it is pointing to the orientation switch provider(i.e, this example node).
> 
> >Both will work in the end. but to me it feels more natural to group all the
> > info about the type-c connector together in the "usb-c-connector" compatible port
> >
> 
>         ptn36043 {
>                 compatible = "nxp,ptn36043";
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&pinctrl_ss_sel>;
>                 gpios = <&gpio3 15 GPIO_ACTIVE_HIGH>;
>                 orientation-switch;
> 
>                 port {
>                         usb3_data_ss: endpoint {
>                                 remote-endpoint = <&typec_con_ss>;
>                         };
>                 };
>         };
> 
> usb_con: connector {
> 	compatible = "usb-c-connector";
> 	...
> 	ports {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 
> 		port@1 {
> 			reg = <1>;
> 			typec_con_ss: endpoint {
> 				remote-endpoint = <&usb3_data_ss>;
> 			};
> 		};
> 	};
> };

So like that.

thanks,

-- 
heikki
