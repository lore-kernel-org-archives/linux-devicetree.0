Return-Path: <SRS0=BuJn=2A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92170C43603
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 18:12:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51DC520836
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Dec 2019 18:12:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="seCb7kiQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727674AbfLJSMf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Dec 2019 13:12:35 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:44928 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727671AbfLJSMf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Dec 2019 13:12:35 -0500
Received: by mail-vk1-f195.google.com with SMTP id y184so2346802vkc.11
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 10:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k6sVjfi/PdJ/dmprjR0rNFlPYKHRc2uXW2FzM0L41ps=;
        b=seCb7kiQdZIhIJ1EltRMvjCfYTTjZG4OVggJ0B+50AdQ73AROwavvp+/lL2I8NC69L
         8C5an7zd+xgbgBKy+2vW20LmuS2PrBGq7HFeHDDHKvDbExF5BqKYproMAwDhpl5dU5un
         Dibf0yG3sfu08JYTe7a4vVzg/Sk+HrF+0tKTDknRsmHtzsweceJaUSSiwY2vtsyAlMSG
         hgO8O0zRbpz/7JXNgD4MtZsBwxaPxEdvt4zVLo6D5N21Syzm/34mkb+z1LuK/rM0cqAG
         uljGhC99u3naOtbVrUhVRMDqFLw6vXGac08s49C+fBwBHaoIMCLxGF+6cgIhEGOsiv/1
         AUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k6sVjfi/PdJ/dmprjR0rNFlPYKHRc2uXW2FzM0L41ps=;
        b=bJgWuIABFKu/jXH1E/07wtKkT+PbIej3rf33OOlGoQqi6vltQF7kp46qpUgOKljmJS
         wrAdM1W5ej6ObL7dNZCxtLPNWHBuNzUC/JoLTsh0JyZR/bz/tkJwrIhM2s4bI71n0sbq
         eWDLeLS2no5NYd4hn4MUPKjmHzEtFSx9IZk9zMxtTryyAUUX7rzajkKRbmUdPFp4KL9Z
         vc+75oZqLNpPrVYD9eXMd+GRMeYc2aJsBOijqx7UWhR9awE+aH/J4tTksAC2FxzQ4/kj
         O2DjZ032SjzqAYcXwH5jsz8HRgRP0sALuMt92zNKrXxpAl4UYdbm1fYO9CaZqKBcCzKq
         EH6A==
X-Gm-Message-State: APjAAAUi9/0qfgTkFNRp+8BdkW8Uuw62d9Kn6ZnfYLs0AjWFBSLkNA9+
        Uyx6n3n8NqOv0Ear05eltKnbDVWskfnY03ypuSVi8g==
X-Google-Smtp-Source: APXvYqxrIsjaAWOqaG/+YCzeE96kih6HlmA2WQVNrO51H3ONFtRZBTqz2ubNd8M0IBAqKObZFttmCkNHmglmNZk/jcA=
X-Received: by 2002:a05:6122:313:: with SMTP id c19mr5431202vko.79.1576001554113;
 Tue, 10 Dec 2019 10:12:34 -0800 (PST)
MIME-Version: 1.0
References: <20191031111645.34777-1-kholk11@gmail.com> <20191031111645.34777-5-kholk11@gmail.com>
In-Reply-To: <20191031111645.34777-5-kholk11@gmail.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Tue, 10 Dec 2019 23:42:22 +0530
Message-ID: <CAHLCerPtCF2TCZ2CY-_yavA5NC=UDaR-cOk-zBA0t5KUUqMhHA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: Add MSM8976 SoC support dts files
To:     kholk11@gmail.com
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, ccross@android.com,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        marijns95@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Oct 31, 2019 at 4:46 PM <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> These are the DTs to support the MSM8976 SoC and, with very small
> overrides in future ones, also MSM8956 and their APQ variants.
>
> This configuration includes firmware, cpu, psci, idle states,
> clocks, smem, rpm and power domains, i2c, spi, thermal sensors,
> smsm, smp2p, sdhci, spmi, iommus, gpu, mdss/mdp, hexagon.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 1705 +++++++++++++++++++++++++
>  1 file changed, 1705 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8976.dtsi
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> new file mode 100644
> index 000000000000..6fb917cd48fc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -0,0 +1,1705 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2014-2015, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2016-2019 AngeloGioacchino Del Regno <kholk11@gmail.com>
> + */
> +

