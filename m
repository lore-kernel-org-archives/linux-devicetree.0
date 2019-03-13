From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCHv14 3/3] ARM:drm ivip Intel FPGA Video and Image Processing
 Suite
Date: Wed, 13 Mar 2019 13:35:53 -0700
Message-ID: <fe101dca-2b39-fe0e-9bee-279abab9db8a@infradead.org>
References: <20190313202206.921-1-hean.loong.ong@intel.com>
 <20190313202206.921-4-hean.loong.ong@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190313202206.921-4-hean.loong.ong@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Hean-Loong, Ong" <hean.loong.ong@intel.com>, Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, chin.liang.see@intel.com, Ong@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 3/13/19 1:22 PM, Hean-Loong, Ong wrote:
> diff --git a/drivers/gpu/drm/ivip/Kconfig b/drivers/gpu/drm/ivip/Kconfig
> new file mode 100644
> index 0000000..1d08b90
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
> +		  Choose this option if you have an Intel FPGA Arria 10 system
> +		  and above with an Intel Display Port IP. This does not support
> +		  legacy Intel FPGA Cyclone V display port. Currently only single
> +		  frame buffer is supported. Note that ACPI and X_86 architecture
> +		  is not supported for Arria10. If M is selected the module will be
> +		  called ivip.

Hi,
If you make any changes to this series, the help text here is
indented too much.  Just use one tab + 2 spaces, not 2 tabs + 2 spaces.

thanks.
-- 
~Randy
