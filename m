From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845: Add UFS nodes for sdm845-mtp
Date: Thu, 18 Oct 2018 17:04:18 +0530
Message-ID: <CAFp+6iExBJu06=mx12za=Hxsp+GKzQ2vAD-JRiC3PkhDcRo0yA@mail.gmail.com>
References: <20181017172312.194281-1-evgreen@chromium.org> <20181017172312.194281-3-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181017172312.194281-3-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: evgreen@chromium.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, robh+dt <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, swboyd@chromium.org, Doug Anderson <dianders@chromium.org>, Can Guo <cang@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 17, 2018 at 10:55 PM Evan Green <evgreen@chromium.org> wrote:
>
> From: Can Guo <cang@codeaurora.org>
>
> This change enables the UFS host controller and PHY on sdm845-mtp.
>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
> I was unable to test this on an MTP, if somebody could give this a try I would
> be grateful. This applies atop agross/for-next, since it needs the regulators.
>
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index eedfaf8922e2..d5fddea71a85 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -356,6 +356,20 @@
>         status = "okay";
>  };
>
> +&ufshc1 {
> +       status = "okay";
> +
> +       vcc-supply = <&vreg_l20a_2p95>;
> +       vcc-max-microamp = <600000>;
> +};
> +
> +&ufsphy1 {
> +       status = "okay";
> +
> +       vdda-phy-supply = <&vdda_ufs1_core>;
> +       vdda-pll-supply = <&vdda_ufs1_1p2>;
> +};
> +
>  &usb_1 {
>         status = "okay";
>  };
> --
> 2.16.4
>

Looks good.
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

Best regards
Vivek

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
