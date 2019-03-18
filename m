From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [linux-sunxi] [PATCH 1/6] drm/bridge: Export drm_bridge_detach
Date: Mon, 18 Mar 2019 17:57:42 +0100
Message-ID: <b3f7e096c94347b7a244d5278a38d9ced99218d1.camel@bootlin.com>
References: <20190315130825.9005-1-jagan@amarulasolutions.com>
         <20190315130825.9005-2-jagan@amarulasolutions.com>
         <c52be751ac1bc7b1ee21e3e2a30d5b494bf95faa.camel@bootlin.com>
         <CAMty3ZBOTOR4hHfPE4Ufhb2+VoNJfFQwiii1kti263fi7DEEaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMty3ZBOTOR4hHfPE4Ufhb2+VoNJfFQwiii1kti263fi7DEEaQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-amarula@amarulasolutions.com
List-Id: devicetree@vger.kernel.org

Hi,

Le lundi 18 mars 2019 à 22:18 +0530, Jagan Teki a écrit :
> Hi Paul,
> 
> On Fri, Mar 15, 2019 at 6:58 PM Paul Kocialkowski
> <paul.kocialkowski@bootlin.com> wrote:
> > Hi Jakan,
> > 
> > On Fri, 2019-03-15 at 18:38 +0530, Jagan Teki wrote:
> > > Export drm_bridge_detach from drm bridge core so-that it
> > > can use on respective interface or bridge driver while
> > > detaching the bridge.
> > 
> > I don't see why this change is required based on the commit log. The
> > DRM bridge code clearly indicates that drm_bridge_attach should *not*
> > be balanced with a drm_bridge_detach call in the driver, so this seems
> > quite wrong.
> > 
> > The DRM core itself should handle detaching the bridge, not the driver.
> > Is there any reason why you need to do things differently for DSI?
> 
> Yes, you are correct the detach of bridge is being taking care via
> drm_encoder_cleanup. This patch exported explicitly, since we need to
> taken care bridge detach during unbind even exynos_drm_dsi in other
> patch seems using detach by explicitly pointing.

I can see that from your patches, but you are not explaining why you
need the change. And if the framework doesn't work for your case, you
should certainly try and fix the framework instead of working around
the issue.

Anyway, you should probably look into using drm_panel_bridge_add, it
might fix the underlying issue on its own.

> so I think the better approach is to use drm_encoder_cleanup in
> unbind, what do you say?

I any case, you need to state what your problem is (in the commit log,
and not even in subsequent discussions) so that we can have a chance to
understand it and provide some feedback about what is an appropriate
fix and what is not. We can't understand the fix if we can't understand
the underlying issue.

Cheers,

Paul

-- 
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
