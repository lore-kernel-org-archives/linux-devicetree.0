From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH 13/20] drm/bridge: Add RGB to VGA bridge support
Date: Thu, 26 May 2016 10:16:59 +0100
Message-ID: <20160526091659.GG19428@n2100.arm.linux.org.uk>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-14-git-send-email-maxime.ripard@free-electrons.com>
 <1773896.kpi58ilqqm@avalon>
 <20160526085330.GM9232@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160526085330.GM9232@lukather>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, May 26, 2016 at 10:53:30AM +0200, Maxime Ripard wrote:
> Hi Laurent,
> 
> On Mon, May 16, 2016 at 04:24:15PM +0300, Laurent Pinchart wrote:
> > Hi Maxime,
> > 
> > Thank you for the patch.
> > 
> > On Monday 16 May 2016 14:47:13 Maxime Ripard wrote:
> > > +fallback:
> > > +	/*
> > > +	 * In case we cannot retrieve the EDIDs (broken or missing i2c
> > > +	 * bus), fallback on the XGA standards
> > > +	 */
> > > +	ret = drm_add_modes_noedid(connector, 1920, 1200);
> > 
> > The DRM core adds modes up to 1024x768 in 
> > drm_helper_probe_single_connector_modes(). I wonder if it really makes sense 
> > to override that in drivers, compared to increasing the maximum resolution in 
> > the core. What we can reasonable expect from a VGA monitor doesn't really 
> > depend on which display engine it is connected to.
> 
> Actually, I would expect it to come from the connectors. Nowadays, the
> core add modes that might not even be relevant at all for a given
> connector. Take TV as an example, there's not a single TV output that
> can reach 1024x768, but actually rely on very different resolutions.

There is the requirement to support 640x480 almost universally.

> > Would it make sense to add an optional GPIO-based connection detection to this 
> > driver ?
> 
> I asked for it in our prototypes, and apparently, doing VGA cable
> detection is really non-trivial, so I don't really expect it to be
> found in a lot of designs.

... and prone to problems.  Intel designs try to measure the termination
resistance to detect whether something is connected (they pulse the RGB
signals and measure the current.)  This mostly works fine, except if you
have some KVM boxes which can make this very unreliable.

I ended up replacing the bipolar transistors switching the RGB signals
in my KVM switch with FETs because of this problem.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
