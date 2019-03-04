Return-Path: <SRS0=7+V5=RH=linux.intel.com=sakari.ailus@kernel.org>
Date: Mon, 4 Mar 2019 20:18:11 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 3/3] media: tc358746: update MAINTAINERS file
Message-ID: <20190304181810.2eyjkn4e2g6ntngb@kekkonen.localdomain>
References: <20181218141240.3056-1-m.felsch@pengutronix.de>
 <20181218141240.3056-4-m.felsch@pengutronix.de>
 <20190218114608.qvoeyxlaw4yjrnnh@paasikivi.fi.intel.com>
 <20190304173151.zwrwuwrepzeegfa3@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190304173151.zwrwuwrepzeegfa3@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: hans.verkuil@cisco.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, graphics@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 04, 2019 at 06:31:51PM +0100, Marco Felsch wrote:
> Hi Sakari,
> 
> On 19-02-18 13:46, Sakari Ailus wrote:
> > Hi Marco,
> > 
> > On Tue, Dec 18, 2018 at 03:12:40PM +0100, Marco Felsch wrote:
> > > Add me as partial maintainer, others are welcome too.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  MAINTAINERS | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 546f8d936589..f97dedbe545c 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15230,6 +15230,13 @@ S:	Maintained
> > >  F:	drivers/media/i2c/tc358743*
> > >  F:	include/media/i2c/tc358743.h
> > >  
> > > +TOSHIBA TC358746 DRIVER
> > > +M:	Marco Felsch <kernel@pengutronix.de>
> > > +L:	linux-media@vger.kernel.org
> > > +S:	Odd Fixes
> > > +F:	drivers/media/i2c/tc358746*
> > > +F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
> > > +
> > >  TOSHIBA WMI HOTKEYS DRIVER
> > >  M:	Azael Avalos <coproscefalo@gmail.com>
> > >  L:	platform-driver-x86@vger.kernel.org
> > 
> > This should go together with the DT bindings, in the same patch.
> > 
> > I'd expect a new driver to be listed as "Maintained". "Odd Fixes" suggests
> > no-one is particularly looking after it, and it's not nice if a new driver
> > starts off like that. :-I
> 
> Okay, I will squash it in the v2 and set the status to "Maintained".

Thanks!

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
