From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: adv7511: Add regulator bindings
Date: Tue, 06 Dec 2016 18:08:55 +0200
Message-ID: <4504382.pqKQWZshtj@avalon>
References: <1474622430-6704-1-git-send-email-architt@codeaurora.org> <3208429.mJrxuV2Nx6@avalon> <20161206132020.uzchq63pfpaujg6h@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20161206132020.uzchq63pfpaujg6h@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Tuesday 06 Dec 2016 13:20:20 Mark Brown wrote:
> On Tue, Dec 06, 2016 at 02:46:55PM +0200, Laurent Pinchart wrote:
> > On Tuesday 06 Dec 2016 10:05:17 Mark Brown wrote:
> > > On Mon, Dec 05, 2016 at 11:16:22PM +0200, Laurent Pinchart wrote:
> > > > This has been discussed previously, and Rob agreed that if the
> > > > datasheet recommends to power all supplies from the same regulator we
> > > > can take that as a good hint that a single supply should be enough. In
> > > > the very
> > > 
> > > No, don't do this - introducing special snowflake bindings just makes
> > > things more complex at the system level and tells everyone else that
> > > they too can have special snowflake bindings.  Someone should be able to
> > > connect up the regulators based purely on a schematic.  Just describe
> > > the hardware, it's just one extra line in the DT per regulator.
> > 
> > There are power supply pin that have different names but documented as
> > having to be connected to the same supply. I really see no point in
> > having multiple regulators for them.
> 
> The tiny amount of extra typing involved doesn't seem like much of a
> cost for keeping things consistent with every other regulator user out
> there.

I'm not concerned by that at all, but by the additional runtime complexity :-/

-- 
Regards,

Laurent Pinchart
