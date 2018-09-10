From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sdm845-mtp: Add RPMh VRM/XOB
 regulators
Date: Mon, 10 Sep 2018 10:46:38 -0700
Message-ID: <20180910174638.GB2523@minitux>
References: <20180822173629.202885-1-dianders@chromium.org>
 <20180822173629.202885-3-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180822173629.202885-3-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, swboyd@chromium.org, tfiga@chromium.org, Manu Gautam <mgautam@codeaurora.org>, David Collins <collinsd@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed 22 Aug 10:36 PDT 2018, Douglas Anderson wrote:
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
[..]
> +
> +		vdd_qusb_hs0:
> +		vdda_hp_pcie_core:
> +		vdda_mipi_csi0_0p9:
> +		vdda_mipi_csi1_0p9:
> +		vdda_mipi_csi2_0p9:
> +		vdda_mipi_dsi0_pll:
> +		vdda_mipi_dsi1_pll:
> +		vdda_qlink_lv:
> +		vdda_qlink_lv_ck:
> +		vdda_qrefs_0p875:
> +		vdda_pcie_core:
> +		vdda_pll_cc_ebi01:
> +		vdda_pll_cc_ebi23:
> +		vdda_sp_sensor:
> +		vdda_ufs1_core:
> +		vdda_ufs2_core:
> +		vdda_usb1_ss_core:
> +		vdda_usb2_ss_core:

While I agree with Doug that it would be connect to use the input pin
name to describe the supplies of the various block I don't like the
level of indirection it results in when reading the dts.

So I would prefer that any of these just reference vreg_l1a_0p875
directly.


That said, the patch looks good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
