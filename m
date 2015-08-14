From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 08/10] Doc: usb: ci-hdrc-usb2: add
 tx(rx)-burst-config-dword for binding doc
Date: Fri, 14 Aug 2015 12:02:37 +0200
Message-ID: <1439546557.13210.52.camel@pengutronix.de>
References: <1438931747-25209-1-git-send-email-peter.chen@freescale.com>
	 <1438931747-25209-9-git-send-email-peter.chen@freescale.com>
	 <1439541450.13210.31.camel@pengutronix.de>
	 <20150814084050.GE11072@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150814084050.GE11072@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Freitag, den 14.08.2015, 16:40 +0800 schrieb Peter Chen:
> On Fri, Aug 14, 2015 at 10:37:30AM +0200, Lucas Stach wrote:
> > Am Freitag, den 07.08.2015, 15:15 +0800 schrieb Peter Chen:
> > > It is used to override the default setting for burst size, changing
> > > burst size takes effect only when the SBUSCFG.AHBBRST = 0.
> > > 
> > > Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > ---
> > >  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > > index d52a747..d71ef07 100644
> > > --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > > +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
> > > @@ -37,6 +37,14 @@ Optional properties:
> > >    property is used to change AHB burst configuration, check the chipidea
> > >    spec for meaning of each value. If this property is not existed, it
> > >    will use the reset value.
> > > +- tx-burst-size-dword: it is vendor dependent, the tx burst size in dword
> > > +  (4 bytes), This register represents the maximum length of a the burst
> > > +  in 32-bit words while moving data from system memory to the USB
> > > +  bus, changing this value takes effect only the SBUSCFG.AHBBRST is 0.
> > 
> > The last bits about SBUSCFG.AHBBRST don't make any sense in the DT
> > binding. The DT writer doesn't know about the SBUSCFG.AHBBRST value and
> > should not care either.
> > If someone sets the burst size to something
> > non-standard in the DT, the driver should make sure to enable to
> > necessary bits to make this setting take effect.
> 
> The SBUSCFG.AHBBRST property description is just above this one,
> and the user should read the spec for changing these system
> configuration parameters.
> 
This is not clear from the description. This should read something like
"The value of this property will only take effect if property
ahb-burst-config is set to 0."

The DT binding should be coherent and understandable without reading the
DW USB spec and/or the code. Please take some care about this.

> This requirement is from the spec, and the code logic makes sure
> the burst size changes only when SBUSCFG.AHBBRST is 0, since the
> hardware will only change burst size if SBUSCFG.AHBBRST is 0.
> 
> > 
> > Also both those descriptions are missing a description to what value the
> > burst sizes will be set if the DT properties are not found. If it's
> > implementation defined spell this out in the doc.
> 
> It is optional property, if without this property, it will use the
> default value.
> 
Then specify this in the binding. Again, the binding is a spec that one
should be able to understand without reading the code.

"If this property is missing the reset defaults of the hardware
implementation will be used."

> > 
> > Are there really cases where it makes sense to set RX and TX burst sizes
> > to different values?
> 
> Yes, the default burst size is the same for all SoCs, but the bus
> burst size may be larger for some SoCs.
> 
This question wasn't meant to dispute the RX/TX burst size
configuration, but I'm questioning if it really makes sense to set them
to different values. Do we really need 2 properties for this, or is 1
enough?

Do you see any use case where someone would like to do something like:
tx-burst-size-dword = <0x8>;
rx-burst-size-dword = <0x10>;

Regards,
Lucas
-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
