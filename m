From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RESEND PATCH 1/3] arm64: dts: Add reset dts config for
 Hisilicon Hi6220 SoC
Date: Thu, 10 Sep 2015 11:38:54 +0200
Message-ID: <1441877934.3280.29.camel@pengutronix.de>
References: <1441865490-104686-1-git-send-email-puck.chen@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441865490-104686-1-git-send-email-puck.chen@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen Feng <puck.chen@hisilicon.com>
Cc: linux-kernel@vger.kernel.org, dan.zhao@hisilicon.com, w.f@huawei.com, haojian.zhuang@linaro.org, bintian.wang@huawei.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Am Donnerstag, den 10.09.2015, 14:11 +0800 schrieb Chen Feng:
> Add reset controller for hi6220 hikey-board.
> 
> Signed-off-by: Chen Feng <puck.chen@hisilicon.com>
> ---
>  arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> index 3f03380..09bb9d1 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
> @@ -167,5 +167,12 @@
>  			clocks = <&ao_ctrl 36>, <&ao_ctrl 36>;
>  			clock-names = "uartclk", "apb_pclk";
>  		};
> +
> +		reset_ctrl: reset_ctrl@f7030304 {
> +			compatible = "hisilicon,hisi_reset_ctl";

Please use hyphens instead of underscores here, also in the next patch
you modify the compatible value. I suggest to use

			compatible = "hisilicon,hi6220-reset-ctl";

here.

regards
Philipp
