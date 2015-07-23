From: Badola Nikhil <nikhil.badola@freescale.com>
Subject: RE: [PATCH 1/3] Documentation: dt: dwc3: Add snps,configure-fladj
 property
Date: Thu, 23 Jul 2015 11:07:09 +0000
Message-ID: <SN1PR0301MB162957FD79F00321A42243F3F3820@SN1PR0301MB1629.namprd03.prod.outlook.com>
References: <1437646161-1764-1-git-send-email-nikhil.badola@freescale.com>
 <20150723095635.GA12330@leverpostej>
 <SN1PR0301MB1629C9F2083C8C4F5CE8CE4EF3820@SN1PR0301MB1629.namprd03.prod.outlook.com>
 <20150723105729.GB12330@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150723105729.GB12330@leverpostej>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "balbi@ti.com" <balbi@ti.com>
List-Id: devicetree@vger.kernel.org

> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland@arm.com]
> Sent: Thursday, July 23, 2015 4:27 PM
> To: Badola Nikhil-B46172
> Cc: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; balbi@ti.com
> Subject: Re: [PATCH 1/3] Documentation: dt: dwc3: Add snps,configure-fladj
> property
> 
> On Thu, Jul 23, 2015 at 11:52:19AM +0100, Badola Nikhil wrote:
> > > -----Original Message-----
> > > From: Mark Rutland [mailto:mark.rutland@arm.com]
> > > Sent: Thursday, July 23, 2015 3:27 PM
> > > To: Badola Nikhil-B46172
> > > Cc: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org;
> > > balbi@ti.com
> > > Subject: Re: [PATCH 1/3] Documentation: dt: dwc3: Add
> > > snps,configure-fladj property
> > >
> > > On Thu, Jul 23, 2015 at 11:09:21AM +0100, Nikhil Badola wrote:
> > > > Add property snps,configure-fladj for enabling post silicon frame
> > > > length adjustment
> > > >
> > > > Signed-off-by: Nikhil Badola <nikhil.badola@freescale.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt
> > > > b/Documentation/devicetree/bindings/usb/dwc3.txt
> > > > index 0815eac..90c3972 100644
> > > > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > > > +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> > > > @@ -40,6 +40,7 @@ Optional properties:
> > > >   - snps,hird-threshold: HIRD threshold
> > > >   - snps,hsphy_interface: High-Speed PHY interface selection
> > > > between
> > > "utmi" for
> > > >     UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE
> > > > has
> > > value 3.
> > > > + - snps,configure-fladj: enables post-silicon frame length
> > > > + adjustment
> > >
> > > Could you elaborate on what this means and why you think it's
> necessary?
> >
> > This property enables the use of GFLADJ_30MHZ field value of gfladj
> > register for frame length adjustment instead of considering from the
> sideband input signal fladj_30mhz_reg from SOC.
> > This is required when signal fladj_30mhz_reg is connected to a wrong
> > value or is not valid as in our case, hence post-silicon.
> 
> Ok, so this is basically an override for the GFLADJ_30MHZ field of the gfladj
> register when there was a problem at integration time.
>

That's right. 
 
> > However this field can be used to adjust any offset ranging from 00h
> > to 3Fh, from the clock source generating SOF(start of frame) packets.
> > Thus, this property can be added to device tree with appropriate
> adjustment value.
> 
> It takes a value? The description above makes it sound like a boolean
> property.
> 
> I'd expect a description more like:
> 
> - snps,fladj-override: Value for GFLADJ_30MHZ when the fladj_30mhz_reg
>   signal is invalid or incorrect.
> 
> Which makes it clear what the value is and when it should be set.

Agreed. Will change and send a new version of the patch-set.

> 
> Thanks,
> Mark.
