From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: arm64: dts: qcom: Add apq8096 dragonboard dts skeletons
Date: Mon, 30 Nov 2015 15:48:17 -0800
Message-ID: <20151130234817.GC21446@codeaurora.org>
References: <1448517238-32338-1-git-send-email-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448517238-32338-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: agross@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/26, Rajendra Nayak wrote:
> Add new dtsi and dts files for the apq8096 dragonboards with just
> a serial device used as debug console
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> Patch applies on top of Stephens' patches to add msm8996 dtsi
> https://lkml.org/lkml/2015/11/17/955
> 
>  arch/arm64/boot/dts/qcom/Makefile                 |  2 +-
>  arch/arm64/boot/dts/qcom/apq8096-dragonboard.dts  | 21 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/apq8096-dragonboard.dtsi | 30 +++++++++++++++++++++++
>  3 files changed, 52 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/apq8096-dragonboard.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/apq8096-dragonboard.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index fa1f661..bd992ef 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -1,5 +1,5 @@
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb msm8916-mtp.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb apq8096-dragonboard.dtb

We should move to one dtb per line in this file. Other platforms
are doing the same thing.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
