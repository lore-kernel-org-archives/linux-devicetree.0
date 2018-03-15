From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v7 3/3] dts: arm64: Add mailbox binding for hi3660
Date: Thu, 15 Mar 2018 16:41:18 +0000
Message-ID: <5AAAA22E.5030009@hisilicon.com>
References: <1521130058-24796-1-git-send-email-leo.yan@linaro.org>
 <1521130058-24796-4-git-send-email-leo.yan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521130058-24796-4-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leo Yan <leo.yan@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kaihua Zhong <zhongkaihua@huawei.com>, Guodong Xu <guodong.xu@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Ruyi Wang <wangruyi@huawei.com>
List-Id: devicetree@vger.kernel.org

Hi Leo,

On 2018/3/15 16:07, Leo Yan wrote:
> From: Kaihua Zhong <zhongkaihua@huawei.com>
> 
> Add DT binding for mailbox driver.
> 
> Signed-off-by: Ruyi Wang <wangruyi@huawei.com>
> Signed-off-by: Kaihua Zhong <zhongkaihua@huawei.com>

Fine to me. Thanks!
Acked-by: Wei Xu <xuwei5@hisilicon.com>

Best Regards,
Wei

> ---
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> index 63d4f9d..3788448 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -298,6 +298,14 @@
>  			#reset-cells = <2>;
>  		};
>  
> +		mailbox: mailbox@e896b000 {
> +			compatible = "hisilicon,hi3660-mbox";
> +			reg = <0x0 0xe896b000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
> +			#mbox-cells = <3>;
> +		};
> +
>  		dual_timer0: timer@fff14000 {
>  			compatible = "arm,sp804", "arm,primecell";
>  			reg = <0x0 0xfff14000 0x0 0x1000>;
> 
