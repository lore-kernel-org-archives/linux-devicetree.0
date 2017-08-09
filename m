From: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Subject: Re: [PATCH v2 3/3] rc: add zx-irdec remote control driver
Date: Wed, 9 Aug 2017 14:00:29 +0100
Message-ID: <20170809130029.eneyqstlejfkotz2@gofer.mess.org>
References: <1501420993-21977-1-git-send-email-shawnguo@kernel.org>
 <1501420993-21977-4-git-send-email-shawnguo@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501420993-21977-4-git-send-email-shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Baoyou Xie <xie.baoyou-i+zz7BTLltu8dxfXipz/DA@public.gmane.org>, Xin Zhou <zhou.xin8-i+zz7BTLltu8dxfXipz/DA@public.gmane.org>, Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jul 30, 2017 at 09:23:13PM +0800, Shawn Guo wrote:
> From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> It adds the remote control driver and corresponding keymap file for
> IRDEC block found on ZTE ZX family SoCs.
> 
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/media/rc/Kconfig               |  11 ++
>  drivers/media/rc/Makefile              |   1 +
>  drivers/media/rc/keymaps/Makefile      |   3 +-
>  drivers/media/rc/keymaps/rc-zx-irdec.c |  79 ++++++++++++++
>  drivers/media/rc/zx-irdec.c            | 183 +++++++++++++++++++++++++++++++++
>  include/media/rc-map.h                 |   1 +
>  6 files changed, 277 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/media/rc/keymaps/rc-zx-irdec.c
>  create mode 100644 drivers/media/rc/zx-irdec.c

We're missing an MAINTAINERS entry for this driver. Could this be added
please as a separate patch?

Thanks
Sean
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
