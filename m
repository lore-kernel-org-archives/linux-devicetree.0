From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: add bindings doc for HiSilicon INNO
 USB2 PHY
Date: Fri, 2 Mar 2018 11:55:57 +0530
Message-ID: <c1f60df2-20d1-53ac-6cf7-9c81baea789c@ti.com>
References: <1519888940-23235-1-git-send-email-shawn.guo@linaro.org>
 <1519888940-23235-2-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519888940-23235-2-git-send-email-shawn.guo@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Jiancheng Xue <xuejiancheng@hisilicon.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pengcheng Li <lpc.li@hisilicon.com>
List-Id: devicetree@vger.kernel.org



On Thursday 01 March 2018 12:52 PM, Shawn Guo wrote:
> From: Pengcheng Li <lpc.li@hisilicon.com>
> 
> It adds device tree bindings document for HiSilicon INNO USB2 PHY.
> 
> Signed-off-by: Pengcheng Li <lpc.li@hisilicon.com>
> Signed-off-by: Jiancheng Xue <xuejiancheng@hisilicon.com>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../devicetree/bindings/phy/phy-hisi-inno-usb2.txt | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt b/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
> new file mode 100644
> index 000000000000..b563cf54ca7b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-hisi-inno-usb2.txt
> @@ -0,0 +1,52 @@
> +HiSilicon INNO USB2 PHY
> +
> +Required properties:
> +- compatible: Should be one of the following strings:
> +	"hisilicon,inno-usb2-phy",
> +	"hisilicon,hi3798cv200-usb2-phy".
> +- reg: Should be the address space for PHY configuration register in peripheral
> +  controller, e.g. PERI_USB0 for USB 2.0 PHY01 on Hi3798cv200 SoC.
> +- #phy-cells: Should be 1. The specifier is the index of the PHY port to
> +  reference.

This can be '0' if the consumers directly use phandle to the subnodes.

Thanks
Kishon
