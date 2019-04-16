Return-Path: <SRS0=9js/=SS=pengutronix.de=mfe@kernel.org>
Date: Tue, 16 Apr 2019 12:45:50 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 1/3] media: dt-bindings: add bindings for Toshiba TC358746
Message-ID: <20190416104550.htexnpzgypuuubo4@pengutronix.de>
References: <20181218141240.3056-2-m.felsch@pengutronix.de>
 <20190218100333.qvptfllrd4pyhsyb@paasikivi.fi.intel.com>
 <20190301105235.a23jwiwmxejuv2yf@pengutronix.de>
 <a51ecc47-df19-a48b-3d82-01b21d03972c@gmail.com>
 <20190301130118.jy57g5wcsn7mqclk@pengutronix.de>
 <20190304123621.l3ocvdiya5z5wzal@paasikivi.fi.intel.com>
 <20190304165528.n4sqxjhfsplmt5km@pengutronix.de>
 <20190304181747.ax7nvbvhdul4vtna@kekkonen.localdomain>
 <20190305084902.vzaqr53q77oy2o7r@uno.localdomain>
 <20190305181419.kqdaqnjte3v7663f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190305181419.kqdaqnjte3v7663f@pengutronix.de>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Ian Arkver <ian.arkver.dev@gmail.com>, robh+dt@kernel.org, hans.verkuil@cisco.com, Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org, graphics@pengutronix.de, linux-media@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

gentle ping.

Regards,
  Marco

On 19-03-05 19:14, Marco Felsch wrote:
> Hi Rob,
> 
> I think you didn't followed the discussion in detail so I will ask you
> personal. In short the tc358746 can act as parallel-in -> csi-out or as
> csi->in -> parallel-out device. The phyiscal pins are always the same
> only the internal timings are different. So we have two ports with two
> endpoints.
> 
> Now the question is how we determine the mode. We have two approaches:
> 1)
>   port@0 -> input port
>   port@1 -> output port
> 
>   pro:
>   + no extra vendor specific binding is needed to determine the mode
> 
>   con:
>   - input/output endpoint can be parallel or mipi-csi2.
> 
> 2)
>   port@0 -> parallel port
>   port@1 -> mipi-csi2 port
> 
>   pro:
>   + input/output endpoint are fixed to parallel or mipi
> 
>   con:
>   - vendor specific binding is needed to determine the mode
> 
> Thanks for your comments :)
> 
> Regards,
> Marco
> 
> On 19-03-05 09:49, Jacopo Mondi wrote:
> > Hi Sakari, Marco,
> > 
> > On Mon, Mar 04, 2019 at 08:17:48PM +0200, Sakari Ailus wrote:
> > > Hi Marco,
> > >
> > > On Mon, Mar 04, 2019 at 05:55:28PM +0100, Marco Felsch wrote:
> > > > > > (more device specific)
> > > > > > tc358746,default-mode = <CSI-Tx> /* Parallel-in -> CSI-out */
> > > > > > tc358746,default-mode = <CSI-Rx> /* CSI-in -> Parallel-out */
> > > > > >
> > > > > > or
> > > > > >
> > > > > > (more generic)
> > > > > > tc358746,default-dir = <PARALLEL_TO_CSI2>
> > > > > > tc358746,default-dir = <CSI2_TO_PARALLEL>
> > > > >
> > > > > The prefix for Toshiba is "toshiba". What would you think of
> > > > > "toshiba,csi2-direction" with values of either "rx" or "tx"? Or
> > > > > "toshiba,csi2-mode" with either "master" or "slave", which would be a
> > > > > little bit more generic, but could be slightly more probable to get wrong
> > > > > as well.
> > > >
> > > > You're right mixed the prefix with the device.. If we need to introduce
> > > > a property I would prefer the "toshiba,csi2-direction" one. I said if
> > > > because as Jacopo mentioned we can avoid the property by define port@0
> > > > as input and port@1 as output. I tink that's the best solution, since we
> > > > can avoid device specific bindings and it's common to use the last port
> > > > as output (e.g. video-mux).
> > >
> > > The ports represent hardware and I think I would avoid reordering them. I
> > > wonder what would the DT folks prefer.
> > >
> > 
> > I might have missed why you mention re-ordering? :)
> > 
> > > The device specific property is to the point at least: it describes an
> > > orthogonal part of the device configuration. That's why I'd pick that if I
> > > were to choose. But I'll let Rob to comment on this.
> > 
> > That's true indeed. Let's wait for inputs from DT people, I'm fine
> > with both approaches.
> > 
> > Thanks
> >    j
> > 
> > >
> > > --
> > > Regards,
> > >
> > > Sakari Ailus
> > > sakari.ailus@linux.intel.com
> 
> 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
