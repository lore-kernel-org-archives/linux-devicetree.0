From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 1/2] dt-bindings: media: Add Cadence MIPI-CSI2 RX
 Device Tree bindings
Date: Tue, 26 Sep 2017 10:33:53 +0300
Message-ID: <20170926073353.jzfx2gxy5pa5piyp@valkosipuli.retiisi.org.uk>
References: <20170922100823.18184-1-maxime.ripard@free-electrons.com>
 <20170922100823.18184-2-maxime.ripard@free-electrons.com>
 <20170922113522.4nbls3bb3sglsu55@valkosipuli.retiisi.org.uk>
 <20170922145404.444dqynmqz34jm7c@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170922145404.444dqynmqz34jm7c@flea.lan>
Sender: linux-media-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Cyprian Wronka <cwronka@cadence.com>, Richard Sproul <sproul@cadence.com>, Alan Douglas <adouglas@cadence.com>, Steve Creaney <screaney@cadence.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Benoit Parrot <bparrot@ti.com>, nm@ti.com
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Fri, Sep 22, 2017 at 04:54:04PM +0200, Maxime Ripard wrote:
> Hi Sakari,
> 
> On Fri, Sep 22, 2017 at 11:35:23AM +0000, Sakari Ailus wrote:
...
> > > +           Documentation/devicetree/bindings/media/video-interfaces.txt. The
> > > +           port nodes numbered as follows.
> > > +
> > > +           Port Description
> > > +           -----------------------------
> > > +           0    CSI-2 input
> > > +           1    Stream 0 output
> > > +           2    Stream 1 output
> > > +           3    Stream 2 output
> > > +           4    Stream 3 output
> > > +
> > > +           The stream output port nodes are optional if they are not connected
> > > +           to anything at the hardware level or implemented in the design.
> > 
> > Could you add supported endpoint numbers, please?
> > 
> > <URL:https://patchwork.linuxtv.org/patch/44409/>
> 
> So in the case where you have a single endpoint, usually you don't
> provide an endpoint number at all. Should I document it as zero, or as
> "no number"?

Good question. If the endpoint numbers generally aren't meaningful for the
device, no number should be equally good. But that should be documented.

Just my opinion. I wonder what Rob thinks.

I'll update the documentation patch.

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi
