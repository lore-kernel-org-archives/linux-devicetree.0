Return-Path: <SRS0=hZYI=QZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:45474 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728394AbfBRMAj (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 18 Feb 2019 07:00:39 -0500
Date: Mon, 18 Feb 2019 13:59:45 +0200
From: "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 2/2] media: atmel-isc: Update device tree binding
 documentation
Message-ID: <20190218115945.oevov3zatqnttrwx@valkosipuli.retiisi.org.uk>
References: <20190204141756.234563-1-ksloat@aampglobal.com>
 <20190204141756.234563-2-ksloat@aampglobal.com>
 <20190214154422.GA18167@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190214154422.GA18167@bogus>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Ken Sloat <KSloat@aampglobal.com>, "eugen.hristev@microchip.com" <eugen.hristev@microchip.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 14, 2019 at 09:44:22AM -0600, Rob Herring wrote:
> On Mon, Feb 04, 2019 at 02:18:14PM +0000, Ken Sloat wrote:
> > From: Ken Sloat <ksloat@aampglobal.com>
> 
> Needs a better subject, not one that applies to any change. Update with 
> what?
> 
> > Update device tree binding documentation specifying how to
> > enable BT656 with CRC decoding and specify properties for
> > default parallel bus type.
> > 
> > Signed-off-by: Ken Sloat <ksloat@aampglobal.com>
> > ---
> >  Changes in v2:
> >  -Use correct media "bus-type" dt property.
> > 
> >  Changes in v3:
> >  -Specify default bus type.
> >  -Document optional parallel bus flags.
> > 
> >  .../devicetree/bindings/media/atmel-isc.txt       | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/atmel-isc.txt b/Documentation/devicetree/bindings/media/atmel-isc.txt
> > index bbe0e87c6188..db3749a3964f 100644
> > --- a/Documentation/devicetree/bindings/media/atmel-isc.txt
> > +++ b/Documentation/devicetree/bindings/media/atmel-isc.txt
> > @@ -21,6 +21,21 @@ Required properties for ISC:
> >  - pinctrl-names, pinctrl-0
> >  	Please refer to pinctrl-bindings.txt.
> >  
> > +Optional properties for ISC:
> > +- bus-type
> > +	When set to 6, Bt.656 decoding (embedded sync) with CRC decoding
> > +	is enabled. If omitted, then the default bus-type is parallel and
> > +	the additional properties to follow can be specified:
> > +- hsync-active
> > +	Active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> > +	If unspecified, this signal is set as active HIGH.
> > +- vsync-active
> > +	Active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
> > +	If unspecified, this signal is set as active HIGH.
> > +- pclk-sample
> > +	Sample data on rising (1) or falling (0) edge of the pixel clock
> > +	signal. If unspecified, data is sampled on the rising edge.
> 
> These are all common properties, right? No need to redefine them. Just 
> reference the common doc. Maybe the default needs to be stated here if 
> different or not defined.

Yeah, video-interfaces.txt does not define the defaults; it's hardware
specific.

-- 
Sakari Ailus
