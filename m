Return-Path: <SRS0=u3Zw=P7=vger.kernel.org=devicetree-owner@kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:55784 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726203AbfAWMqG (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 23 Jan 2019 07:46:06 -0500
Date: Wed, 23 Jan 2019 14:45:38 +0200
From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 2/2] media: atmel-isc: Update device tree binding
 documentation
Message-ID: <20190123124538.5vfxhsyl2npy4jnp@valkosipuli.retiisi.org.uk>
References: <20190118142803.70160-1-ksloat@aampglobal.com>
 <20190118142803.70160-2-ksloat@aampglobal.com>
 <0c000df0-94ec-e8bf-e6b1-1a8a94170181@microchip.com>
 <DM5PR07MB411967243FA1C96C1179071FAD9C0@DM5PR07MB4119.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM5PR07MB411967243FA1C96C1179071FAD9C0@DM5PR07MB4119.namprd07.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
To: Ken Sloat <KSloat@aampglobal.com>
Cc: "Eugen.Hristev@microchip.com" <Eugen.Hristev@microchip.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "Ludovic.Desroches@microchip.com" <Ludovic.Desroches@microchip.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jan 18, 2019 at 06:05:23PM +0000, Ken Sloat wrote:
> > -----Original Message-----
> > From: Eugen.Hristev@microchip.com <Eugen.Hristev@microchip.com>
> > Sent: Friday, January 18, 2019 9:40 AM
> > To: Ken Sloat <KSloat@aampglobal.com>
> > Cc: mchehab@kernel.org; Nicolas.Ferre@microchip.com;
> > alexandre.belloni@bootlin.com; Ludovic.Desroches@microchip.com; linux-
> > media@vger.kernel.org; devicetree@vger.kernel.org
> > Subject: Re: [PATCH v2 2/2] media: atmel-isc: Update device tree binding
> > documentation
> > 
> > 
> > 
> > On 18.01.2019 16:28, Ken Sloat wrote:
> > > From: Ken Sloat <ksloat@aampglobal.com>
> > >
> > > Update device tree binding documentation specifying how to enable
> > > BT656 with CRC decoding.
> > >
> > > Signed-off-by: Ken Sloat <ksloat@aampglobal.com>
> > > ---
> > >   Changes in v2:
> > >   -Use correct media "bus-type" dt property.
> > >
> > >   Documentation/devicetree/bindings/media/atmel-isc.txt | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/atmel-isc.txt
> > > b/Documentation/devicetree/bindings/media/atmel-isc.txt
> > > index bbe0e87c6188..2d4378dfd6c8 100644
> > > --- a/Documentation/devicetree/bindings/media/atmel-isc.txt
> > > +++ b/Documentation/devicetree/bindings/media/atmel-isc.txt
> > > @@ -21,6 +21,11 @@ Required properties for ISC:
> > >   - pinctrl-names, pinctrl-0
> > >   	Please refer to pinctrl-bindings.txt.
> > >
> > > +Optional properties for ISC:
> > > +- bus-type
> > > +	When set to 6, Bt.656 decoding (embedded sync) with CRC decoding
> > > +	is enabled.
> > > +
> > 
> > I don't think this patch is required at all actually, the binding complies to the
> > video-interfaces bus specification which includes the parallel and bt.656.
> > 
> > Would be worth mentioning below explicitly that parallel and bt.656 are
> > supported, or added above that also plain parallel bus is supported ?
> > 
> > >   ISC supports a single port node with parallel bus. It should contain
> > > one
> > 
> > here inside the previous line
> Hi Eugen,
> 
> Yes it's true adding new documentation here may be overkill, but yes it should say something
> (as a user I always find it helpful if the docs are more verbose than not).
> 
> So per your suggestion, how about the simplified:
> "ISC supports a single port node with parallel bus and optionally Bt.656 support."
> 
> and I'll remit the other statements.

Please still include the name of the property, as well as the valid values
for it (numeric as well as human-readable). The rest of the documentation
should stay in video-interfaces.txt IMO --- this is documentation for the
hardware only.

-- 
Regards,

Sakari Ailus
