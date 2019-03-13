Return-Path: <SRS0=PcSP=RQ=linux.intel.com=heikki.krogerus@kernel.org>
Date: Wed, 13 Mar 2019 11:35:40 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: add documentation for typec
 switch via GPIO
Message-ID: <20190313093540.GB7752@kuha.fi.intel.com>
References: <1552299557-6306-1-git-send-email-jun.li@nxp.com>
 <20190312144527.GA18735@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190312144527.GA18735@bogus>
To: Rob Herring <robh@kernel.org>
Cc: Jun Li <jun.li@nxp.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 12, 2019 at 09:45:27AM -0500, Rob Herring wrote:
> On Mon, Mar 11, 2019 at 10:40:09AM +0000, Jun Li wrote:
> > Some typec super speed active channel switch can be controlled via
> > a GPIO, this binding can be used to specify the switch node by
> > a GPIO and the remote endpoint of its consumer.
> > 
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> >  .../devicetree/bindings/usb/typec-switch-gpio.txt  | 30 ++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt b/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
> > new file mode 100644
> > index 0000000..4ef76cf
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/typec-switch-gpio.txt
> > @@ -0,0 +1,30 @@
> > +Typec orientation switch via a GPIO
> > +-----------------------------------
> > +
> > +Required properties:
> > +- compatible: should be set one of following:
> > +	- "nxp,ptn36043" for NXP Type-C SuperSpeed active switch.
> > +
> > +- gpios: the GPIO used to switch the super speed active channel,
> 
> Perhaps switch-gpios in case there are other gpios needed.
> 
> > +		GPIO_ACTIVE_HIGH: GPIO state high for cc1;
> > +		GPIO_ACTIVE_LOW:  GPIO state low for cc1.
> > +- orientation-switch: must be present.
> 
> Why is this needed? The compatible can't imply this?

I think Jun Li is added that based on the comment I put to
drivers/usb/typec/mux.c, so I'm to blame here. If we can handle this
with the compatible like I guess we can, I'm happy.

thanks,

-- 
heikki
