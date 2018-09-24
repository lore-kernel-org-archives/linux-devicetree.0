From: Damian Kos <dkos-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH v4 5/5] drm: bridge: add support for Cadence MHDP DPI/DP
 bridge
Date: Mon, 24 Sep 2018 11:40:03 +0000
Message-ID: <CO2PR07MB2551EC0A7DEB61C54A4D6A5FCD170@CO2PR07MB2551.namprd07.prod.outlook.com>
References: <1537455288-20223-1-git-send-email-dkos@cadence.com>
 <1537455288-20223-6-git-send-email-dkos@cadence.com>
 <1903708.pJTgKoWLiI@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1903708.pJTgKoWLiI@phil>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Scott Telford <stelford-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Przemyslaw Gaj <pgaj-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org" <quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Artur Jedrysek <jartur-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Lukasz Tyrala <ltyrala-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Piotr Sroka <piotrs-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "jbergsagel-l0cyMroinI0@public.gmane.org" <jbergsagel-l0cyMroinI0@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean
List-Id: devicetree@vger.kernel.org

Hi Heiko,

> Hi Damian,
> 
> Am Donnerstag, 20. September 2018, 16:54:40 CEST schrieb Damian Kos:
> > From: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > 
> > This adds basic support for Cadence MHDP DPI to DP bridge.
> > 
> > Basically, it takes a DPI stream as input and output it encoded in DP 
> > format. It's missing proper HPD, HDCP and currently supports only SST 
> > mode.
> > 
> > Changes made in the low level driver (cdn-dp-reg.*):
> > - moved it to from drivers/gpu/drm/rockchip to
> >   drivers/gpu/drm/bridge/cdns-mhdp-common.*
> > - functions for sending/receiving commands are now public
> > - added functions for reading registers and link training
> >   adjustment
> > 
> > Changes made in RK's driver (cdn-dp-core.*):
> > - Moved audio_info and audio_pdev fields from cdn_dp_device to
> >   cdns_mhdp_device structure.
> > 
> > Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > Signed-off-by: Damian Kos <dkos-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/rockchip/Kconfig 
> > b/drivers/gpu/drm/rockchip/Kconfig
> > index 0ccc76217ee4..129b0529f3e1 100644
> > --- a/drivers/gpu/drm/rockchip/Kconfig
> > +++ b/drivers/gpu/drm/rockchip/Kconfig
> > @@ -27,7 +27,9 @@ config ROCKCHIP_ANALOGIX_DP
> >  
> >  config ROCKCHIP_CDN_DP
> >          bool "Rockchip cdn DP"
> > -	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
> > +	depends on DRM_ROCKCHIP=m
> 
> Sorry, I wasn't fast enough in my reply to you mail to catch that before your v4, but I don't think this is necessary.
> Instead I do guess, the select below should do the right thing by making EXTCON=y if DRM_ROCKCHIP=y.
> 
> Somewhat clumsily verified by making EXTCON=m in my defconfig and seeing get changed to y upon build, which I guess comes from a different "select" in the config.
> 

I've changed it to:

config ROCKCHIP_CDN_DP
        bool "Rockchip cdn DP"
        depends on DRM_ROCKCHIP
        select EXTCON if DRM_ROCKCHIP=y
        select DRM_CDNS_MHDP
        help...

and it seems that there are no issues. At least for me.

Please let me know if that's OK.

> 
> > +	select EXTCON
> > +	select DRM_CDNS_MHDP
> >          help
> >  	  This selects support for Rockchip SoC specific extensions
> >  	  for the cdn DP driver. If you want to enable Dp on diff --git 
> > a/drivers/gpu/drm/rockchip/Makefile 
> > b/drivers/gpu/drm/rockchip/Makefile
> > index a314e2109e76..16ba61ffca39 100644
> > --- a/drivers/gpu/drm/rockchip/Makefile
> > +++ b/drivers/gpu/drm/rockchip/Makefile
> > @@ -3,13 +3,15 @@
> >  # Makefile for the drm device driver.  This driver provides support 
> > for the  # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
> >  
> > +ccflags-y += -I$(src)/../bridge
> 
> hmm, instead of adding an include path, the shared header should probably just live in /include/drm/bridge/... in the kernel source?
> 

I'll move the common header to include/drm/bridge/ in v5.

> 
> Heiko

--
Damian
