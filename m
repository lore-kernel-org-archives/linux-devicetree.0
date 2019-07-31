From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: Add NWL MIPI DSI host controller support
Date: Wed, 31 Jul 2019 14:40:57 -0300
Message-ID: <CAOMZO5Ak7QFzEM8Qt5XAZBa1CB602fygK+FBDK2iTvxWA4y+oA@mail.gmail.com>
References: <cover.1563983037.git.agx@sigxcpu.org> <20190731143532.GA1935@bogon.m.sigxcpu.org>
 <CAOMZO5Djoi7EuXapkg+dQ6HR2oZZHrw+vnjc837Gxee-Nh00Hw@mail.gmail.com> <13373313.BzCyiC4ED7@jernej-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <13373313.BzCyiC4ED7@jernej-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Lee Jones <lee.jones@linaro.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linu>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 31, 2019 at 1:40 PM Jernej =C5=A0krabec <jernej.skrabec@siol.ne=
t> wrote:

> > Yes, I understood the idea, but this would print:
> >
> > ensabling or dissabling :-)
>
> No, it wouldn't. That extra "s" is part of "%s", e.g. part of format spec=
ifier.

Ops, you are right. Sorry about that!
