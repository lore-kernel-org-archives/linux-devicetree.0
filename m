From: leo.yan@linaro.org
Subject: Re: [PATCH 04/11] dts: qcom: Update coresight bindings for hardware
 ports
Date: Wed, 12 Sep 2018 18:17:53 +0800
Message-ID: <20180912101753.GB3353@leoy-ThinkPad-X240s>
References: <1536661032-30481-1-git-send-email-suzuki.poulose@arm.com>
 <1536661032-30481-5-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1536661032-30481-5-git-send-email-suzuki.poulose@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org, mathieu.poirier@linaro.org, arm@kernel.org, sudeep.holla@arm.com, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, "Ivan T . Ivanov" <ivan.ivanov@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Suzuki,

On Tue, Sep 11, 2018 at 11:17:05AM +0100, Suzuki K Poulose wrote:
> Switch to updated coresight bindings for hw ports
> 
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Ivan T. Ivanov <ivan.ivanov@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 98 ++++++++++++++++++++++-------------
>  1 file changed, 63 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 7b32b89..5bed52b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1099,10 +1099,11 @@
>  			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
>  			clock-names = "apb_pclk", "atclk";
>  
> -			port {
> -				tpiu_in: endpoint {
> -					slave-mode;
> -					remote-endpoint = <&replicator_out1>;
> +			out-ports {

Here should be in-ports for tpiu node?

BTW, if upper comment is valid, this means the DT binding doc also
gives wrong example for tpiu node [1].

I tested this patch with upper changing to 'in-ports', etm with perf
mode can work well on DB410c board.

[...]

Thanks,
Leo Yan

[1] https://git.linaro.org/kernel/coresight.git/tree/Documentation/devicetree/bindings/arm/coresight.txt?h=next#n135
