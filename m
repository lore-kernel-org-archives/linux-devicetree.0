From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [RESEND PATCH 5/5] devicetree: mfd: max14577: Add device tree
 bindings document
Date: Thu, 03 Jul 2014 13:44:34 +0200
Message-ID: <1404387874.21377.8.camel@AMDC1943>
References: <1404198121-22989-1-git-send-email-k.kozlowski@samsung.com>
 <1404198121-22989-6-git-send-email-k.kozlowski@samsung.com>
 <20140703113236.GA28504@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140703113236.GA28504@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On czw, 2014-07-03 at 12:32 +0100, Mark Rutland wrote:
> Hi,
> 
> On Tue, Jul 01, 2014 at 08:02:00AM +0100, Krzysztof Kozlowski wrote:
> > Add document describing device tree bindings for MAX14577 MFD
> > drivers: MFD core, extcon, regulator and charger.
> > 
> > Both MAX14577 and MAX77836 chipsets are documented.
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Cc: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> > Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> > Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> > Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > Reviewed-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/max14577.txt | 152 +++++++++++++++++++++
> >  1 file changed, 152 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/max14577.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/max14577.txt b/Documentation/devicetree/bindings/mfd/max14577.txt
> > new file mode 100644
> > index 000000000000..b235250a7b41
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/max14577.txt
> > @@ -0,0 +1,152 @@
> > +Maxim MAX14577/77836 Multi-Function Device
> > +
> > +MAX14577 is a Multi-Function Device with Micro-USB Interface Circuit, Li+
> > +Battery Charger and SFOUT LDO output for powering USB devices. It is
> > +interfaced to host controller using I2C.
> > +
> > +MAX77836 additionally contains PMIC (with two LDO regulators) and Fuel Gauge.
> > +
> > +
> > +Required properties:
> > +- compatible : Must be "maxim,max14577" or "maxim,max77836".
> > +- reg : I2C slave address for the max14577 chip (0x25 for max14577/max77836)
> > +- interrupts : IRQ line for the chip.
> > +- interrupt-parent :  The parent interrupt controller.
> > +
> > +
> > +Required nodes:
> > + - charger :
> > +	Node for configuring the charger driver.
> > +	Required properties:
> > +		- compatible : "maxim,max14577-charger"
> > +			or "maxim,max77836-charger"
> > +		- maxim,fast-charge-timer : Timer in hours to trigger the
> > +			INT3/MBCCHGERR interrupt; Valid values:
> > +			- 5, 6 or 7 (hours),
> > +			- 0 to disable.
> 
> I'm not sure I follow what this is any why it should be in the DT.
> 
> Could you explain what this is used for?

Hi,

These are settings for max14577 battery charger. Actually this
particular setting does not look like board-specific but other (like
battery voltage) do.

The timer above is used by device to stop charging and to trigger
interrupt.

Best regards,
Krzysztof

> 
> Thanks,
> Mark.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
