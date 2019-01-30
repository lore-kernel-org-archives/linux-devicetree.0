Return-Path: <SRS0=IkuC=QG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:34810 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726548AbfA3Kv4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 30 Jan 2019 05:51:56 -0500
Date: Wed, 30 Jan 2019 12:51:00 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 2/2] media: atmel-isc: Update device tree binding
 documentation
Message-ID: <20190130105100.a4fgyu65cucgogfe@valkosipuli.retiisi.org.uk>
References: <DM5PR07MB411967243FA1C96C1179071FAD9C0@DM5PR07MB4119.namprd07.prod.outlook.com>
 <20190123124538.5vfxhsyl2npy4jnp@valkosipuli.retiisi.org.uk>
 <BL0PR07MB4115CF2CA5F69C3963AC58BBAD970@BL0PR07MB4115.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR07MB4115CF2CA5F69C3963AC58BBAD970@BL0PR07MB4115.namprd07.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
To: Ken Sloat <KSloat@aampglobal.com>
Cc: "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "Ludovic.Desroches@microchip.com" <Ludovic.Desroches@microchip.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Ken,

On Tue, Jan 29, 2019 at 08:22:48PM +0000, Ken Sloat wrote:
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@iki.fi>
> > Sent: Wednesday, January 23, 2019 7:46 AM
> > Cc: Eugen.Hristev@microchip.com; mchehab@kernel.org;
> > Nicolas.Ferre@microchip.com; alexandre.belloni@bootlin.com;
> > Ludovic.Desroches@microchip.com; linux-media@vger.kernel.org;
> > devicetree@vger.kernel.org
> > Subject: Re: [PATCH v2 2/2] media: atmel-isc: Update device tree binding
> > documentation
> > 
> > On Fri, Jan 18, 2019 at 06:05:23PM +0000, Ken Sloat wrote:
> > > > -----Original Message-----
> > > > From: Eugen.Hristev@xxxxxxxxxxxxx <Eugen.Hristev@xxxxxxxxxxxxx>
> > > > Sent: Friday, January 18, 2019 9:40 AM
> > > > To: Ken Sloat <KSloat@xxxxxxxxxxxxxx>
> > > > Cc: mchehab@xxxxxxxxxx; Nicolas.Ferre@xxxxxxxxxxxxx;
> > > > alexandre.belloni@xxxxxxxxxxx; Ludovic.Desroches@xxxxxxxxxxxxx;
> > > > linux- media@xxxxxxxxxxxxxxx; devicetree@xxxxxxxxxxxxxxx
> > > > Subject: Re: [PATCH v2 2/2] media: atmel-isc: Update device tree
> > > > binding documentation
> > > >
> > > >
> > > >
> > > > On 18.01.2019 16:28, Ken Sloat wrote:
> > > > > From: Ken Sloat <ksloat@xxxxxxxxxxxxxx>
> > > > >
> > > > > Update device tree binding documentation specifying how to enable
> > > > > BT656 with CRC decoding.
> > > > >
> > > > > Signed-off-by: Ken Sloat <ksloat@xxxxxxxxxxxxxx>
> > > > > ---
> > > > >   Changes in v2:
> > > > >   -Use correct media "bus-type" dt property.
> > > > >
> > > > >   Documentation/devicetree/bindings/media/atmel-isc.txt | 5 +++++
> > > > >   1 file changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/media/atmel-isc.txt
> > > > > b/Documentation/devicetree/bindings/media/atmel-isc.txt
> > > > > index bbe0e87c6188..2d4378dfd6c8 100644
> > > > > --- a/Documentation/devicetree/bindings/media/atmel-isc.txt
> > > > > +++ b/Documentation/devicetree/bindings/media/atmel-isc.txt
> > > > > @@ -21,6 +21,11 @@ Required properties for ISC:
> > > > >   - pinctrl-names, pinctrl-0
> > > > >   	Please refer to pinctrl-bindings.txt.
> > > > >
> > > > > +Optional properties for ISC:
> > > > > +- bus-type
> > > > > +	When set to 6, Bt.656 decoding (embedded sync) with CRC decoding
> > > > > +	is enabled.
> > > > > +
> > > >
> > > > I don't think this patch is required at all actually, the binding
> > > > complies to the video-interfaces bus specification which includes the
> > parallel and bt.656.
> > > >
> > > > Would be worth mentioning below explicitly that parallel and bt.656
> > > > are supported, or added above that also plain parallel bus is supported ?
> > > >
> > > > >   ISC supports a single port node with parallel bus. It should
> > > > > contain one
> > > >
> > > > here inside the previous line
> > > Hi Eugen,
> > >
> > > Yes it's true adding new documentation here may be overkill, but yes
> > > it should say something (as a user I always find it helpful if the docs are
> > more verbose than not).
> > >
> > > So per your suggestion, how about the simplified:
> > > "ISC supports a single port node with parallel bus and optionally Bt.656
> > support."
> > >
> > > and I'll remit the other statements.
> > 
> > Please still include the name of the property, as well as the valid values for it
> > (numeric as well as human-readable). The rest of the documentation should
> > stay in video-interfaces.txt IMO --- this is documentation for the hardware
> > only.
> > 
> > --
> > Regards,
> > 
> > Sakari Ailus
> 
> Thanks Sakari for the feedback. So my original patch here would be valid
> as is correct?

To the original patch --- could you add that the default is the parallel
interface, if bus-type isn't set?

Documentation for hsync-active, vsync-active and pclk-sample properties is
also missing, it'd be nice to address that at the same time. I'd assume
they're mandatory for the parallel interface as no defaults are specified.

-- 
Regards,

Sakari Ailus
