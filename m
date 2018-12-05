From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: sdm845: Add SD nodes for sdm845-mtp
Date: Wed, 5 Dec 2018 13:18:49 -0800
Message-ID: <CAD=FV=VtKpbL3-Wt8ctcmTG0_-YzgEv3xXZGd8xV=RsgAhof1A@mail.gmail.com>
References: <20181128223428.177313-1-evgreen@chromium.org> <20181128223428.177313-4-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128223428.177313-4-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Nov 28, 2018 at 2:34 PM Evan Green <evgreen@chromium.org> wrote:
> +&sdhc_2 {
> +       status = "okay";
> +
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&sdc2_clk &sdc2_cmd &sdc2_data &sd_cd_odl>;
> +
> +       vmmc-supply = <&vreg_l21a_2p95>;
> +       vqmmc-supply = <&vddpx_2>;
> +
> +       cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
> +};
> +
>  &qupv3_id_1 {

Please sort alphabetically.  "s" comes after "q".


> +       /* It seems that mmc_test reports errors if drive strength is not 16. */

Possibly put this comment right next to one of the the "drive-strength" lines?


> +       sd_cd_odl: sd-cd-odl {

"sd_cd_odl" is the name on a different board.  On sdm845 this is
'sd_card_det_n", so it'd be better to use that name.


> +               pinmux {
> +                       pins = "gpio126";
> +                       function = "gpio";
> +               };
> +
> +               pinconf {
> +                       pins = "gpio126";
> +                       bias-pull-up;
> +                       drive-strength = <2>;

Maybe leave this off?  According to Bjorn's research "drive-strength"
has no affect on inputs and this is most certainly an input.

-Doug
