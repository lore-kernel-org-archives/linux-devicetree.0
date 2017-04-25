From: Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCHv2 2/3] ARM: drm: Intel FPGA VIP Frame Buffer II drm driver
Date: Tue, 25 Apr 2017 10:17:08 +0300
Message-ID: <874lxdt0qz.fsf@intel.com>
References: <1493086006-4392-1-git-send-email-hean.loong.ong@intel.com> <1493086006-4392-3-git-send-email-hean.loong.ong@intel.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493086006-4392-3-git-send-email-hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tien.hock.loh-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Ong-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 25 Apr 2017, hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org wrote:
> +++ b/drivers/gpu/drm/ivip/Makefile
> @@ -0,0 +1,9 @@
> +#
> +# Makefile for the drm device driver.  This driver provides support for the
> +# Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
> +
> +ccflags-y := -Iinclude/drm

Just a drive-by observation, there are patches on the list removing such
ccflags from existing drivers. You shouldn't need this. Just make sure
all your #includes begin with <drm/.

BR,
Jani.

> +
> +obj-$(CONFIG_DRM_IVIP) += ivip.o
> +ivip-objs := intel_vip_of.o intel_vip_core.o \
> +intel_vip_conn.o
-- 
Jani Nikula, Intel Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
