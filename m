From: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
Subject: Re: [PATCH 2/3] Documentation: dt: iio: add mcp4725/6 dac device
 binding
Date: Mon, 3 Oct 2016 14:32:54 +0200
Message-ID: <20161003143254.5df585e1@tomas.local.tbs-biometrics.cz>
References: <1475241588-18429-1-git-send-email-tomas@novotny.cz>
        <1475241588-18429-3-git-send-email-tomas@novotny.cz>
        <ac9b5f52-5ac1-52a9-aa9a-eb812639e033@kernel.org>
        <8815a607-c9e3-e7e7-0884-2d5d49c353b4@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8815a607-c9e3-e7e7-0884-2d5d49c353b4-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yong Li <sdliyong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jonathan,

On Sat, 1 Oct 2016 12:21:57 +0100, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On 01/10/16 12:15, Jonathan Cameron wrote:
> > On 30/09/16 14:19, Tomas Novotny wrote:
> >> Signed-off-by: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
> >> ---
> >>  .../devicetree/bindings/iio/dac/mcp4725.txt        | 28 ++++++++++++++++++++++
> >>  1 file changed, 28 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/iio/dac/mcp4725.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/iio/dac/mcp4725.txt b/Documentation/devicetree/bindings/iio/dac/mcp4725.txt
> >> new file mode 100644
> >> index 0000000..69c9462
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/iio/dac/mcp4725.txt
> >> @@ -0,0 +1,28 @@
> >> +Microchpip mcp4725 and mcp4726 DAC device driver
> >> +
> >> +Required properties:
> >> +	- compatible: Must be "microchip,mcp4725" or "microchip,mcp4726"
> >> +	- reg: Should contain the DAC I2C address
> >> +	- vref-millivolt: Value of the reference voltage
> Sorry dozing this morning so missed this until looking at the code.
> 
> Use the regulator framework to supply two regulators:
> 
> vref-suppy and vdd-supply
> first one optional.
> 
> Then query them in the driver.  Much more flexible than just hard coding
> a value here.  Entirely possible to have a variable regulator used for
> the reference.

I see now that this is a pretty standard approach in the iio/dac. I will do
it in the regulator way. I will send v2 then.

Thanks for the review,

Tomas

> >> +
> >> +Optional properties:
> >> +	- vref-mode: Reference voltage selection. It is available only on
> > Not a generic attribute, so wants to have a vendor prefix on it.
> >> +	  mcp4726. Valid values are:
> >> +		- 0, 1: Vdd pin voltage (unbuffered)
> > This should not be a direct mapping of the register values but rather
> > a means to control the setting.  Having two values mapping to the
> > same thing makes no sense.
> > 
> > Would also be odd to specify a vref and then not use it.  So you could
> > infer this first option.
> >> +		- 2: Vref pin voltage unbuffered
> >> +		- 3: Vref pin voltage internally buffered
> > Having inferred the first option then this becomes control of whether it
> > is buffered  or not. So could be named appropriately to cover that.
> > Might be nice to have a little note here on why you might want the
> > buffer or not..
> >> +
> >> +Examples:
> >> +
> >> +        mcp4725@60 {
> >> +                compatible = "microchip,mcp4725";
> >> +                reg = <0x60>;
> >> +                vref-millivolt = <3300>;
> >> +        };
> >> +
> >> +        mcp4726@60 {
> >> +                compatible = "microchip,mcp4726";
> >> +                reg = <0x60>;
> >> +                vref-mode = <2>;
> >> +                vref-millivolt = <2500>;
> 
> >> +        };
> >>
> > 
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
