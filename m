From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [linux-sunxi] [PATCH 1/6] drm/bridge: Export drm_bridge_detach
Date: Mon, 18 Mar 2019 22:18:11 +0530
Message-ID: <CAMty3ZBOTOR4hHfPE4Ufhb2+VoNJfFQwiii1kti263fi7DEEaQ@mail.gmail.com>
References: <20190315130825.9005-1-jagan@amarulasolutions.com>
 <20190315130825.9005-2-jagan@amarulasolutions.com> <c52be751ac1bc7b1ee21e3e2a30d5b494bf95faa.camel@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c52be751ac1bc7b1ee21e3e2a30d5b494bf95faa.camel@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

Hi Paul,

On Fri, Mar 15, 2019 at 6:58 PM Paul Kocialkowski
<paul.kocialkowski@bootlin.com> wrote:
>
> Hi Jakan,
>
> On Fri, 2019-03-15 at 18:38 +0530, Jagan Teki wrote:
> > Export drm_bridge_detach from drm bridge core so-that it
> > can use on respective interface or bridge driver while
> > detaching the bridge.
>
> I don't see why this change is required based on the commit log. The
> DRM bridge code clearly indicates that drm_bridge_attach should *not*
> be balanced with a drm_bridge_detach call in the driver, so this seems
> quite wrong.
>
> The DRM core itself should handle detaching the bridge, not the driver.
> Is there any reason why you need to do things differently for DSI?

Yes, you are correct the detach of bridge is being taking care via
drm_encoder_cleanup. This patch exported explicitly, since we need to
taken care bridge detach during unbind even exynos_drm_dsi in other
patch seems using detach by explicitly pointing. so I think the better
approach is to use drm_encoder_cleanup in unbind, what do you say?

Jagan.
