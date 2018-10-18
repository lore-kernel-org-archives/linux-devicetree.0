From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdm845: Add USB PHY lane two
Date: Thu, 18 Oct 2018 16:53:22 -0700
Message-ID: <CAD=FV=XAdZhb4Bq_MKni_-ep283v4dLw8i3Y7dy5-Y+7gwOKxg@mail.gmail.com>
References: <20181018210933.113592-1-evgreen@chromium.org> <20181018210933.113592-6-evgreen@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018210933.113592-6-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Manu Gautam <mgautam@codeaurora.org>, cang@codeaurora.org, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Oct 18, 2018 at 2:10 PM Evan Green <evgreen@chromium.org> wrote:
>
> This change adds the second lane registers for the USB PHY, now that the
> QMP phy bindings have been updated. This way the driver can stop
> reaching beyond its register region to get at the second lane.
>
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 9c72edb678ec..f28c50e93f5a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -1188,10 +1188,12 @@
>                                  <&gcc GCC_USB3_PHY_PRIM_BCR>;
>                         reset-names = "phy", "common";
>
> -                       usb_1_ssphy: lane@88e9200 {
> +                       usb_1_ssphy: lanes@88e9200 {
>                                 reg = <0x88e9200 0x128>,
>                                       <0x88e9400 0x200>,
>                                       <0x88e9c00 0x218>,
> +                                     <0x88e9600 0x128>,
> +                                     <0x88e9800 0x200>,
>                                       <0x88e9a00 0x100>;
>                                 #phy-cells = <0>;
>                                 clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> @@ -1219,10 +1221,12 @@
>                                  <&gcc GCC_USB3_PHY_SEC_BCR>;
>                         reset-names = "phy", "common";
>
> -                       usb_2_ssphy: lane@88eb200 {
> +                       usb_2_ssphy: lanes@88eb200 {
>                                 reg = <0x88eb200 0x128>,
>                                       <0x88eb400 0x1fc>,
>                                       <0x88eb800 0x218>,
> +                                     <0x88eb600 0x128>,
> +                                     <0x88eb800 0x1fc>,

This is wrong and needs to be fixed.  The
"qcom,sdm845-qmp-usb3-uni-phy" is not dual-lane and thus shouldn't
have tx2/rx2.  The driver knows "qcom,sdm845-qmp-usb3-uni-phy" is not
dual lane and thus will try to map tx2 as pcs_misc.


Also overall I'll continue to point out that this patch needs to land
_after_ the driver fix since the new driver can cope with either style
device tree (at least temporarily) but the old driver can't cope with
the new device tree.  See patch #2 comments for details.

-Doug
