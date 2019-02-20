From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 4/4] drm/panel: Add OSD101T2587-53TS driver
Date: Wed, 20 Feb 2019 12:52:02 +0100
Message-ID: <20190220115202.GA18603@ravnborg.org>
References: <20190215140315.18046-1-peter.ujfalusi@ti.com>
 <20190215140315.18046-5-peter.ujfalusi@ti.com>
 <20190215180759.GA26944@ravnborg.org>
 <fefcd92c-4171-ed86-28d2-4145d409a73d@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fefcd92c-4171-ed86-28d2-4145d409a73d@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch, devicetree@vger.kernel.org, tomi.valkeinen@ti.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

Hi Peter.

On Wed, Feb 20, 2019 at 12:39:11PM +0200, Peter Ujfalusi wrote:
> Hi Sam,
> 
> On 15/02/2019 20.07, Sam Ravnborg wrote:
> >> +#include <linux/backlight.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/regulator/consumer.h>
> >> +
> >> +#include <drm/drmP.h>
> > Please do not use drmP.h in new drivers - we try to get rid of this file.
> 
> ...
> 
> >> +static int osd101t2587_panel_get_modes(struct drm_panel *panel)
> >> +{
> >> +	struct osd101t2587_panel *osd101t2587 = to_osd101t2587_panel(panel);
> >> +	struct drm_display_mode *mode;
> >> +
> >> +	mode = drm_mode_duplicate(panel->drm, osd101t2587->default_mode);
> >> +	if (!mode) {
> >> +		dev_err(panel->drm->dev, "failed to add mode %ux%ux@%u\n",
> 
> drm/drmP.h is needed for this dev_err.
drmP.h is only a set of include files and forwards today.
So you need to figure out what to replace it with.

Often removing drmP.h requires you to add more than one extra include file.

	Sam
