From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8996: Disable USB2 PHY suspend by core
Date: Tue, 8 Jan 2019 12:10:16 +0530
Message-ID: <CAFp+6iGDz4WGHyMYP1W0XbSJnL7s-sGBdb1YZ4+iaO59tBqUuA@mail.gmail.com>
References: <20190103103538.30970-1-mgautam@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190103103538.30970-1-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manu Gautam <mgautam@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 3, 2019 at 6:18 PM Manu Gautam <mgautam@codeaurora.org> wrote:
>
> QUSB2 PHY on msm8996 doesn't work well when autosuspend by
> dwc3 core using USB2PHYCFG register is enabled. One of the
> issue seen is that PHY driver reports PLL lock failure and
> fails phy_init() if dwc3 core has USB2 PHY suspend enabled.
> Fix this by using quirks to disable USB2 PHY LPM/suspend and
> dwc3 core already takes care of explicitly suspending PHY
> during suspend if quirks are specified.
>
> Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
> ---

This works well for db820c [1].
Tested-by: Vivek Gautam <vivek.gautam@codeaurora.org>

[1] https://github.com/vivekgautam1/linux/commits/origin/v4.20-rc5/db820c

Best regards
Vivek

>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index b29fe80d7288..1f14ca35afc2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -911,6 +911,8 @@
>                                 interrupts = <0 138 IRQ_TYPE_LEVEL_HIGH>;
>                                 phys = <&hsusb_phy2>;
>                                 phy-names = "usb2-phy";
> +                               snps,dis_u2_susphy_quirk;
> +                               snps,dis_enblslpm_quirk;
>                         };
>                 };
>
> @@ -940,6 +942,8 @@
>                                 interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
>                                 phys = <&hsusb_phy1>, <&ssusb_phy_0>;
>                                 phy-names = "usb2-phy", "usb3-phy";
> +                               snps,dis_u2_susphy_quirk;
> +                               snps,dis_enblslpm_quirk;
>                         };
>                 };
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
