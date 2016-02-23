From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 6/6] drm/msm/dsi: Parse DSI lanes via DT
Date: Tue, 23 Feb 2016 14:04:46 -0600
Message-ID: <20160223200446.GA28828@rob-hp-laptop>
References: <1455541259-8967-1-git-send-email-architt@codeaurora.org>
 <1455541259-8967-7-git-send-email-architt@codeaurora.org>
 <20160222025345.GB15973@rob-hp-laptop>
 <56CAB678.3080505@codeaurora.org>
 <CAL_JsqLVd3vLGO8SCQv=PFXb7yD42U_nKG=fxenc4Fy63yiezw@mail.gmail.com>
 <56CC23CD.5010708@ti.com>
 <56CC37BB.3060305@codeaurora.org>
 <56CC3E5C.3060101@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56CC3E5C.3060101@ti.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Archit Taneja <architt@codeaurora.org>, Rob Clark <robdclark@gmail.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 23, 2016 at 01:11:24PM +0200, Tomi Valkeinen wrote:
> 
> 
> On 23/02/16 12:43, Archit Taneja wrote:
> > 
> > 
> > On 02/23/2016 02:48 PM, Tomi Valkeinen wrote:
> >>
> >> On 22/02/16 22:10, Rob Herring wrote:
> >>
> >>>> If we want all DSI host controllers to use a common binding to describe
> >>>> lanes, we'd need to go with the most flexible one, and the driver
> >>>> restricts it to the subsets that we support.
> >>
> >> True, but I wonder if that's necessary. The lane property for the SoC
> >> should be read by the SoC specific driver, right? So the DT property can
> >> be anything. I'm not sure if there's ever a reason for a generic code to
> >> observe the DSI lane setup.
> > 
> > Yeah, it is very SoC specific.

Agreed.

> > The only place where it might matter is if a panel/bridge ever needs to
> > know what pins implement what lanes on the platform. A common binding
> > there might help us keep the panel driver generic. Although, this need
> > itself is a bit hypothetical.
> 
> My opinion here is that if the panel/bridge needs to know something
> about the DSI lanes/pins, we should have that data in the
> panel's/bridge's endpoint data.
> 
> So if both SoC and the DSI peripheral need complex DSI pin/lane setup,
> you might have very similar data on both sides. There's possibly some
> duplication there, but I think it keeps things much simpler.
> 
> For example, if the SoC needs OMAP style DSI pin data, and the DSI
> peripheral needs to know the amount of DSI lanes used (but nothing
> else), you might think it's nice if the DSI peripheral would peek at the
> SoC side data, finding out about the DSI lanes.
> 
> But I think in that case you should just add a "num-lanes" property to
> the DSI peripheral. The DT data for a device should be private to the
> driver handling the device, except for some special cases like following
> the graph.

num-lanes might not be enough. You could need to have a mask instead. 
Not sure if there is really any h/w like that though.

Also, I think it is fine for a parent to look at standard properties in 
a child.

Rob
