From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v10 1/3] backlight arcxcnn add arc to vendor prefix
Date: Fri, 5 May 2017 08:54:52 +0100
Message-ID: <20170505075452.4wxlruv4bk6zuxvj@dell>
References: <1493823859-22402-1-git-send-email-olimpiu@arcticsand.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1493823859-22402-1-git-send-email-olimpiu@arcticsand.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olimpiu Dejeu <olimpiu@arcticsand.com>
Cc: robh@kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, jingoohan1@gmail.com, bdodge@arcticsand.com, joe@perches.com, daniel.thompson@linaro.org, lkp@intel.com, fengguang.wu@intel.com
List-Id: devicetree@vger.kernel.org

Your subject line is not in the correct format.

> backlight: Add arc to vendor prefixes

This is kind of the correct format, but this patch is not a
'backlight' patch, it's a 'dt-bindings: vendor-prefixes:' one.

Leave a '\n' here.

> Signed-off-by: Olimpiu Dejeu <olimpiu@arcticsand.com>
> ---
> v9 => v10:
> - Per Rob Herring's request changed vendor-prefix to arctic
> v8 => v9:
> - Version updated to match other patch in set. No other changes.
> v8:
> - Version to match other patches in set
> 
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 16d3b5e..6f33a4b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -28,6 +28,7 @@ andestech	Andes Technology Corporation
>  apm	Applied Micro Circuits Corporation (APM)
>  aptina	Aptina Imaging
>  arasan	Arasan Chip Systems
> +arctic	Arctic Sand
>  aries	Aries Embedded GmbH
>  arm	ARM Ltd.
>  armadeus	ARMadeus Systems SARL

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
