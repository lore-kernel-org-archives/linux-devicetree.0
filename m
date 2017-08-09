From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] rc: add zx-irdec remote control driver
Date: Wed, 9 Aug 2017 21:48:18 +0800
Message-ID: <20170809134816.GA31819@dragon>
References: <1501420993-21977-1-git-send-email-shawnguo@kernel.org>
 <1501420993-21977-4-git-send-email-shawnguo@kernel.org>
 <20170809130029.eneyqstlejfkotz2@gofer.mess.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170809130029.eneyqstlejfkotz2-3XSxi2G4b3iXFJAUJl40Xg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baoyou Xie <xie.baoyou-i+zz7BTLltu8dxfXipz/DA@public.gmane.org>, Xin Zhou <zhou.xin8-i+zz7BTLltu8dxfXipz/DA@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sean,

On Wed, Aug 09, 2017 at 02:00:29PM +0100, Sean Young wrote:
> On Sun, Jul 30, 2017 at 09:23:13PM +0800, Shawn Guo wrote:
> > From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > 
> > It adds the remote control driver and corresponding keymap file for
> > IRDEC block found on ZTE ZX family SoCs.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/media/rc/Kconfig               |  11 ++
> >  drivers/media/rc/Makefile              |   1 +
> >  drivers/media/rc/keymaps/Makefile      |   3 +-
> >  drivers/media/rc/keymaps/rc-zx-irdec.c |  79 ++++++++++++++
> >  drivers/media/rc/zx-irdec.c            | 183 +++++++++++++++++++++++++++++++++
> >  include/media/rc-map.h                 |   1 +
> >  6 files changed, 277 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/media/rc/keymaps/rc-zx-irdec.c
> >  create mode 100644 drivers/media/rc/zx-irdec.c
> 
> We're missing an MAINTAINERS entry for this driver. Could this be added
> please as a separate patch?

We are using 'ARM/ZTE ARCHITECTURE' entry in MAINTAINERS for ZTE ZX
drivers.  I plan to send a separate patch going through arm-soc tree,
updating MAINTAINERS for those new ZTE ZX drivers landed on mainline
during 4.14 merge window.  IRDEC will be covered by that patch.  Is that
okay?

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
