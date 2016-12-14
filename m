From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 00/26] drm/omap: Convert to use videomode from omap_video_timings
Date: Wed, 14 Dec 2016 23:32:58 +0200
Message-ID: <3115831.KSyLVyBdAU@avalon>
References: <20160901112320.15246-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160901112320.15246-1-peter.ujfalusi@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, thierry.reding@gmail.com, airlied@linux.ie, tomi.valkeinen@ti.com, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

On Thursday 01 Sep 2016 14:22:54 Peter Ujfalusi wrote:
> Hi,
> 
> The following series will convert the omapdrm stack to use the generic
> videmode instead of the private omap_video_timings struct for the panel
> information.
> 
> Since we have several panels under omapdrm/displays/ where the data drive
> edge is set to be different then the sync drive edge, the first three patch
> will add support to select the sync drive edge via DT.
> I was not able to locate the datasheet for all the panels and because the
> different edge was used in omapdrm and omapfb for a long time without
> complains from users - and they were written this way - I think it is a
> valid that we can have panels requiring different edge for data and sync to
> be driven.

That's very peculiar. Have you been able to locate at least one panel 
datasheet that documents this requirement ?

> The rest of the patches are most mechanical ones. I have decided to split it
> up to small chunks and did one change at the time to finally remove the
> omap_video_timings from omapdrm.
> 
> 
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: devicetree@vger.kernel.org
> 
> Regards,
> Peter
> ---
> Peter Ujfalusi (26):
>   dt-bindings: display: display-timing: Add property to configure sync
>     drive edge
>   video: display_timing: Add flags to select the edge when the sync is
>     driven
>   video: of: display_timing: Add support for syncclk-active property
>   drm/omap: omap_display_timings: rename x_res to hactive
>   drm/omap: omap_display_timings: rename y_res to vactive
>   drm/omap: omap_display_timings: rename hsw to hsync_len
>   drm/omap: omap_display_timings: rename hfp to hfront_porch
>   drm/omap: omap_display_timings: rename hbp to hback_porch
>   drm/omap: omap_display_timings: rename vsw to vsync_len
>   drm/omap: omap_display_timings: rename vfp to vfront_porch
>   drm/omap: omap_display_timings: rename vbp to vback_porch
>   drm/omap: HDMI5: Use pointer to cfg->v_fc_config.timings in
>     hdmi_core_video_config
>   drm/omap: omap_display_timings: Use display_flags for interlace mode
>   drm/omap: dispc: Simplify _dispc_mgr_set_lcd_timings() parameters
>   drm/omap: omap_display_timings: Use display_flags for h/vsync level
>   drm/omap: omap_display_timings: Use display_flags for DE level
>   drm/omap: omap_display_timings: Use display_flags for double_pixel
>     mode
>   drm/omap: omap_display_timings: Use display_flags for pixel data edge
>   drm/omap: omap_display_timings: Use display_flags for sync edge
>   drm/omap: Change the types of struct omap_video_timings members
>   drm/omap: Replace struct omap_video_timings with videomode
>   drm/omap: Use consistent name for struct videomode
>   drm/omap: panel-tpo-td043mtea1: Add note for incorrect sync drive edge
>   drm/omap: panel-tpo-td028ttec1: Add note for incorrect sync drive edge
>   drm/omap: panel-sharp-ls037v7dw01: Add note for incorrect data drive
>     edge
>   drm/omap: panel-lgphilips-lb035q02: Add note for incorrect data drive
>     edge and DE level
> 
>  .../bindings/display/panel/display-timing.txt      |   6 +
>  .../gpu/drm/omapdrm/displays/connector-analog-tv.c |  47 ++---
>  drivers/gpu/drm/omapdrm/displays/connector-dvi.c   |  50 +++--
>  drivers/gpu/drm/omapdrm/displays/connector-hdmi.c  |  49 +++--
>  drivers/gpu/drm/omapdrm/displays/encoder-opa362.c  |  20 +-
>  drivers/gpu/drm/omapdrm/displays/encoder-tfp410.c  |  31 ++-
>  .../gpu/drm/omapdrm/displays/encoder-tpd12s015.c   |  20 +-
>  drivers/gpu/drm/omapdrm/displays/panel-dpi.c       |  30 ++-
>  drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c    |  25 ++-
>  .../omapdrm/displays/panel-lgphilips-lb035q02.c    |  59 +++---
>  .../drm/omapdrm/displays/panel-nec-nl8048hl11.c    |  52 +++--
>  .../drm/omapdrm/displays/panel-sharp-ls037v7dw01.c |  58 +++---
>  .../drm/omapdrm/displays/panel-sony-acx565akm.c    |  53 +++--
>  .../drm/omapdrm/displays/panel-tpo-td028ttec1.c    |  57 +++---
>  .../drm/omapdrm/displays/panel-tpo-td043mtea1.c    |  54 ++---
>  drivers/gpu/drm/omapdrm/dss/dispc.c                | 222 ++++++++----------
>  drivers/gpu/drm/omapdrm/dss/display.c              |  78 +-------
>  drivers/gpu/drm/omapdrm/dss/dpi.c                  |  40 ++--
>  drivers/gpu/drm/omapdrm/dss/dsi.c                  | 156 ++++++++-------
>  drivers/gpu/drm/omapdrm/dss/dss.h                  |   5 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi.h                 |   8 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c                |  31 +--
>  drivers/gpu/drm/omapdrm/dss/hdmi4_core.c           |   8 +-
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c                |  31 +--
>  drivers/gpu/drm/omapdrm/dss/hdmi5_core.c           |  85 ++++----
>  drivers/gpu/drm/omapdrm/dss/hdmi_wp.c              |  73 ++++---
>  drivers/gpu/drm/omapdrm/dss/omapdss.h              |  98 +++------
>  drivers/gpu/drm/omapdrm/dss/output.c               |   5 +-
>  drivers/gpu/drm/omapdrm/dss/rfbi.c                 |  49 +++--
>  drivers/gpu/drm/omapdrm/dss/sdi.c                  |  33 ++-
>  drivers/gpu/drm/omapdrm/dss/venc.c                 |  97 +++++----
>  drivers/gpu/drm/omapdrm/omap_connector.c           |  87 +-------
>  drivers/gpu/drm/omapdrm/omap_crtc.c                |  17 +-
>  drivers/gpu/drm/omapdrm/omap_drv.h                 |   7 +-
>  drivers/gpu/drm/omapdrm/omap_encoder.c             |  10 +-
>  drivers/video/of_display_timing.c                  |   9 +
>  include/video/display_timing.h                     |   4 +
>  37 files changed, 778 insertions(+), 986 deletions(-)

-- 
Regards,

Laurent Pinchart
