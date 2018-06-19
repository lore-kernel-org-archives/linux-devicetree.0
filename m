Return-Path: <SRS0=0B+L=JF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:45289 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753762AbeFSWqB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Jun 2018 18:46:01 -0400
MIME-Version: 1.0
References: <20180519204808.28899-1-aford173@gmail.com>
In-Reply-To: <20180519204808.28899-1-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 19 Jun 2018 17:45:49 -0500
Message-ID: <CAHCN7xJ2ddUxeN=62FrhhE4VRyieNQYawXrzdfK0oHHEJocSAw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: am3517-evm: Remove unnessary PMIC parameters
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: linux-omap@vger.kernel.org
Cc: devicetree <devicetree@vger.kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Derald Woods <woods.technical@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Sat, May 19, 2018 at 3:48 PM Adam Ford <aford173@gmail.com> wrote:
>
> The AM3517-EVM uses a TPS65023 PMIC.  This is already defined
> by:  compatible = "ti,tps65023"
>
> There doesn't seem to be a need to have each regulator in the
> PMIC with the 'compatible = "regulator-fixed"' since each
> regulator has a min and max setting.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
>

Gentle nudge

adam
> diff --git a/arch/arm/boot/dts/am3517-som.dtsi b/arch/arm/boot/dts/am3517-som.dtsi
> index a6d5ff73c163..7ff7cd135dca 100644
> --- a/arch/arm/boot/dts/am3517-som.dtsi
> +++ b/arch/arm/boot/dts/am3517-som.dtsi
> @@ -64,7 +64,6 @@
>                 regulators {
>                         vdd_core_reg: VDCDC1 {
>                                 regulator-name = "vdd_core";
> -                               compatible = "regulator-fixed";
>                                 regulator-always-on;
>                                 regulator-min-microvolt = <1200000>;
>                                 regulator-max-microvolt = <1200000>;
> @@ -72,7 +71,6 @@
>
>                         vdd_io_reg: VDCDC2 {
>                                 regulator-name = "vdd_io";
> -                               compatible = "regulator-fixed";
>                                 regulator-always-on;
>                                 regulator-min-microvolt = <3300000>;
>                                 regulator-max-microvolt = <3300000>;
> @@ -80,7 +78,6 @@
>
>                         vdd_1v8_reg: VDCDC3 {
>                                 regulator-name = "vdd_1v8";
> -                               compatible = "regulator-fixed";
>                                 regulator-always-on;
>                                 regulator-min-microvolt = <1800000>;
>                                 regulator-max-microvolt = <1800000>;
> @@ -88,7 +85,6 @@
>
>                         vdd_usb18_reg: LDO1 {
>                                 regulator-name = "vdd_usb18";
> -                               compatible = "regulator-fixed";
>                                 regulator-always-on;
>                                 regulator-min-microvolt = <1800000>;
>                                 regulator-max-microvolt = <1800000>;
> @@ -96,7 +92,6 @@
>
>                         vdd_usb33_reg: LDO2 {
>                                 regulator-name = "vdd_usb33";
> -                               compatible = "regulator-fixed";
>                                 regulator-always-on;
>                                 regulator-min-microvolt = <3300000>;
>                                 regulator-max-microvolt = <3300000>;
> --
> 2.17.0
>
