From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCHv6 3/3] ARM:drm ivip Intel FPGA Video and Image Processing
 Suite
Date: Fri, 11 Aug 2017 08:21:17 -0700
Message-ID: <b3505a39-9fa9-c993-15cb-d643a34f58a9@infradead.org>
References: <1502434187-6407-1-git-send-email-hean.loong.ong@intel.com>
 <1502434187-6407-4-git-send-email-hean.loong.ong@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502434187-6407-4-git-send-email-hean.loong.ong@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Hean-Loong, Ong" <hean.loong.ong@intel.com>, Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
List-Id: devicetree@vger.kernel.org

On 08/10/2017 11:49 PM, Hean-Loong, Ong wrote:
> diff --git a/drivers/gpu/drm/ivip/Kconfig b/drivers/gpu/drm/ivip/Kconfig
> new file mode 100644
> index 0000000..398c9ab
> --- /dev/null
> +++ b/drivers/gpu/drm/ivip/Kconfig
> @@ -0,0 +1,14 @@
> +config DRM_IVIP
> +        tristate "Intel FGPA Video and Image Processing"
> +        depends on DRM && OF
> +        select DRM_GEM_CMA_HELPER
> +        select DRM_KMS_HELPER
> +        select DRM_KMS_FB_HELPER
> +        select DRM_KMS_CMA_HELPER
> +        help
> +            Choose this option if you have a Intel FPGA Arria 10 system

                                              an

> +            and above with an Intel Display Port IP. This does not support
> +            legacy Intel FPGA Cyclone V display port. Currently only single
> +            frame buffer is supported. Note that ACPI and X_86 architecture
> +            is not supported for Arria10.If M is selected the module will be

                                    Arria10. If M is

> +            called ivip.

All of the help text should be indented with one tab + 2 spaces
according to coding-style.rst.


-- 
~Randy
