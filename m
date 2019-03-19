Return-Path: <SRS0=Qdya=RW=linux.intel.com=heikki.krogerus@kernel.org>
Date: Tue, 19 Mar 2019 10:18:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: add documentation for typec
 switch via GPIO
Message-ID: <20190319081801.GP7752@kuha.fi.intel.com>
References: <1552299557-6306-1-git-send-email-jun.li@nxp.com>
 <20190312144527.GA18735@bogus>
 <20190313093540.GB7752@kuha.fi.intel.com>
 <VI1PR04MB45585F62042838331761536B89470@VI1PR04MB4558.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI1PR04MB45585F62042838331761536B89470@VI1PR04MB4558.eurprd04.prod.outlook.com>
To: Jun Li <jun.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 18, 2019 at 10:59:31AM +0000, Jun Li wrote:
> 
> 
> > -----Original Message-----
> > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Sent: 2019年3月13日 17:36
> > To: Rob Herring <robh@kernel.org>
> > Cc: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org; hdegoede@redhat.com;
> > andy.shevchenko@gmail.com; linux-usb@vger.kernel.org;
> > devicetree@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> > Subject: Re: [PATCH v3 1/2] dt-bindings: usb: add documentation for typec switch
> > via GPIO
> > 
> > On Tue, Mar 12, 2019 at 09:45:27AM -0500, Rob Herring wrote:
> > > On Mon, Mar 11, 2019 at 10:40:09AM +0000, Jun Li wrote:
> > > > Some typec super speed active channel switch can be controlled via a
> > > > GPIO, this binding can be used to specify the switch node by a GPIO
> > > > and the remote endpoint of its consumer.
> > > >
> > > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > > ---
> > > >  .../devicetree/bindings/usb/typec-switch-gpio.txt  | 30
> > > > ++++++++++++++++++++++
> > > >  1 file changed, 30 insertions(+)
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
> > > > b/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
> > > > new file mode 100644
> > > > index 0000000..4ef76cf
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
> > > > @@ -0,0 +1,30 @@
> > > > +Typec orientation switch via a GPIO
> > > > +-----------------------------------
> > > > +
> > > > +Required properties:
> > > > +- compatible: should be set one of following:
> > > > +	- "nxp,ptn36043" for NXP Type-C SuperSpeed active switch.
> > > > +
> > > > +- gpios: the GPIO used to switch the super speed active channel,
> > >
> > > Perhaps switch-gpios in case there are other gpios needed.
> > >
> > > > +		GPIO_ACTIVE_HIGH: GPIO state high for cc1;
> > > > +		GPIO_ACTIVE_LOW:  GPIO state low for cc1.
> > > > +- orientation-switch: must be present.
> > >
> > > Why is this needed? The compatible can't imply this?
> > 
> > I think Jun Li is added that based on the comment I put to drivers/usb/typec/mux.c,
> > so I'm to blame here. If we can handle this with the compatible like I guess we can,
> > I'm happy.
> 
> Hi Heikki
> 
> Can I just remove the original bool property check? i.e, match OK if the remote
> parent node is in switch_list.

No. If typec_switch_get() is called before the mux device is
registered, we need to return -EPROBE_DEFER. That means we need to be
able to identify the mux device node.

I think we should just use the compatible like Rob suggested. The
Type-C muxes should probable have their own bindings file where it's
defined for these muxes.


thanks,

-- 
heikki
