Return-Path: <SRS0=bipS=ZI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2D1C43141
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 09:53:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1049A2073B
	for <linux-devicetree@archiver.kernel.org>; Sat, 16 Nov 2019 09:53:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbfKPJxK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 16 Nov 2019 04:53:10 -0500
Received: from mx2.suse.de ([195.135.220.15]:53118 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727115AbfKPJxK (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 16 Nov 2019 04:53:10 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id C468AAE03;
        Sat, 16 Nov 2019 09:53:08 +0000 (UTC)
Subject: Re: [RFC PATCH 2/2] Add support for Videostrong KII Pro tv box
To:     Mohammad Rasim <mohammad.rasim96@gmail.com>
References: <20191115165026.19376-1-mohammad.rasim96@gmail.com>
 <20191115165026.19376-3-mohammad.rasim96@gmail.com>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Cc:     Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Message-ID: <6fa93c06-ecab-c8da-32c4-db40533c09ec@suse.de>
Date:   Sat, 16 Nov 2019 10:53:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191115165026.19376-3-mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Am 15.11.19 um 17:50 schrieb Mohammad Rasim:
> This patch adds support for the Videostrong KII Pro tv box which is based on the gxbb-p201 reference design
> 
> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>  .../boot/dts/amlogic/meson-gxbb-KII-Pro.dts   | 25 +++++++++++++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-KII-Pro.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 84afecba9ec0..1d72e93691f2 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-p200.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-p201.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-KII-Pro.dtb

Lowercase: -kii-pro.dtb
And please sort alphabetically.

>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-meta.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-vega-s95-telos.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-KII-Pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-KII-Pro.dts
> new file mode 100644
> index 000000000000..e79d75bfa8dd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-KII-Pro.dts
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + */

What is this? :) You may want to add a copyright here.

> +
> +/dts-v1/;
> +
> +#include "meson-gxbb-p201.dts"

This is rather unusual, normally you would include the SoC's .dtsi, not
another board.

> +
> +/ {
> +	compatible = "Videostrong,KII-Pro","amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";

This is not a valid vendor prefix (undefined, should be lowercase), same
for the compatible string, which should be lowercase as all others.

Please run ./scripts/checkpatch.pl, which would warn you of such issues.

Also a space missing after comma.


> +	model = "Videostrong KII Pro";

Here you can spell it the original way, like you did.

> +
> +
> +};
> +
> +&uart_A {
> +	status = "okay";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";
> +	uart-has-rtscts;

Leave an empty line here for spacing.

> +	bluetooth {
> +		compatible = "brcm,bcm4335A0";
> +		shutdown-gpios = <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
> +	};
> +};

Regards,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
