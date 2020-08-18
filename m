Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739B8C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 07:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B6CC207FB
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 07:45:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lP1zPxrP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgHRHpF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 03:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgHRHpE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 03:45:04 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E2C3C061389
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 00:45:04 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id d6so20906903ejr.5
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 00:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=F9fOoRA9pJZPPsu0jJzLDURp0h2hTxmM73TFlf3VuwA=;
        b=lP1zPxrPZ/NsOHtDvabu13+OQG04WjHKR2fWQb6Wrx55QKqdtsBUcW8EGi594pDhEa
         NQMztuw8LhxWSmEY/o24kwy7pfjwSHCSz3L/uO5kTsHl3dqP+ijGsdlo3QQNLpzQ2pPo
         lT/hjfwq2L0vT7r0/3rbP8NNjGaKHsBc8+P73vrjtZx3XBb6SuH4dW39u+213hoaGcq8
         HBWE/S5OCavaqFIgazToH1qQIuZdHHfZs3ITOoxXZ+nrUUBe0vMPvB1qH3G6PH0oqqCy
         Kv/7/8fsCJSmw60kHaEGKFTg1L4oOKBIQNuHcHQLIkGxGR2O3DOeHlCgVqv0J/Z45QEn
         izYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=F9fOoRA9pJZPPsu0jJzLDURp0h2hTxmM73TFlf3VuwA=;
        b=ZKCb9Pd6vYhmhbOHt4DHtDwHalMTeuBJNcsp/8yXZ52tgIZbGZQUhkM2DDdMvasglw
         kKVEoQTvb1UNDISdB7B0tOXtUqTYZEtyy+yr1hgmozOmLZw16de90Cy3MsuTSNo9u5Th
         9ErlNyxOhYP1SVS5/Hj9dgnALakCV6I6chTh/+G8+g/Gth6JGRiRR705X3QpgttfoMdp
         CoRgvp0Ko0yPfTSPaprAnYIeszaR9WoZrlpXUuUq9g8/7OTO5ksqWwJRUoav5L8VtjSG
         P2kK2etWf5RP0mWb9gHyC9XUzYHX6UIjc22Tn2wdw7qbT8+cGdW8JHHdTU3qWRK2Chi7
         EaLA==
X-Gm-Message-State: AOAM533UAafQXrWvMxjumNbj/XWbLgDgdprRTFzSUOE95DBhobdZGVG1
        QNR1pgnUG+sa/OyiCROClDTZHg==
X-Google-Smtp-Source: ABdhPJzs/NEYfJqQIrV9qA0eRmM4MAKKamlMOkvCW+p1dOvvMwgBytrHgCCPAwYNJGw67ShMuKzI/Q==
X-Received: by 2002:a17:906:1604:: with SMTP id m4mr18317054ejd.6.1597736703062;
        Tue, 18 Aug 2020 00:45:03 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id sb9sm16351802ejb.90.2020.08.18.00.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 00:45:02 -0700 (PDT)
References: <20200817102122.434-1-linux.amoon@gmail.com> <20200817102122.434-3-linux.amoon@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: meson-g12b-odroid-n2: Disable virtual RTC driver
In-reply-to: <20200817102122.434-3-linux.amoon@gmail.com>
Date:   Tue, 18 Aug 2020 09:45:01 +0200
Message-ID: <1jzh6se6te.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Mon 17 Aug 2020 at 12:21, Anand Moon <linux.amoon@gmail.com> wrote:

> Disable virtual RTC node on Odroid N2,
> since RTC PCF8563 support rtc wakeup.
>
> [    7.171149] meson-vrtc ff8000a8.rtc: registered as rtc0
> [    7.182875] meson-vrtc ff8000a8.rtc: setting system clock to 1970-01-01T00:00:07 UTC (7)
>

Maybe I'm missing something but why should disable this ?
Can't the 2 RTCs co-exist ?

> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Changes v2
> --Fix the subject and commit message.
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> index f08ae1b337ad..7fb952a2a35e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> @@ -642,3 +642,7 @@ &usb2_phy1 {
>  	/* Enable the hub which is connected to this port */
>  	phy-supply = <&hub_5v>;
>  };
> +
> +&vrtc {
> +	status = "disabled";
> +};

