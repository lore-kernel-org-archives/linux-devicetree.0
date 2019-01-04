From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: hi3660: Add hisi asp dma device
Date: Thu, 3 Jan 2019 20:44:49 -0600
Message-ID: <20190104024449.GB17431@bogus>
References: <1545978983-124360-1-git-send-email-hutenghui@huawei.com>
 <1545978983-124360-3-git-send-email-hutenghui@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1545978983-124360-3-git-send-email-hutenghui@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: h00249924 <hutenghui@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Youlin Wang <wwx575822@notesmail.huawei.com>, hanxiaolong3@hisilicon.com, suzhuangluan@hisilicon.com, hantanglei@huawei.com, linux-kernel@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>, kongfei@hisilicon.com, ninggaoyu@hisilicon.com, John Stultz <john.stultz@linaro.org>, liyuequan@hisilicon.com, dmaengine@vger.kernel.org, huangli295@hisilicon.com, wangyoulin1@hisilicon.com, linux-arm-kernel@lists.infradead.org, cash.qianli@hisilicon.com
List-Id: devicetree@vger.kernel.org

On Fri, Dec 28, 2018 at 02:36:23PM +0800, h00249924 wrote:
> From: Youlin Wang <wwx575822@notesmail.huawei.com>
> 
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Youlin Wang <wwx575822@notesmail.huawei.com>
> Signed-off-by: Tanglei Han <hantanglei@huawei.com>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> index f432b0a..5223e36 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> @@ -1122,5 +1122,19 @@
>  				};
>  			};
>  		};
> +
> +		asp_dmac: asp_dmac@E804B000 {

dma-controller@e804b000

> +			compatible = "hisilicon,hisi-pcm-asp-dma-1.0";
> +			reg = <0x0 0xe804b000 0x0 0x1000>;
> +			#dma-cells = <1>;
> +			dma-channels = <16>;
> +			dma-requests = <32>;
> +			dma-min-chan = <0>;
> +			dma-used-chans = <0xFFFE>;

Use lowercase hex.

But more importantly, as John mentioned, this and other properties 
aren't documented.

> +			dma-share;
> +			interrupts = <0 216 4>;
> +			interrupt-names = "asp_dma_irq";
> +			status = "ok";

Don't need this.

> +		};
>  	};
>  };
> -- 
> 1.9.1
> 
