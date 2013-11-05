From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v3 04/11] ARM: dts: imx6: add anatop phandle for usbphy
Date: Tue, 5 Nov 2013 10:41:33 +0800
Message-ID: <20131105024130.GG19770@S2101-09.ap.freescale.net>
References: <1383616183-10511-1-git-send-email-peter.chen@freescale.com>
 <1383616183-10511-5-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1383616183-10511-5-git-send-email-peter.chen@freescale.com>
Sender: linux-doc-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>
Cc: balbi@ti.com, rob.herring@calxeda.com, grant.likely@linaro.org, alexander.shishkin@linux.intel.com, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, festevam@gmail.com, marex@denx.de, kernel@pengutronix.de, m.grzeschik@pengutronix.de, frank.li@freescale.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 05, 2013 at 09:49:36AM +0800, Peter Chen wrote:
> Add anatop phandle for usbphy
> 
> Signed-off-by: Peter Chen <peter.chen@freescale.com>
> ---
>  arch/arm/boot/dts/imx6qdl.dtsi |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Does imx6sl.dtsi need the same update?

Shawn

> 
> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
> index 226ce75..bb79678 100644
> --- a/arch/arm/boot/dts/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> @@ -559,6 +559,7 @@
>  				reg = <0x020c9000 0x1000>;
>  				interrupts = <0 44 0x04>;
>  				clocks = <&clks 182>;
> +				fsl,anatop = <&anatop>;
>  			};
>  
>  			usbphy2: usbphy@020ca000 {
> @@ -566,6 +567,7 @@
>  				reg = <0x020ca000 0x1000>;
>  				interrupts = <0 45 0x04>;
>  				clocks = <&clks 183>;
> +				fsl,anatop = <&anatop>;
>  			};
>  
>  			snvs@020cc000 {
> -- 
> 1.7.1
> 
> 

