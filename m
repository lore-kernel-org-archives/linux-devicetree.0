From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/3] arm64: dts: hisilicon: hi3670: Add reset controller
 support
Date: Thu, 07 Feb 2019 11:41:38 +0100
Message-ID: <1549536098.4557.9.camel@pengutronix.de>
References: <20190201153841.21903-1-manivannan.sadhasivam@linaro.org>
         <20190201153841.21903-3-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201153841.21903-3-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, xuwei5@hisilicon.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, guodong.xu@linaro.org
List-Id: devicetree@vger.kernel.org

On Fri, 2019-02-01 at 21:08 +0530, Manivannan Sadhasivam wrote:
> Add reset controller support for HiSilicon HI3670 SoC.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3670.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
> index a5bd6d80b226..83950119100e 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3670.dtsi
> @@ -151,6 +151,12 @@
>  			#clock-cells = <1>;
>  		};
>  
> +		crg_rst: crg_rst_controller {
> +			compatible = "hisilicon,hi3670-reset";

This could be

			compatible = "hisilicon,hi3670-reset", "hisilicon,hi3660-reset";

regards
Philipp
