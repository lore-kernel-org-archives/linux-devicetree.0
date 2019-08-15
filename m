From: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH RFC 06/11] drm/bridge: analogix-anx78xx: add support for
 avdd33 regulator
Date: Thu, 15 Aug 2019 18:51:04 -0400
Message-ID: <20190815225104.GB32072@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-7-masneyb@onstation.org>
 <CACRpkdYdQa+FVfpSjLi0SsBMDT4QC667z1P1dnapz7PXgRoB5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYdQa+FVfpSjLi0SsBMDT4QC667z1P1dnapz7PXgRoB5Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>M
List-Id: devicetree@vger.kernel.org

On Thu, Aug 15, 2019 at 10:22:45AM +0200, Linus Walleij wrote:
> On Thu, Aug 15, 2019 at 2:49 AM Brian Masney <masneyb@onstation.org> wrote:
> 
> > Add support for the avdd33 regulator to the analogix-anx78xx driver.
> > Note that the regulator is currently enabled during driver probe and
> > disabled when the driver is removed. This is currently how the
> > downstream MSM kernel sources do this.
> >
> > Let's not merge this upstream for the mean time until I get the external
> > display fully working on the Nexus 5 and then I can submit proper
> > support then that powers down this regulator in the power off function.
> >
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> 
> > +static void anx78xx_disable_regulator_action(void *_data)
> > +{
> > +       struct anx78xx_platform_data *pdata = _data;
> > +
> > +       regulator_disable(pdata->avdd33);
> > +}
> (...)
> > +       err = devm_add_action(dev, anx78xx_disable_regulator_action,
> > +                             pdata);
> 
> Clever idea. Good for initial support, probably later on it would
> need to be reworked using runtime PM so it's not constantly
> powered up.

Yes, that's my plan. I suspect that I may have a regulator disabled
somewhere so I was planning to leave this on all the time for the time
being to match the downstream behavior until I get the hot plug detect
GPIO working.

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks,

Brian
