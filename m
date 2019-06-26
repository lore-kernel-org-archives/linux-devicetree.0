From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v6 0/2] Add DSI panel driver for Raydium RM67191
Date: Wed, 26 Jun 2019 14:41:00 +0200
Message-ID: <20190626124100.GA7337@ravnborg.org>
References: <1561550907-9733-1-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561550907-9733-1-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 26, 2019 at 03:08:25PM +0300, Robert Chiras wrote:
> This patch-set contains the DRM panel driver and dt-bindings documentation
> for the DSI driven panel: Raydium RM67191.
> 
> v6:
> - Collected Reviewed-by from Fabio
> - Removed unused variables (sam)
> 
> v5:
> - Removed unnecessary debug messages (fabio)
> - Handled error case for gpio pin (fabio)
> 
> v4:
> - Changed default_timing structure type from 'struct display_timing' to
>   'struct drm_display_mode' (fabio)
> - Replaced devm_gpiod_get with devm_gpiod_get_optional (fabio)
> - Added power regulators (fabio)
> - Removed pm_ops (fabio)
> 
> v3:
> - Added myself to MAINTAINERS for this driver (sam)
> - Removed display-timings property (fabio)
> - Fixed dt description (sam)
> - Re-arranged calls inside get_modes function (sam)
> - Changed ifdefs with _maybe_unused for suspend/resume functions (sam)
> - Collected Reviewed-by from Sam
> 
> v2:
> - Fixed 'reset-gpio' to 'reset-gpios' property naming (fabio)
> - Changed the state of the reset gpio to active low and fixed how it is
>   handled in driver (fabio)
> - Fixed copyright statement (daniel)
> - Reordered includes (sam)
> - Added defines for panel specific color formats (fabio)
> - Removed unnecessary tests in enable and unprepare (sam)
> - Removed the unnecessary backlight write in enable (sam)
> *** SUBJECT HERE ***
> 
> *** BLURB HERE ***
> 
> Robert Chiras (2):
>   dt-bindings: display: panel: Add support for Raydium RM67191 panel
>   drm/panel: Add support for Raydium RM67191 panel driver

Thanks, patches are applied to drm-misc-next and pushed out.

	Sam
