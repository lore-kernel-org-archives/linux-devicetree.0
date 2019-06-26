From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 2/2] drm/panel: Add support for Raydium RM67191 panel
 driver
Date: Wed, 26 Jun 2019 13:33:06 +0200
Message-ID: <20190626113306.GA24921@ravnborg.org>
References: <1561544420-15572-1-git-send-email-robert.chiras@nxp.com>
 <1561544420-15572-3-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561544420-15572-3-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

Hi Robert.

On Wed, Jun 26, 2019 at 01:20:20PM +0300, Robert Chiras wrote:
> This patch adds Raydium RM67191 TFT LCD panel driver (MIPI-DSI
> protocol).

I was about to apply these - but I get following warnings during build:
  CC      drivers/gpu/drm/panel/panel-raydium-rm67191.o
/home/sam/drm/linux.git/drivers/gpu/drm/panel/panel-raydium-rm67191.c: In function ‘rad_bl_get_brightness’:
/home/sam/drm/linux.git/drivers/gpu/drm/panel/panel-raydium-rm67191.c:470:17: warning: unused variable ‘dev’ [-Wunused-variable]
  struct device *dev = &dsi->dev;
                 ^~~
/home/sam/drm/linux.git/drivers/gpu/drm/panel/panel-raydium-rm67191.c: In function ‘rad_bl_update_status’:
/home/sam/drm/linux.git/drivers/gpu/drm/panel/panel-raydium-rm67191.c:492:17: warning: unused variable ‘dev’ [-Wunused-variable]
  struct device *dev = &dsi->dev;
                 ^~~

Please fix and update your scripts to catch this in the future.

	Sam
