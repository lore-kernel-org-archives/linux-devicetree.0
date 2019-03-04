Return-Path: <SRS0=7+V5=RH=linux.intel.com=sakari.ailus@kernel.org>
Date: Mon, 4 Mar 2019 20:17:48 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 1/3] media: dt-bindings: add bindings for Toshiba TC358746
Message-ID: <20190304181747.ax7nvbvhdul4vtna@kekkonen.localdomain>
References: <20181218141240.3056-1-m.felsch@pengutronix.de>
 <20181218141240.3056-2-m.felsch@pengutronix.de>
 <20190218100333.qvptfllrd4pyhsyb@paasikivi.fi.intel.com>
 <20190301105235.a23jwiwmxejuv2yf@pengutronix.de>
 <a51ecc47-df19-a48b-3d82-01b21d03972c@gmail.com>
 <20190301130118.jy57g5wcsn7mqclk@pengutronix.de>
 <20190304123621.l3ocvdiya5z5wzal@paasikivi.fi.intel.com>
 <20190304165528.n4sqxjhfsplmt5km@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190304165528.n4sqxjhfsplmt5km@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Ian Arkver <ian.arkver.dev@gmail.com>, hans.verkuil@cisco.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, graphics@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi Marco,

On Mon, Mar 04, 2019 at 05:55:28PM +0100, Marco Felsch wrote:
> > > (more device specific)
> > > tc358746,default-mode = <CSI-Tx> /* Parallel-in -> CSI-out */
> > > tc358746,default-mode = <CSI-Rx> /* CSI-in -> Parallel-out */
> > > 
> > > or
> > > 
> > > (more generic)
> > > tc358746,default-dir = <PARALLEL_TO_CSI2>
> > > tc358746,default-dir = <CSI2_TO_PARALLEL>
> > 
> > The prefix for Toshiba is "toshiba". What would you think of
> > "toshiba,csi2-direction" with values of either "rx" or "tx"? Or
> > "toshiba,csi2-mode" with either "master" or "slave", which would be a
> > little bit more generic, but could be slightly more probable to get wrong
> > as well.
> 
> You're right mixed the prefix with the device.. If we need to introduce
> a property I would prefer the "toshiba,csi2-direction" one. I said if
> because as Jacopo mentioned we can avoid the property by define port@0
> as input and port@1 as output. I tink that's the best solution, since we
> can avoid device specific bindings and it's common to use the last port
> as output (e.g. video-mux).

The ports represent hardware and I think I would avoid reordering them. I
wonder what would the DT folks prefer.

The device specific property is to the point at least: it describes an
orthogonal part of the device configuration. That's why I'd pick that if I
were to choose. But I'll let Rob to comment on this.

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
