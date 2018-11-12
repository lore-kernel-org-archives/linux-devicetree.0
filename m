Return-Path: <robherring2@gmail.com>
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: phy: Add support for HiSilicon's
 hi3660 USB PHY
Message-ID: <20181112160601.GA22411@bogus>
References: <20181027095820.40056-1-chenyu56@huawei.com>
 <20181027095820.40056-3-chenyu56@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181027095820.40056-3-chenyu56@huawei.com>
Date: Mon, 12 Nov 2018 10:06:20 -0600
To: Yu Chen <chenyu56@huawei.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Mark Rutland <mark.rutland@arm.com>, John Stultz <john.stultz@linaro.org>, Binghui Wang <wangbinghui@hisilicon.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, Oct 27, 2018 at 05:58:12PM +0800, Yu Chen wrote:
> This patch adds binding documentation for supporting the hi3660 usb
> phy on boards like the HiKey960.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Binghui Wang <wangbinghui@hisilicon.com>
> Signed-off-by: Yu Chen <chenyu56@huawei.com>
> ---
>  .../devicetree/bindings/phy/phy-hi3660-usb3.txt     | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt b/Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
> new file mode 100644
> index 000000000000..26cab738ac7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
> @@ -0,0 +1,21 @@
> +Hisilicon hi3660 usb PHY
> +-----------------------
> +
> +Required properties:
> +- compatible: should be "hisilicon,hi3660-usb-phy"
> +- #phy-cells: must be 0
> +- hisilicon,pericrg-syscon: phandle of syscon used to control phy.
> +- hisilicon,pctrl-syscon: phandle of syscon used to control phy.
> +- hisilicon,usb3-otg-bc-syscon: phandle of syscon used to control phy.
> +- eye-diagram-param: parameter set for phy

hisilicon,eye-diagram-param

> +Refer to phy/phy-bindings.txt for the generic PHY binding properties
> +
> +Example:
> +	usb_phy: usbphy {

usb-phy {

> +		compatible = "hisilicon,hi3660-usb-phy";
> +		#phy-cells = <0>;
> +		hisilicon,pericrg-syscon = <&crg_ctrl>;
> +		hisilicon,pctrl-syscon = <&pctrl>;
> +		hisilicon,usb3-otg-bc-syscon = <&usb3_otg_bc>;
> +		eye-diagram-param = <0x22466e4>;
> +	};
> -- 
> 2.15.0-rc2
> 
