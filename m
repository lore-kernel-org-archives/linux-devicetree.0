From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc2: add description for px30
Date: Mon, 10 Sep 2018 14:36:48 +0200
Message-ID: <10844921.P8CMEBK8dG@phil>
References: <20180802130133.4898-1-heiko@sntech.de>
 <20180802130133.4898-2-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180802130133.4898-2-heiko@sntech.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, balbi@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, robh+dt@kernel.org, cl@rock-chips.com, hminas@synopsys.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Greg, Felipe,

Am Donnerstag, 2. August 2018, 15:01:31 CEST schrieb Heiko Stuebner:
> From: Liang Chen <cl@rock-chips.com>
> 
> This patch adds the compatible of dwc2 for PX30 SoCs.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Do you want to pick that patch through one of the usb trees, or should
I just apply it with the arm64 devicetree-patches?


Thanks
Heiko


> unchanged from it being part of the general px30 series
> 
>  Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
> index 46da5f184460..6dc3c4a34483 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc2.txt
> @@ -6,6 +6,7 @@ Required properties:
>    - brcm,bcm2835-usb: The DWC2 USB controller instance in the BCM2835 SoC.
>    - hisilicon,hi6220-usb: The DWC2 USB controller instance in the hi6220 SoC.
>    - rockchip,rk3066-usb: The DWC2 USB controller instance in the rk3066 Soc;
> +  - "rockchip,px30-usb", "rockchip,rk3066-usb", "snps,dwc2": for px30 Soc;
>    - "rockchip,rk3188-usb", "rockchip,rk3066-usb", "snps,dwc2": for rk3188 Soc;
>    - "rockchip,rk3288-usb", "rockchip,rk3066-usb", "snps,dwc2": for rk3288 Soc;
>    - "lantiq,arx100-usb": The DWC2 USB controller instance in Lantiq ARX SoCs;
> 
