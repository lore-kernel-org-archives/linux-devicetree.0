From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCHv5 3/3] ARM:drm ivip Intel FPGA Video and Image Processing
 Suite
Date: Thu, 3 Aug 2017 09:35:28 -0700
Message-ID: <b1c48939-c40f-5af9-03c0-e7317ab5a522@infradead.org>
References: <1501736496-4118-1-git-send-email-hean.loong.ong@intel.com>
 <1501736496-4118-4-git-send-email-hean.loong.ong@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501736496-4118-4-git-send-email-hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Hean Loong, Ong" <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dinh Nguyen <dinguyen-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/02/2017 10:01 PM, Hean Loong, Ong wrote:
> From: Ong Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> 

Really needs a short commit description.

> Signed-off-by: Ong Hean Loong <hean.loong.ong-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> ---
> V5:
> *Fix Comments
> 
> V4:
> *Fix Comments
> 
> V3:
> *Changes to fixing drm_simple_pipe
> *Used drm_fb_cma_get_gem_addr
> 
> V2:
> *Adding drm_simple_display_pipe_init
> 
> ---
> 
> diff --git a/drivers/gpu/drm/ivip/Kconfig b/drivers/gpu/drm/ivip/Kconfig
> new file mode 100644
> index 0000000..9a8c5ce
> --- /dev/null
> +++ b/drivers/gpu/drm/ivip/Kconfig
> @@ -0,0 +1,13 @@
> +config DRM_IVIP
> +        tristate "Intel FGPA Video and Image Processing"
> +        depends on DRM && OF
> +        select DRM_GEM_CMA_HELPER
> +        select DRM_KMS_HELPER
> +        select DRM_KMS_FB_HELPER
> +        select DRM_KMS_CMA_HELPER
> +        help
> +            Choose this option if you have a Intel FPGA Arria 10 system

	                                      an Intel

> +            and above with a Display Port IP. This does not support legacy
> +            Intel FPGA Cyclone V display port. Currently only single frame
> +            buffer is supported. Note that ACPI and X_86 architecture is yet
	                                               ????
> +            to be supported.If M is selected the module would be called ivip.

	             supoorted. If M                       will


> diff --git a/drivers/gpu/drm/ivip/Makefile b/drivers/gpu/drm/ivip/Makefile
> new file mode 100644
> index 0000000..95291c6
> --- /dev/null
> +++ b/drivers/gpu/drm/ivip/Makefile
> @@ -0,0 +1,9 @@
> +#
> +# Makefile for the drm device driver.  This driver provides support for the
> +# Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
> +
> +ccflags-y := -Iinclude/drm
> +
> +obj-$(CONFIG_DRM_IVIP) += ivip.o
> +ivip-objs := intel_vip_of.o intel_vip_core.o \
> +intel_vip_conn.o

Please indent continuation lines in Makefiles.


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
