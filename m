From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
Subject: Re: [PATCH 4/9] drm/panel: simple: add support for overriding the
 pixel clock polarity
Date: Wed, 25 Oct 2017 11:56:05 +0200
Message-ID: <20171025115605.06851901@karo-electronics.de>
References: <1507721021-28174-1-git-send-email-LW@KARO-electronics.de>
        <1507721021-28174-5-git-send-email-LW@KARO-electronics.de>
        <20171017121422.GE684@ulmo>
        <20171017142507.127f1711@karo-electronics.de>
        <20171017124504.GC27983@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171017124504.GC27983@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, 17 Oct 2017 14:45:04 +0200 Thierry Reding wrote:
> On Tue, Oct 17, 2017 at 02:25:07PM +0200, Lothar Waßmann wrote:
> > Hi,
> > 
> > On Tue, 17 Oct 2017 14:14:22 +0200 Thierry Reding wrote:
> > > On Wed, Oct 11, 2017 at 01:23:36PM +0200, Lothar Waßmann wrote:
> > > > The Ka-Ro electronics MB7 baseboard has an on-board LCD->LVDS
> > > > converter that requires a fixed pixelclk polarity, no matter what the
> > > > panel's display_mode specifies. Add an option to override the pixelclk
> > > > polarity defined in the panel's display_mode via DTB.
> > > 
> > > I'd argue that the LCD->LVDS converter should be modelled specifically
> > > in DT to handle this case. It could be a implemented as a DRM bridge
> > > driver, for example.
> > > 
> > IMO that's just overkill for a simple chip that is in no way
> > configurable nor detectable by software.
> 
> I suspect that you're not the only one who runs a board that has this
> kind of quirk. If we solve this in a generic way we can point people in
> that direction when they come asking for such a quirk.
> 
> So this could be something very simple that's instantiated using maybe a
> couple of lines of code.
> 
I found the drivers/gpu/drm/bridge/lvds-encoder.c driver which on first
glance is more or less what I would need. But the driver is currently
dysfunctional due to:
|commit 13dfc0540a575b47b2d640b093ac16e9e09474f6
|Author: Eric Anholt <eric@anholt.net>
|Date:   Fri Jun 2 13:25:14 2017 -0700
|
|    drm/bridge: Refactor out the panel wrapper from the lvds-encoder bridge.

Also there is no in-kernel user of this driver, so that it obviously
doesn't get tested in any way.
There is only one dts file (r8a7779-marzen.dts) that instantiate this
driver, but it has an incomplete OF graph. The missing link for the
OF graph is provided by either r8a77xx-aa104xd12-panel.dtsi or
r8a77xx-aa121td01-panel.dtsi, but those files are referenced nowhere in
the kernel source.

Reverting the part of the above mentioned patch that touches
lvds-encoder.c makes the driver functional, but I see no way to use
this driver to enforce specific bus_flags for the interface, since the
code is run prior to the simple-panel's initialization, which would
override whatever settings might have been provided by the lvds-encoder
driver.

Can someone enligthen me, how to enforce specific bus_flags/bus_format
settings for an LCD interface driven by the simple-panel driver apart
from doing it in the simple-panel driver itself?


Lothar Waßmann
