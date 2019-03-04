Return-Path: <SRS0=AB2r=RH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:7556 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbfCDMKN (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 4 Mar 2019 07:10:13 -0500
Date: Mon, 4 Mar 2019 14:10:05 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: add bindings for Toshiba TC358746
Message-ID: <20190304121004.qlqf2guz2yt7vnvu@paasikivi.fi.intel.com>
References: <20181218141240.3056-1-m.felsch@pengutronix.de>
 <20181218141240.3056-2-m.felsch@pengutronix.de>
 <20190218100333.qvptfllrd4pyhsyb@paasikivi.fi.intel.com>
 <20190301105235.a23jwiwmxejuv2yf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190301105235.a23jwiwmxejuv2yf@pengutronix.de>
Sender: devicetree-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: hans.verkuil@cisco.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, graphics@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Macro,

On Fri, Mar 01, 2019 at 11:52:35AM +0100, Marco Felsch wrote:
> Hi Sakari,
> 
> On 19-02-18 12:03, Sakari Ailus wrote:
> > Hi Marco,
> > 
> > My apologies for reviewing this so late. You've received good comments
> > already. I have a few more.
> 
> Thanks for your review for the other patches as well =) Sorry for my
> delayed response.
> 
> > On Tue, Dec 18, 2018 at 03:12:38PM +0100, Marco Felsch wrote:
> > > Add corresponding dt-bindings for the Toshiba tc358746 device.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  .../bindings/media/i2c/toshiba,tc358746.txt   | 80 +++++++++++++++++++
> > >  1 file changed, 80 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
> > > new file mode 100644
> > > index 000000000000..499733df744a
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
> > > @@ -0,0 +1,80 @@
> > > +* Toshiba TC358746 Parallel to MIPI CSI2-TX or MIPI CSI2-RX to Parallel Bridge
> > > +
> > > +The Toshiba TC358746 is a bridge that converts a Parallel-in stream to MIPI CSI-2 TX
> > > +or a MIPI CSI-2 RX stream into a Parallel-out. It is programmable through I2C.
> > 
> > This is interesting. The driver somehow needs to figure out the direction
> > of the data flow if it does not originate from DT. I guess it shouldn't as
> > it's not the property of an individual device, albeit in practice in all
> > hardware I've seen the direction of the pipeline is determinable and this
> > is visible in the kAPI as well. So I'm suggesting no changes due to this in
> > bindings, likely we'll need to address it somehow elsewhere going forward.
> 
> What did you mean with "... and this is visible in the kAPI as well"?
> I'm relative new in the linux-media world but I never saw a device which
> supports two directions. Our customer which uses that chip use it
> only in parallel-in/csi-out mode. To be flexible the switching should be
> done by a subdev-ioctl but it is also reasonable to define a default value
> within the DT.

What I meant that the V4L2 sub-device API does not provide any information
on the direction. It is implicit --- MC does, but it does it based on the
links created by the driver.

I agree a DT property would be a good way to tell this, especially now that
there's a related hardware configuration (but which the software cannot
obtain directly).

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
