From: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 2/2] extcon: gpio: add DT binding doc for extcon-gpio
Date: Tue, 17 May 2016 11:27:05 +0000
Message-ID: <ba0810bd193345399b94251f8499d28b@bgmail102.nvidia.com>
References: <1462254591-8907-1-git-send-email-vreddytalla@nvidia.com>
 <1462254591-8907-2-git-send-email-vreddytalla@nvidia.com>
 <20160504133037.GA23334@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160504133037.GA23334@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks for review, please find my inline reply.

> -----Original Message-----
> From: Rob Herring [mailto:robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Wednesday, May 04, 2016 7:01 PM
> To: Venkat Reddy Talla
> Cc: MyungJoo Ham; Chanwoo Choi; Pawel Moll; Mark Rutland; Ian Campbell;
> Kumar Gala; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> Laxman Dewangan
> Subject: Re: [PATCH 2/2] extcon: gpio: add DT binding doc for extcon-gpio
> 
> On Tue, May 03, 2016 at 11:19:51AM +0530, Venkat Reddy Talla wrote:
> > Addiing DT binding doc for the extcon gpios properties.
> >
> > Signed-off-by: Venkat Reddy Talla <vreddytalla-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../devicetree/bindings/extcon/extcon-gpio.txt        | 19
> +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> >
> > diff --git a/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> > b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> > new file mode 100644
> > index 0000000..4a49c23
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/extcon/extcon-gpio.txt
> > @@ -0,0 +1,19 @@
> > +EXTCON FOR GPIO
> 
> This needs a better description of what this is and what h/w this applies to.
> 
I will take care in my next patch.

> > +
> > +Required Properties:
> > + - compatible : Should be "extcon-gpio";
> > +
> > +Optional Properties:
> > + - extcon-gpio,name: Name of extcon device.
> > + - gpio: gpio number.
> 
> Should be 'gpios'.
> 
OK, I will take care in my next patch.

> > + - extcon-gpio,irq-flags: IRQ flags for GPIO.
> 
> If this is an interrupt, then you should be using the interrupts property.
> 
Need to provide GPIO number instead of interrupt from DTS to read GPIO value when external connected attached/detached and also driver supports platform data with passing GPIO number.
So need to pass irq-flags using separate dts property or need to hardcode in driver.

> > + - extcon-gpio,debounce: Debounce time in ms.
> 
> extcon-gpio is not a vendor prefix, so drop it.
> 
> Add unit suffix (-ms).
> 
OK, I will take care in my next patch.

> > + - extcon-gpio,connection-state-low: boolean, Connection state with
> > +                gpio state. True if gpio low means connected.
> 
> The active state should be in the GPIO flags cell.
> 
OK, I will take care in my next patch.
> > +
> > +extcon-gpio {
> > +	compatible = "extcon-gpio";
> > +        extcon-gpio,name = "VBUS";
> 
> How is VBus a gpio?
> 
Here VBUS is not gpio number, VBUS is extcon device name, extcon gpio is used to detect VBUS.

> > +	gpio = <&gpio 20 0>;
> > +	extcon-gpio,cable-names = <EXTCON_USB EXTCON_NONE>;
> 
> Not documented.
> 
> Rob
OK, I will take care in my next patch.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
