From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 2/3] media: Add lane checks for Cadence CSI2RX
Date: Mon, 9 Sep 2019 10:51:53 +0300
Message-ID: <20190909075153.GA843@valkosipuli.retiisi.org.uk>
References: <20190905105601.27034-1-jank@cadence.com>
 <20190905105601.27034-3-jank@cadence.com>
 <20190906075413.GE1586@valkosipuli.retiisi.org.uk>
 <1D1666FD-CFC6-4DE1-8A2E-1809D1BDEAAB@global.cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1D1666FD-CFC6-4DE1-8A2E-1809D1BDEAAB@global.cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kotas <jank@cadence.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, "mchehab@kernel.org" <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rafal Ciepiela <rafalc@cadence.com>, linux-media <linux-media@vger.kernel.org>, linux-devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 09, 2019 at 07:41:21AM +0000, Jan Kotas wrote:
> 
> 
> Hello Sakari,
> 
> Thanks for your reply.
> > On 6 Sep 2019, at 09:54, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> > 
> > Hi Jan,
> > 
> > Thanks for the patchset.
> > 
> > On Thu, Sep 05, 2019 at 11:56:00AM +0100, Jan Kotas wrote:
> >> /*
> >>  * Driver for Cadence MIPI-CSI2 RX Controller v1.3
> >>  *
> >> - * Copyright (C) 2017 Cadence Design Systems Inc.
> >> + * Copyright (C) 2017-2019 Cadence Design Systems Inc.
> >>  */
> >> 
> >> +	for (i = 0; i < csi2rx->num_lanes; i++) {
> >> +		if (csi2rx->lanes[i] < 1) {
> > 
> > Do you need this? v4l2_fwnode_parse_endpoint() already has a more thorough
> > check for the lane numbers.
> 
> I looked at the source code of v4l2_fwnode_endpoint_parse_csi2_bus
> and this particular case doesn’t seem to be checked.

Not specifically, since 0 is a valid lane number.

However, the driver only appears to be using the information on how many
lanes there are. If the hardware doesn't support lane routing, then this is
all you need. Otherwise additional checks should be added in case there are
limitations how the lanes can be routed.

-- 
Sakari Ailus