<snip>

> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               CPU0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,armv8";
> +                       reg = <0x0>;
> +                       enable-method = "psci";
> +                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0>;
> +                       capacity-dmips-mhz = <1024>;
> +                       next-level-cache = <&L2_0>;
> +                       #cooling-cells = <2>;
> +                       L2_0: l2-cache {
> +                               compatible = "arm,arch-cache";
> +                               cache-level = <2>;
> +                       };
> +                       L1_I_0: l1-icache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +                       L1_D_0: l1-dcache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU1: cpu@1 {
> +                       device_type = "cpu";
> +                       compatible = "arm,armv8";
> +                       reg = <0x1>;
> +                       enable-method = "psci";
> +                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0>;
> +                       capacity-dmips-mhz = <1024>;
> +                       next-level-cache = <&L2_0>;
> +                       #cooling-cells = <2>;
> +                       L1_I_1: l1-icache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +                       L1_D_1: l1-dcache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU2: cpu@2 {
> +                       device_type = "cpu";
> +                       compatible = "arm,armv8";
> +                       reg = <0x2>;
> +                       enable-method = "psci";
> +                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0>;
> +                       capacity-dmips-mhz = <1024>;
> +                       next-level-cache = <&L2_0>;
> +                       #cooling-cells = <2>;
> +                       L1_I_2: l1-icache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +                       L1_D_2: l1-dcache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU3: cpu@3 {
> +                       device_type = "cpu";
> +                       compatible = "arm,armv8";
> +                       reg = <0x3>;
> +                       enable-method = "psci";
> +                       cpu-idle-states = <&LITTLE_CPU_SLEEP_0>;
> +                       capacity-dmips-mhz = <1024>;
> +                       next-level-cache = <&L2_0>;
> +                       #cooling-cells = <2>;
> +                       L1_I_3: l1-icache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +                       L1_D_3: l1-dcache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU4: cpu@100 {
> +                       device_type = "cpu";
> +                       compatible = "arm,armv8";
> +                       reg = <0x100>;
> +                       enable-method = "psci";
> +                       cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
> +                       capacity-dmips-mhz = <1830>;

The convention has been to use 1024 as the capacity-dmips-mhz value
for the big core and scale down the capacity for the LITTLE core
accordingly.

> +                       next-level-cache = <&L2_1>;
> +                       #cooling-cells = <2>;
> +                       L2_1: l2-cache {
> +                               compatible = "arm,arch-cache";
> +                               cache-level = <2>;
> +                       };
> +                       L1_I_100: l1-icache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +                       L1_D_100: l1-dcache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU5: cpu@101 {
> +                       device_type = "cpu";
> +                       compatible = "arm,armv8";
> +                       reg = <0x101>;
> +                       enable-method = "psci";
> +                       cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
> +                       capacity-dmips-mhz = <1830>;
> +                       next-level-cache = <&L2_1>;
> +                       #cooling-cells = <2>;
> +                       L1_I_101: l1-icache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +                       L1_D_101: l1-dcache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU6: cpu@102 {
> +                       device_type = "cpu";
> +                       compatible = "arm,armv8";
> +                       reg = <0x102>;
> +                       enable-method = "psci";
> +                       cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
> +                       capacity-dmips-mhz = <1830>;
> +                       next-level-cache = <&L2_1>;
> +                       #cooling-cells = <2>;
> +                       L1_I_102: l1-icache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +                       L1_D_102: l1-dcache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +               };
> +
> +               CPU7: cpu@103 {
> +                       device_type = "cpu";
> +                       compatible = "arm,armv8";
> +                       reg = <0x103>;
> +                       enable-method = "psci";
> +                       cpu-idle-states = <&BIG_CPU_SLEEP_0 &BIG_CPU_SLEEP_1>;
> +                       capacity-dmips-mhz = <1830>;
> +                       next-level-cache = <&L2_1>;
> +                       #cooling-cells = <2>;
> +                       L1_I_103: l1-icache {
> +                               compatible = "arm,arch-cache";
> +                       };
> +                       L1_D_103: l1-dcache {
> +                               compatible = "arm,arch-cache";


<snip>

> +
> +               tsens0: thermal-sensor@4a9000 {
> +                       compatible = "qcom,msm8976-tsens";
> +                       reg = <0x004a9000 0x1000>, /* TM */
> +                             <0x004a8000 0x1000>; /* SROT */
> +                       nvmem-cells = <&tsens_caldata>;
> +                       nvmem-cell-names = "calib";
> +                       #qcom,sensors = <11>;
> +                       #thermal-sensor-cells = <1>;

Now that interrupt support for tsens has landed in 5.5-rc1, please add that too.

<snip>


> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "hot";
> +                               };
> +                       };
> +               };
> +
> +               cam-isp-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +
> +                       thermal-sensors = <&tsens0 3>;
> +                       trips {
> +                               cam_isp_alert: trip-point@0 {

Lose the @. Just use trip-point0 else the DT compiler will complain.
Please replace for all thermal zones.

> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "hot";
> +                               };
> +                       };
> +               };
> +
> +               apc1-cpu0-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +                       thermal-sensors = <&tsens0 4>;
> +
> +                       trips {
> +                               cpu4_alert0: trip-point@0 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "hot";
> +                               };
> +                               cpu4_alert1: trip-point@1 {
> +                                       temperature = <105000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +                               cpu4_crit: trip-point@2 {
> +                                       temperature = <120000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };

Since you don't have cpufreq support from what I can tell, there are
no cooling maps for the cpus. So there is no point in having these
passive trip points. Just have the hot and critical trips for now.

Once we get the cpuidle cooling governor merged or you add cpufreq
support, you can re-add the passive trip point along with the cooling
maps.


> +                       };
> +               };
> +
> +               apc1-cpu1-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +                       thermal-sensors = <&tsens0 5>;
> +
> +                       trips {
> +                               cpu5_alert0: trip-point@0 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "hot";
> +                               };
> +                               cpu5_alert1: trip-point@1 {
> +                                       temperature = <105000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +                               cpu5_crit: trip-point@2 {
> +                                       temperature = <120000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               apc1-cpu2-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +                       thermal-sensors = <&tsens0 6>;
> +
> +                       trips {
> +                               cpu6_alert0: trip-point@0 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "hot";
> +                               };
> +                               cpu6_alert1: trip-point@1 {
> +                                       temperature = <105000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +                               cpu6_crit: trip-point@2 {
> +                                       temperature = <120000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               apc1-cpu3-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +                       thermal-sensors = <&tsens0 7>;
> +
> +                       trips {
> +                               cpu7_alert0: trip-point@0 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "hot";
> +                               };
> +                               cpu7_alert1: trip-point@1 {
> +                                       temperature = <105000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +                               cpu7_crit: trip-point@2 {
> +                                       temperature = <120000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               apc1-l2-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +                       thermal-sensors = <&tsens0 8>;
> +
> +                       trips {
> +                               l2_alert0: trip-point@0 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "hot";
> +                               };
> +                               l2_alert1: trip-point@1 {
> +                                       temperature = <105000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +                               l2_crit: trip-point@2 {
> +                                       temperature = <120000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +
> +               apc0-cpu0-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <1000>;
> +                       thermal-sensors = <&tsens0 9>;
> +
> +                       trips {
> +                               cpu0_alert0: trip-point@0 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "hot";
> +                               };
> +                               cpu0_alert1: trip-point@1 {
> +                                       temperature = <105000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +                               cpu0_crit: trip-point@2 {
> +                                       temperature = <120000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +               };
> +       };
> +};
> --
> 2.21.0
>
