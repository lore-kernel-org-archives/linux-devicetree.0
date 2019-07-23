From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sdm845: remove unit name for thermal trip points
Date: Tue, 23 Jul 2019 07:47:34 -0700
Message-ID: <5d371e07.1c69fb81.4ceba.91a4@mx.google.com>
References: <20190722123422.4571-1-vkoul@kernel.org> <20190722123422.4571-4-vkoul@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722123422.4571-4-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-07-22 05:34:20)
> The thermal trip points have unit name but no reg property, so we can
> remove them
>=20
> arch/arm64/boot/dts/qcom/sdm845.dtsi:2824.31-2828.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu0-thermal/trips/trip-point@0: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:2830.31-2834.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu0-thermal/trips/trip-point@1: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:2868.31-2872.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu1-thermal/trips/trip-point@0: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:2874.31-2878.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu1-thermal/trips/trip-point@1: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:2912.31-2916.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu2-thermal/trips/trip-point@0: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:2918.31-2922.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu2-thermal/trips/trip-point@1: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:2956.31-2960.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu3-thermal/trips/trip-point@0: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:2962.31-2966.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu3-thermal/trips/trip-point@1: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3000.31-3004.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu4-thermal/trips/trip-point@0: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3006.31-3010.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu4-thermal/trips/trip-point@1: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3044.31-3048.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu5-thermal/trips/trip-point@0: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3050.31-3054.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu5-thermal/trips/trip-point@1: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3088.31-3092.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu6-thermal/trips/trip-point@0: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3094.31-3098.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu6-thermal/trips/trip-point@1: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3132.31-3136.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu7-thermal/trips/trip-point@0: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3138.31-3142.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cpu7-thermal/trips/trip-point@1: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3176.32-3180.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/aoss0-thermal/trips/trip-point@0: node has a unit=
 name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3191.35-3195.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cluster0-thermal/trips/trip-point@0: node has a u=
nit name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3211.35-3215.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/cluster1-thermal/trips/trip-point@0: node has a u=
nit name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3231.31-3235.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/gpu-thermal-top/trips/trip-point@0: node has a un=
it name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3246.31-3250.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/gpu-thermal-bottom/trips/trip-point@0: node has a=
 unit name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3261.32-3265.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/aoss1-thermal/trips/trip-point@0: node has a unit=
 name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3276.35-3280.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/q6-modem-thermal/trips/trip-point@0: node has a u=
nit name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3291.30-3295.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/mem-thermal/trips/trip-point@0: node has a unit n=
ame, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3306.31-3310.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/wlan-thermal/trips/trip-point@0: node has a unit =
name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3321.33-3325.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/q6-hvx-thermal/trips/trip-point@0: node has a uni=
t name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3336.33-3340.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/camera-thermal/trips/trip-point@0: node has a uni=
t name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3351.32-3355.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/video-thermal/trips/trip-point@0: node has a unit=
 name, but no reg property
> arch/arm64/boot/dts/qcom/sdm845.dtsi:3366.32-3370.7: Warning (unit_addres=
s_vs_reg): /thermal-zones/modem-thermal/trips/trip-point@0: node has a unit=
 name, but no reg property
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
