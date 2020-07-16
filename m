Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D784C433E8
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:09:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 392B320657
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 08:09:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cZ5RxiL/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgGPIJG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 04:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgGPIJA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 04:09:00 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AEAC08C5CE
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 01:09:00 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k6so6054645wrn.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 01:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=jhULUF+x2vcXvW/jUomFav+ORqgbARKcOMlyJFwZDX8=;
        b=cZ5RxiL/5ONw1GCcNgBN6c81UUACzDib8nIbXx00FfE+wnQUEVXGZ+VDqTDgwgLezp
         jocMVNFBi9M/eQgGk8MPQqWgaNCfFyTrXmd2eEaSdIqzd6TdjExKhF0Lp8y6Y2iOaft0
         1twosnPUNvSLKHtUkrzrC6Opb9n5c1rO7vrnT5IBqHJI/NHm1Z4H1vmUtGpVYyYn3QG2
         zCy8ZRkxuN0OfHLBMNbB3VRRTca9sEKtPGAkJMITE0DHic2otYjPWYHbAD4yPZRymMjt
         3lGZfl3vWrRxotDMt0FiToUw1i0MaatXChin+XfA4dmyGGS/XPhyVkT4gCRUY312/kqm
         qDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=jhULUF+x2vcXvW/jUomFav+ORqgbARKcOMlyJFwZDX8=;
        b=AbeNfp+Ufe5rRGUWoX4gNcSJG+imMGAmZg5JtiNpU1WU6iHX/M/2Y7x2XMlHRKl+ra
         ZIg5h0AHu8x2ueUGKQOBRCBODah4qWxz/SjnSAXgUvyQvVFA8O1vcc62d6SnmeAjssfC
         TydhBz6l4UGWbZ1/AXJughWvbAC0Vw6uoNn1oRf/hmn/wQhs3IxdHRoumpGeV+4WPhyu
         wfGP+vsQVOSBI4uIFd4v7k5kAgpuypRdygiGsESIQX3Hpg9A15Pn7g9JvAVHN+sfUKEn
         2saHqTSpWLUeLzWdHjr3uytzqUUzkf0THyaAqFbGcqIGezQH4fhgkOysDcW+IdtBsFdk
         RckQ==
X-Gm-Message-State: AOAM532YmfpbOVoqNcbr1Cku2j/CNx4NyLvzmRMlwR7Adogd19q9J7p9
        rPIMT/MD6s1I4bwiaPrCnhN0Bw==
X-Google-Smtp-Source: ABdhPJyHFwArR0lFRh+NQ73ElhRk6hFXaCF8nj8MBazu7YOMsgCsc3bh+VSwR5PfXDHz7D1HxBvJng==
X-Received: by 2002:adf:cc85:: with SMTP id p5mr3765145wrj.273.1594886939056;
        Thu, 16 Jul 2020 01:08:59 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id g82sm7023292wma.37.2020.07.16.01.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 01:08:58 -0700 (PDT)
References: <20200715160209.652-1-linux.amoon@gmail.com> <20200715160209.652-2-linux.amoon@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCHv1 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
In-reply-to: <20200715160209.652-2-linux.amoon@gmail.com>
Date:   Thu, 16 Jul 2020 10:08:57 +0200
Message-ID: <1j1rlbg9uu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Wed 15 Jul 2020 at 18:02, Anand Moon <linux.amoon@gmail.com> wrote:

> Enable RTC PCF8563 node on Odroid-N2 SBC, In order
> to support the RTC wakealarm feature for suspend and resume.
>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> $ sudo hwclock -r && date
> 2020-07-15 13:11:53.862508+00:00
> Wed Jul 15 13:11:54 UTC 2020
>
> $ hwclock --show
> 2020-07-15 13:17:30.903300+00:00
>
> But RTC wake up is not working at my end.
> Any inputs are welcome.
>
> $ time rtcwake -s 30 -m mem
> rtcwake: /dev/rtc0 not enabled for wakeup events
>
> real    0m0.002s
> user    0m0.002s
> sys     0m0.000s
> ---
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> index 169ea283d4ee..a447cba4dd53 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> @@ -391,6 +391,20 @@ hdmi_tx_tmds_out: endpoint {
>  	};
>  };
>  
> +&i2c3 {
> +	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	rtc: rtc@51 {
> +		reg = <0x51>;
> +		compatible = "nxp,pcf8563";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "rtc_clkout";
> +	};

This rtc being on a connector, optional and not fitted by default,
should it really be enabled for all odroid-n2 ?

We tend not do that usually

> +};
> +
>  &ir {
>  	status = "okay";
>  	pinctrl-0 = <&remote_input_ao_pins>;

