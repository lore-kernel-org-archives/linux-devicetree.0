From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCHv16 3/3] ARM:drm ivip Intel FPGA Video and Image Processing
 Suite
Date: Fri, 7 Jun 2019 21:50:01 -0700
Message-ID: <bc42cad0-8c03-4e22-4475-c25f2e824944@infradead.org>
References: <20190607143022.427-1-hean.loong.ong@intel.com>
 <20190607143022.427-4-hean.loong.ong@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190607143022.427-4-hean.loong.ong@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Hean-Loong, Ong" <hean.loong.ong@intel.com>, Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, chin.liang.see@intel.com, Ong@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 6/7/19 7:30 AM, Hean-Loong, Ong wrote:
> diff --git a/drivers/gpu/drm/ivip/Kconfig b/drivers/gpu/drm/ivip/Kconfig
> new file mode 100644
> index 000000000000..1b2af85fe757
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
> +		Choose this option if you have an Intel FPGA Arria 10 system
> +		and above with an Intel Display Port IP. This does not support
> +		legacy Intel FPGA Cyclone V display port. Currently only single
> +		frame buffer is supported. Note that ACPI and X_86 architecture
> +		is not supported for Arria10. If M is selected the module will be
> +		called ivip.

According to Documentation/process/coding-style.rst, Kconfig help text should be
indented with 1 tab + 2 spaces, not 2 tabs.

-- 
~Randy
