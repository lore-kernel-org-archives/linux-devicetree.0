From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 10/12] arm64: dts: hi3660: add spi device nodes
Date: Mon, 22 May 2017 19:46:27 -0500
Message-ID: <20170523004627.caeoqezj3leydj2t@rob-hp-laptop>
References: <20170517083745.24479-1-guodong.xu@linaro.org>
 <20170517083745.24479-11-guodong.xu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170517083745.24479-11-guodong.xu@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guodong Xu <guodong.xu@linaro.org>
Cc: xuwei5@hisilicon.com, catalin.marinas@arm.com, will.deacon@arm.com, wangkefeng.wang@huawei.com, puck.chen@hisilicon.com, xuejiancheng@hisilicon.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 17, 2017 at 04:37:43PM +0800, Guodong Xu wrote:
> From: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
> 
> Add spi2 and spi3 device nodes for hi3660, and enable them for hikey960.
> 
> On HiKey960:
>  - SPI2 is wired out through low speed expansion connector.
>  - SPI3 is wired out through high speed expansion connector.
> 
> Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin@hisilicon.com>
> Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
> ---
>  arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts |  8 ++++++
>  arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 30 +++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index 69aa207..79735ee 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -69,3 +69,11 @@
>  &uart6 {
>  	status = "okay";
>  };
> +
> +&spi2 {
> +	status = "okay";
> +};
> +
> +&spi3 {
> +	status = "okay";

LS connector label?
