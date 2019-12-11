Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CDEC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 09:43:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D5512173E
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 09:43:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BEiRXRNt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbfLKJna (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 04:43:30 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42144 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728535AbfLKJna (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 04:43:30 -0500
Received: by mail-wr1-f66.google.com with SMTP id q6so1772183wro.9
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 01:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=z0QzLt7cguGjhYkQBQHVG6HhXU8NuMmHzTVdwtHS9ig=;
        b=BEiRXRNtnIBFjpCSBExLUGZx1Pa6SKsAtXeeJLD6W0NIrioRnhtiOEgMsi4ugdJ3zp
         QSz4GgMNADAajE9pqGigE9t7kXg8yQJn8TM4iG5K2aCTnKRPwWn7UTEzF3a77XnBSxgT
         9JE2grqONb42g6IFklDtyXxlEtrbdRdAQZkRTkXN+VULb9YNs4MsFIzC1v9S1at2bASB
         w6qdaGWc8SDPWo1Uk4S+4IxaK3s0DW4T8dtMxPlBlLziHdeozq+skjRn3dptiBgKm96t
         ffDDrYpcOA+HKEZEcdgbMK2sJwZJ0KEZk3T/SHXU7aCp3kncTv3eIfsNdJZUNiGiuJXO
         +QoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=z0QzLt7cguGjhYkQBQHVG6HhXU8NuMmHzTVdwtHS9ig=;
        b=qu0aFSCAgSeDv98+MYxQqBulSdHpkm49cIzjcSGq5FC++swtZckluBbv9OEPznEMlB
         RrxENlyaf7bvCuDrjhUTNo3/7BCwENypBNMLxZCPdZFVeyaf56XE9twOfz48fEA0AcI9
         0z/AVAN1symTD85NM1ZOkTLET2RSLhQcASE1NLG49IgY+vK+/Ktg/0Uen4Dkb5v8kzff
         WOtU6667x5zdkNK3TWAuTMPniTeCkOb6SV7pZlY40xQALxGocWXkgcO3lTrELMV0dpUW
         MRgfBp5O/v1PrrqvWg4XLFhjrtYJ4B6MHxADeSOaDYFtRfIDB1Wvlcw9bwCDD52IM+50
         Whlg==
X-Gm-Message-State: APjAAAU2m5EQjTwNPlJxvH1Kc3PlRi7QMVE/OhaHvYx+mhrYubjjZPN9
        v7St9upuhkxHr78bCt7EKi9gIQ==
X-Google-Smtp-Source: APXvYqyRpPjVZqQ6wK30FYYM+9G40xoHiGPwj/gyIyeDl0yqTe5vb7IVvt4aDak5sZieLFEduj9Sog==
X-Received: by 2002:adf:f3d0:: with SMTP id g16mr2843035wrp.2.1576057407844;
        Wed, 11 Dec 2019 01:43:27 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s25sm1586444wmh.4.2019.12.11.01.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 01:43:27 -0800 (PST)
References: <20191211070835.83489-1-jian.hu@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Jian Hu <jian.hu@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Chandle Zou <chandle.zou@amlogic.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: add A1 periphs and PLL clock nodes
In-reply-to: <20191211070835.83489-1-jian.hu@amlogic.com>
Date:   Wed, 11 Dec 2019 10:43:26 +0100
Message-ID: <1jimmnkxj5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Wed 11 Dec 2019 at 08:08, Jian Hu <jian.hu@amlogic.com> wrote:

> Add A1 periphs and PLL clock controller nodes, Some clocks
> in periphs controller are the parents of PLL clocks, Meanwhile
> some clocks in PLL controller are those of periphs clocks.
> They rely on each other.

> Compared with the previous series,
> the register region is only for the clock. So syscon is not
> used in A1.

Again, while this is valuable information for the maintainer to keep up,
it is not something that should appear in the commit description.

The evolution of your commit should be described after the '---'

Also, this obviously depends on another series. It should be mentioned
accordingly

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 26 +++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index 7210ad049d1d..de43a010fa6e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -5,6 +5,8 @@
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/a1-pll-clkc.h>
> +#include <dt-bindings/clock/a1-clkc.h>

When possible, please order the includes alpha-numerically

>  
>  / {
>  	compatible = "amlogic,a1";
> @@ -74,6 +76,30 @@
>  			#size-cells = <2>;
>  			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x1000000>;
>  
> +			clkc_periphs: periphs-clock-controller@800 {
                                             ^
From DT spec: "The name of a node should be somewhat generic, reflecting
the function of the device and not its precise programming model."

Here, an appropriate node name would be "clock-controller", not
"periphs-clock-controller"

> +				compatible = "amlogic,a1-periphs-clkc";
> +				#clock-cells = <1>;
> +				reg = <0 0x800 0 0x104>;
> +				clocks = <&clkc_pll CLKID_FCLK_DIV2>,
> +					<&clkc_pll CLKID_FCLK_DIV3>,
> +					<&clkc_pll CLKID_FCLK_DIV5>,
> +					<&clkc_pll CLKID_FCLK_DIV7>,
> +					<&clkc_pll CLKID_HIFI_PLL>,
> +					<&xtal>;
> +				clock-names = "fclk_div2", "fclk_div3",
> +					"fclk_div5", "fclk_div7",
> +					"hifi_pll", "xtal";
> +			};
> +
> +			clkc_pll: pll-clock-controller@7c80 {

Please order nodes by address when they have one.
This clock controller should appear after the uarts

> +				compatible = "amlogic,a1-pll-clkc";
> +				#clock-cells = <1>;
> +				reg = <0 0x7c80 0 0x21c>;
> +				clocks = <&clkc_periphs CLKID_XTAL_FIXPLL>,
> +					<&clkc_periphs CLKID_XTAL_HIFIPLL>;
> +				clock-names = "xtal_fixpll", "xtal_hifipll";
> +			};
> +
>  			uart_AO: serial@1c00 {
>  				compatible = "amlogic,meson-gx-uart",
>  					     "amlogic,meson-ao-uart";

