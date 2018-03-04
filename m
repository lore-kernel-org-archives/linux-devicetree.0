From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v5 4/4] arm64: dts: sdm845: Add serial console support
Date: Sun, 4 Mar 2018 11:59:30 -0800
Message-ID: <20180304195930.GQ93895@bjorns-mbp-2.lan>
References: <20180222061208.2031-1-rnayak@codeaurora.org>
 <20180222061208.2031-5-rnayak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180222061208.2031-5-rnayak@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: andy.gross@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sboyd@codeaurora.org, evgreen@chromium.org, dianders@chromium.org, marc.zyngier@arm.com
List-Id: devicetree@vger.kernel.org

On Wed 21 Feb 22:12 PST 2018, Rajendra Nayak wrote:
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
[..]
> +			qup_uart2: serial@a84000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0xa84000 0x4000>;
> +				reg-names = "se-phys";
> +				clock-names = "se-clk";

This was changed to "se" in v3 of the GENI patchset, with that this
boots nicely again.

Regards,
Bjorn
