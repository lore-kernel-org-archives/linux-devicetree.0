From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 3/3] DRM: Add KMS driver for the Ingenic JZ47xx SoCs
Date: Mon, 15 Apr 2019 18:09:17 +0200
Message-ID: <20190415160917.GF2665@phenom.ffwll.local>
References: <20190315170701.29670-1-paul@crapouillou.net>
 <20190315170701.29670-3-paul@crapouillou.net>
 <20190316215944.GB11309@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190316215944.GB11309@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 16, 2019 at 10:59:44PM +0100, Sam Ravnborg wrote:
> > +	ret = drm_fbdev_generic_setup(drm, 16);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to init fbdev\n");
> > +		goto err_devclk_disable;
> > +	}
> fbdev is usually considered an optionl feature that do not prevent
> the display driver from loading.
> Consider what to do in the error case.

Drive-through comment: Totally ok to require this, failing here usually
means you have a driver bug somewhere. fbdev is optional as in Kconfig
optional, but people who enable it generally need it.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
