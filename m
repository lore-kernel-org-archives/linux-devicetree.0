From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH RE-RESEND 1/2] drm/panel: Add support for Armadeus ST0700
 Adapt
Date: Wed, 8 May 2019 11:06:12 +0200
Message-ID: <20190508090612.GT17751@phenom.ffwll.local>
References: <20190507152713.27494-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5B2nMsVNO6O_D+YTSjux=-DjNPGxhkEi3AQquOZVODumA@mail.gmail.com>
 <20190507161950.GA24879@ravnborg.org>
 <20190508083303.GR17751@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190508083303.GR17751@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Fabio Estevam <festevam@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, stable <stable@vger.kernel.org>, =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 08, 2019 at 10:33:03AM +0200, Daniel Vetter wrote:
> On Tue, May 07, 2019 at 06:19:50PM +0200, Sam Ravnborg wrote:
> > Hi Fabio
> > 
> > On Tue, May 07, 2019 at 12:33:39PM -0300, Fabio Estevam wrote:
> > > [Adding Sam, who is helping to review/collect panel-simple patches]
> > > 
> > > On Tue, May 7, 2019 at 12:27 PM Sébastien Szymanski
> > > <sebastien.szymanski@armadeus.com> wrote:
> > > >
> > > > This patch adds support for the Armadeus ST0700 Adapt. It comes with a
> > > > Santek ST0700I5Y-RBSLW 7.0" WVGA (800x480) TFT and an adapter board so
> > > > that it can be connected on the TFT header of Armadeus Dev boards.
> > > >
> > > > Cc: stable@vger.kernel.org # v4.19
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > If you wil lresend the patch I can apply it.
> > I have lost the original mail.
> 
> Usually patchwork should have it already (and you can pipe the raw
> patchwork mbox into dim apply), but somehow it's not there either.
> Not sure why, sometimes this is because mails are stuck in moderation,
> sometimes because people do interesting things with their mails (e.g. smtp
> servers mangling formatting).

patchwork was just a bit slow, it's there now:

https://patchwork.freedesktop.org/series/60408/

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
