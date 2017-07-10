From: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Subject: Re: [PATCH v2 5/6] [media] dt-bindings: gpio-ir-tx: add support for
 GPIO IR Transmitter
Date: Mon, 10 Jul 2017 16:10:16 +0100
Message-ID: <20170710151016.5iaokchdejxozrte@gofer.mess.org>
References: <cover.1499419624.git.sean@mess.org>
 <580c648de65344e9316ff153ba316efd4d527f12.1499419624.git.sean@mess.org>
 <20170710150538.ql26gswdf2obch6o@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170710150538.ql26gswdf2obch6o@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 10, 2017 at 10:05:38AM -0500, Rob Herring wrote:
> On Fri, Jul 07, 2017 at 10:52:03AM +0100, Sean Young wrote:
> > Document the device tree bindings for the GPIO Bit Banging IR
> > Transmitter.
> > 
> > Signed-off-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.txt | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.txt b/Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.txt
> > new file mode 100644
> > index 0000000..bc08d89
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.txt
> > @@ -0,0 +1,11 @@
> > +Device tree bindings for IR LED connected through gpio pin which is used as
> > +remote controller transmitter.
> > +
> > +Required properties:
> > +	- compatible: should be "gpio-ir-tx".
> 
> As I mentioned in the prior version, missing the "gpios" property.

Absolutely right. I hadn't gotten round to sending out a new version
yet, I'll do that soon.


Thanks,

Sean
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
