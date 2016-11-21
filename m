From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: max77620: add documentation for MPOK
 property
Date: Mon, 21 Nov 2016 13:10:48 +0000
Message-ID: <20161121131048.GD3917@dell>
References: <1479405276-26452-1-git-send-email-vreddytalla@nvidia.com>
 <1479405276-26452-2-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1479405276-26452-2-git-send-email-vreddytalla@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Venkat Reddy Talla <vreddytalla@nvidia.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ldewangan@nvidia.com, svelpula@nvidia.com
List-Id: devicetree@vger.kernel.org

On Thu, 17 Nov 2016, Venkat Reddy Talla wrote:

> Adding documentation for maxim,power-ok-control dts property
> 
> Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
> 
> ---
> Changes from V1:
>  None
> ---
>  Documentation/devicetree/bindings/mfd/max77620.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
  
> diff --git a/Documentation/devicetree/bindings/mfd/max77620.txt b/Documentation/devicetree/bindings/mfd/max77620.txt
> index 2ad44f7..9c16d51 100644
> --- a/Documentation/devicetree/bindings/mfd/max77620.txt
> +++ b/Documentation/devicetree/bindings/mfd/max77620.txt
> @@ -106,6 +106,18 @@ Here supported time periods by device in microseconds are as follows:
>  MAX77620 supports 40, 80, 160, 320, 640, 1280, 2560 and 5120 microseconds.
>  MAX20024 supports 20, 40, 80, 160, 320, 640, 1280 and 2540 microseconds.
>  
> +-maxim,power-ok-control: configure map power ok bit
> +			1: Enables POK(Power OK) to control nRST_IO and GPIO1
> +			POK function.
> +			0: Disables POK control.
> +			if property missing, do not configure MPOK bit.
> +			If POK mapping is enabled for GPIO1/nRST_IO then,
> +			GPIO1/nRST_IO pins are HIGH only if all rails
> +			that have POK control enabled are HIGH.
> +			If any of the rails goes down(which are enabled for POK
> +			control) then, GPIO1/nRST_IO goes LOW.
> +			this property is valid for max20024 only.
> +
>  For DT binding details of different sub modules like GPIO, pincontrol,
>  regulator, power, please refer respective device-tree binding document
>  under their respective sub-system directories.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
