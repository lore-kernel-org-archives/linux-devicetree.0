Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C06C43331
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 12:24:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2AB5920737
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 12:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=verdurent-com.20150623.gappssmtp.com header.i=@verdurent-com.20150623.gappssmtp.com header.b="XsPDzoTQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390839AbgDCMYK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 08:24:10 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:36805 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728178AbgDCMYK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Apr 2020 08:24:10 -0400
Received: by mail-ua1-f66.google.com with SMTP id m15so1885718uao.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2020 05:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qvyI6Sc61lD8J/TKKLvSHBnJpLEYrXxRzZK/pmr8tcg=;
        b=XsPDzoTQ41hY6HEPrchkLgIyTyUZXd/7hYRk7hgYvAQyaCqqW4xvUi9ngh25hdOXoa
         yMhq7WafBQ0A/1ilm6nWz/kuM2yWawQ0gYIElHm8mgFSRx28aAGOOwj68xw/NpCRYwuh
         C2nWwWuGuwH47OMW7dHh2/NH59AbGExXVtK6+90BJdmf2L2esTgbo9pHe4i4cZF4rxiz
         fa9ejul7C23G7guipBlYt4Q7u872Vm0pgFUSHL9Z6KLTAfV3coPxeIblL3Yqk3miScsk
         jKF8SDgAbn9TMC+nwoi7bB4bTPpa63u9nsPQ1/+BDroRI4Fms+im2b1nC4z3mMu9UKUT
         Qd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qvyI6Sc61lD8J/TKKLvSHBnJpLEYrXxRzZK/pmr8tcg=;
        b=ikOnnuA55lbQpewRlg+ohPEvCHtbqNHsJWF0YVQ19rOQIjb442D/3heUDYeXf2NUH6
         5gUc2f4WYZJXSB/8/4SL8/c/j65x1Z/DdFnLjpAUkRArzfC86CRKmFpLHK8jWx88lsGc
         QQFZz87/s/FPFGrSCvXfcBwt2Bcor2colJNw5E9Se0NesUu1GOmw01KPZYRos2nw0r9V
         Q5CPK6ekDuWQu2x9uS4LuXq/3oIqXAHNSp+VTHk4Mbo1lsKu84pVd4s+t2kZcXSYlm7m
         oS8+XkgOjCLTTnzwYkyCaJkHm/S+EeSMTy5npZB1T/OqIk4OAoRgx8mcF7SWUjMfrvU8
         PAjw==
X-Gm-Message-State: AGi0PuavoDlZTnWV6NlNHulsU4zjEftlKUjkLK0GWbLYQmJn3nKYeBA8
        LLKR3Xq2yqnsnCAjLWKK2mXJPrVZAXQeXphX0DztuQ==
X-Google-Smtp-Source: APiQypI1u6fH2mX4s1RMnAvdrTdNNnWXLCWcnocYGW43VybN65NwGB9/DkXtVrPHM3u37UwkTy8EsjAY0aRPDloK43M=
X-Received: by 2002:ab0:911:: with SMTP id w17mr6133575uag.60.1585916649174;
 Fri, 03 Apr 2020 05:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <1585915404-7658-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1585915404-7658-1-git-send-email-Anson.Huang@nxp.com>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Fri, 3 Apr 2020 17:53:58 +0530
Message-ID: <CAHLCerOpgoL3_F6mg3i2d3Mnb81-4Y=+fkc_81+aWr3ut3GVEg@mail.gmail.com>
Subject: Re: [PATCH V4] arm64: dts: imx8mp: Add thermal zones support
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>,
        Horia Geanta <horia.geanta@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dl-linux-imx <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Apr 3, 2020 at 5:41 PM Anson Huang <Anson.Huang@nxp.com> wrote:
>
> i.MX8MP has a TMU inside which supports two thermal zones, add support
> for them.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>


Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
> Changes since V3:
>         - Drop some '0x' prefix;
>         - Add cpufreq cooling for soc thermal zone as well to fit the passive trip point.
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 74 +++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 9b1616e..77aff14 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/thermal/thermal.h>
>
>  #include "imx8mp-pinfunc.h"
>
> @@ -43,6 +44,7 @@
>                         clocks = <&clk IMX8MP_CLK_ARM>;
>                         enable-method = "psci";
>                         next-level-cache = <&A53_L2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 A53_1: cpu@1 {
> @@ -53,6 +55,7 @@
>                         clocks = <&clk IMX8MP_CLK_ARM>;
>                         enable-method = "psci";
>                         next-level-cache = <&A53_L2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 A53_2: cpu@2 {
> @@ -63,6 +66,7 @@
>                         clocks = <&clk IMX8MP_CLK_ARM>;
>                         enable-method = "psci";
>                         next-level-cache = <&A53_L2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 A53_3: cpu@3 {
> @@ -73,6 +77,7 @@
>                         clocks = <&clk IMX8MP_CLK_ARM>;
>                         enable-method = "psci";
>                         next-level-cache = <&A53_L2>;
> +                       #cooling-cells = <2>;
>                 };
>
>                 A53_L2: l2-cache0 {
> @@ -127,6 +132,68 @@
>                 method = "smc";
>         };
>
> +       thermal-zones {
> +               cpu-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <2000>;
> +                       thermal-sensors = <&tmu 0>;
> +                       trips {
> +                               cpu_alert0: trip0 {
> +                                       temperature = <85000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               cpu_crit0: trip1 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip = <&cpu_alert0>;
> +                                       cooling-device =
> +                                               <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                               <&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                               <&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                               <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +                               };
> +                       };
> +               };
> +
> +               soc-thermal {
> +                       polling-delay-passive = <250>;
> +                       polling-delay = <2000>;
> +                       thermal-sensors = <&tmu 1>;
> +                       trips {
> +                               soc_alert0: trip0 {
> +                                       temperature = <85000>;
> +                                       hysteresis = <2000>;
> +                                       type = "passive";
> +                               };
> +
> +                               soc_crit0: trip1 {
> +                                       temperature = <95000>;
> +                                       hysteresis = <2000>;
> +                                       type = "critical";
> +                               };
> +                       };
> +
> +                       cooling-maps {
> +                               map0 {
> +                                       trip = <&soc_alert0>;
> +                                       cooling-device =
> +                                               <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                               <&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                               <&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +                                               <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +                               };
> +                       };
> +               };
> +       };
> +
>         timer {
>                 compatible = "arm,armv8-timer";
>                 interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_LOW)>,
> @@ -215,6 +282,13 @@
>                                 gpio-ranges = <&iomuxc 0 114 30>;
>                         };
>
> +                       tmu: tmu@30260000 {
> +                               compatible = "fsl,imx8mp-tmu";
> +                               reg = <0x30260000 0x10000>;
> +                               clocks = <&clk IMX8MP_CLK_TSENSOR_ROOT>;
> +                               #thermal-sensor-cells = <1>;
> +                       };
> +
>                         wdog1: watchdog@30280000 {
>                                 compatible = "fsl,imx8mp-wdt", "fsl,imx21-wdt";
>                                 reg = <0x30280000 0x10000>;
> --
> 2.7.4
>
