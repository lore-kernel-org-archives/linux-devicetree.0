From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH 3/3] drm/bridge: Add NWL MIPI DSI host controller support
Date: Wed, 31 Jul 2019 18:40:03 +0200
Message-ID: <13373313.BzCyiC4ED7@jernej-laptop>
References: <cover.1563983037.git.agx@sigxcpu.org> <20190731143532.GA1935@bogon.m.sigxcpu.org> <CAOMZO5Djoi7EuXapkg+dQ6HR2oZZHrw+vnjc837Gxee-Nh00Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5Djoi7EuXapkg+dQ6HR2oZZHrw+vnjc837Gxee-Nh00Hw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Lee Jones <lee.jones@linaro.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <li>
List-Id: devicetree@vger.kernel.org

Hi!

Dne sreda, 31. julij 2019 ob 16:43:47 CEST je Fabio Estevam napisal(a):
> Hi Guido,
> 
> On Wed, Jul 31, 2019 at 11:35 AM Guido Günther <agx@sigxcpu.org> wrote:
> > The idea is to have
> > 
> >     "%sabling platform clocks", enable ? "en" : "dis");
> > 
> > depending whether clocks are enabled/disabled.
> 
> Yes, I understood the idea, but this would print:
> 
> ensabling or dissabling :-)

No, it wouldn't. That extra "s" is part of "%s", e.g. part of format specifier.

Best regards,
Jernej

> 
> > > Same here. Please return 'int' instead.
> > 
> > This is from drm_bridge_funcs so the prototype is fixed. I'm not sure
> > how what's the best way to bubble up fatal errors through the drm layer?
> 
> Ok, so let's not change this one.
> 
> > I went for DRM_DEV_ERROR() since that what i used in the rest of the
> > driver and these ones were omission. Hope that's o.k.
> 
> No strong preferences here. I just think dev_err() easier to type and
> shorter.
> 
> Thanks for this work!
