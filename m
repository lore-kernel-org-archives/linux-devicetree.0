From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH 3/3] drm/bridge: Add NWL MIPI DSI host controller support
Date: Wed, 31 Jul 2019 16:38:44 +0200
Message-ID: <20190731143844.GC1935@bogon.m.sigxcpu.org>
References: <cover.1563983037.git.agx@sigxcpu.org>
 <3158f4f8c97c21f98c394e5631d74bc60d796522.1563983037.git.agx@sigxcpu.org>
 <CAOMZO5BRbV_1du1b9eJqcBvvXSE2Mon3yxSPJxPpZgBqYNjBSg@mail.gmail.com>
 <20190727020444.GC4902@pendragon.ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190727020444.GC4902@pendragon.ideasonboard.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Fabio Estevam <festevam@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, Lee Jones <lee.jones@linaro.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infrade>
List-Id: devicetree@vger.kernel.org

Hi,
On Sat, Jul 27, 2019 at 05:04:44AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> On Fri, Jul 26, 2019 at 05:01:52PM -0300, Fabio Estevam wrote:
> > Hi Guido,
> > 
> > Thanks for your work on this driver!
> > 
> > On Wed, Jul 24, 2019 at 12:52 PM Guido Günther <agx@sigxcpu.org> wrote:
> > 
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/bridge/imx-nwl/Kconfig
> > > @@ -0,0 +1,15 @@
> > > +config DRM_IMX_NWL_DSI
> > > +       tristate "Support for Northwest Logic MIPI DSI Host controller"
> > > +       depends on DRM && (ARCH_MXC || ARCH_MULTIPLATFORM || COMPILE_TEST)
> > 
> > This IP could potentially be found on other SoCs, so no need to make
> > it depend on ARCH_MXC.
> 
> I'd go even further and not use the prefix imx in the driver name or
> anywhere in the code.

My idea was to do that when another possible user comes up to see what
can be shared but I can do that for v2.
Cheers,
 -- Guido

> 
> [snip]
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
