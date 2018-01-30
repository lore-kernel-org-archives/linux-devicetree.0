From: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH 1/4] dt-bindings: dwc3: add binding documentation for UniPhier dwc3 glue driver
Date: Tue, 30 Jan 2018 21:14:14 +0900
Message-ID: <20180130211413.D3F5.4A936039@socionext.com>
References: <1516712454-2915-2-git-send-email-hayashi.kunihiko@socionext.com> <20180130000653.rvxqttpwz2mf2yrm@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180130000653.rvxqttpwz2mf2yrm@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masami Hiramatsu <masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thank you for your comments.

On Mon, 29 Jan 2018 18:06:53 -0600 <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> On Tue, Jan 23, 2018 at 10:00:51PM +0900, Kunihiko Hayashi wrote:
> > Add devicetree binding documentation for dwc3 glue driver implemented
> > on Socionext UniPhier SoCs.
> > 
> > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> > ---
> >  .../devicetree/bindings/usb/dwc3-uniphier.txt      | 58 ++++++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/dwc3-uniphier.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/dwc3-uniphier.txt b/Documentation/devicetree/bindings/usb/dwc3-uniphier.txt
> > new file mode 100644
> > index 0000000..677e072
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/dwc3-uniphier.txt
> > @@ -0,0 +1,58 @@
> > +UniPhier DWC3 glue layer
> > +
> > +This describes the devicetree bindings for dwc3-uniphier driver implemented on
> > +Socionext UniPhier SoCs.
> > +
> > +Required properties:
> > +- compatible:
> > +  - "socionext,uniphier-pxs2-dwc3" : For UniPhier PXs2 SoC
> > +  - "socionext,uniphier-ld20-dwc3" : For UniPhier LD20 SoC
> > +- reg: Address and range of the glue logic
> > +- clocks: List of phandles for the clocks, and the number of phandles depends
> > +	  on SoC platform.
> 
> Number of clocks needs to be specific. It should be fixed per 
> compatible.

I'll apply dwc3-of-simple framework for core part and separate phy part
from the driver, and as a result the clocks will be separated into clocks
for core and phy.

The core clocks will be described with "clock-names" property like Qualcomm's
dwc3 driver in Documentation/devicetree/bindings/usb/qcom,dwc3.txt.

I think the remaining clocks will be also defined with clock-names properties
or fixed according to the compatible string in the phy driver.

> > +
> > +Optional properties:
> > +- resets: List of phandles for the resets, and the number of phandles depends
> > +	on SoC platform.
> 
> Same here.

Same as above.

Thank you,

---
Best Regards,
Kunihiko Hayashi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
