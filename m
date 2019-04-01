From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH RESEND v7 1/3] dt-bindings: Add vendor prefix for Mixel
 Inc
Date: Mon, 1 Apr 2019 12:24:21 +0200
Message-ID: <20190401102421.GB23517@bogon.m.sigxcpu.org>
References: <cover.1553674604.git.agx@sigxcpu.org>
 <e31ffb1d6929e4c961ec90bcdb1ff5e9ecb3380e.1553674604.git.agx@sigxcpu.org>
 <16e92716-17dd-abb5-87dc-601414f22d20@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <16e92716-17dd-abb5-87dc-601414f22d20@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiko Stuebner <heiko@sntech.de>, Johan Hovold <johan@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, Li Jun <jun.li@nxp.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnbo>
List-Id: devicetree@vger.kernel.org

Hi Andreas,
On Thu, Mar 28, 2019 at 06:04:49PM +0100, Andreas Färber wrote:
> Am 27.03.19 um 09:19 schrieb Guido Günther:
> > Add vendor prefix "mixel" for Mixel Inc. Will be used for a MIPI DSI
> > PHY driver.
> 
> Nit: s/driver/binding/ (to not be Linux specific)
> 
> > 
> > Signed-off-by: Guido Günther <agx@sigxcpu.org>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index 413c6f30ce88..97370889039f 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -249,6 +249,7 @@ mikroe		MikroElektronika d.o.o.
> >  minix	MINIX Technology Ltd.
> >  miramems	MiraMEMS Sensing Technology Co., Ltd.
> >  mitsubishi	Mitsubishi Electric Corporation
> > +mixel	Mixel, Inc.
> >  mosaixtech	Mosaix Technologies, Inc.
> >  motorola	Motorola, Inc.
> >  moxa	Moxa Inc.
> 
> Reviewed-by: Andreas Färber <afaerber@suse.de>
> 
> in case you still need it for something else in light of Rob's comment.

You're righgt, using the fsl, prefix this got obsolete but thanks for
having a look!
 -- Guido
