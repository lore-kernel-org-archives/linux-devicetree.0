Return-Path: <SRS0=/Yzg=6L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA63C54FD0
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 09:06:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA2912064A
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Apr 2020 09:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Szjt1f5P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgD0JGb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Apr 2020 05:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgD0JGa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Apr 2020 05:06:30 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6109C0610D6
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2020 02:06:30 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k13so19600831wrw.7
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2020 02:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=EXiOJznWMubTqF2LbCKEgggZu2abecXwqnF4vnIGgUs=;
        b=Szjt1f5Pa/pEX5/hdAOy3hyklXSuFgdWqjESFkmFUQCwR/ajegBnINlZ+TC2x4jE1b
         HyOJR/fENBP1p2pYGwGLEQkMTwkpUKuuKKQyYkLEai7B+mVqm2VZ4MKTu3WWgnbTBg5c
         tgdjdWQ60glhnwf3mDSATogH90ab3Q7Sj6GH322jCRcnQB6Vz1g9U290HP4zVSMPwjFe
         kW633A9jC2rwOCiyPbhxtbwmI3XtTsTwDVF6PmRNnFGFupRdsNfZHxEVf0L9wOLYuRFe
         YQlIe9g4mGfgmjGv4fdjESnV/Jh86F6g8arR0o+P9RikVCR9I7OIUf520oyvjRW6pmx9
         pT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=EXiOJznWMubTqF2LbCKEgggZu2abecXwqnF4vnIGgUs=;
        b=TTSq0Az6S43iAMkJgjv+CvA+jBJePeQYGloGRMyRU/k/5ICX1lzNbbvNuTa+sJmVK+
         2na9+1+fmrTazwBEdlXVmYC8+4xfW+unLGrW8ILokR9Qo2mVW6SoQ0bhR+81toO/KIOp
         4u/yJa6SHUdDpWEMv6rrcskzKsiRqpVH6iJ7AJ2+2gpihhL1KVum5O47iZ865nI3k27R
         d09KRIoQGzWxdjYI8MrKv3vC1cT28izFRmkLFpPOezfG3tya2kQx8+370U/jgV1/vQe+
         w9E1uk1hPNHGQAdvTsnJPkmHWdyFbb/zaM215JUV0l4ZV+IcNZSWa1kAIixXGasxZJro
         SO+Q==
X-Gm-Message-State: AGi0PubWaTdIEWmGF/5Kvj62wyMuZETcqvEZCk5CPWW9kkOZLvTfo1jc
        zciS1zQLm2QQxOgKbhUfZEl9vQ==
X-Google-Smtp-Source: APiQypIQADqchVvUy79IlzNIYW/NgJbl0oE8RqheoxfGsqEOx3xtmDmr84gLPNKda+4a0GA4kvQOoA==
X-Received: by 2002:adf:afdf:: with SMTP id y31mr26004385wrd.120.1587978389304;
        Mon, 27 Apr 2020 02:06:29 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id s12sm14045158wmc.7.2020.04.27.02.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 02:06:28 -0700 (PDT)
References: <20200426162119.GA23268@imac>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     elatllat@gmail.com
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        joy.cho@hardkernel.com, narmstrong@baylibre.com,
        khilman@baylibre.com, christianshewitt@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        tobetter@gmail.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] arm64: dts: meson: S922X: extend cpu opp-points
In-reply-to: <20200426162119.GA23268@imac>
Date:   Mon, 27 Apr 2020 11:06:27 +0200
Message-ID: <1ja72x2t7w.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Sun 26 Apr 2020 at 18:21, Tim Lewis <elatllat@gmail.com> wrote:

> Add extra cpu pop points to allow mild overclock on S922X. The opp
> points are found in Hardkernel N2 sources [1] and testing shows no
> obvious issues on other S922X devices. Thermal throttling should
> keep things in-check if needed.

The Odroid-N2 has a massive heatsink mounted.
Do we have any idea if this applies (is safe) on any other S922x
device ?

It would be nice to get some input (review) from Amlogic is this to
included for any devices using the SoC.

In the meantime, I think this should be applied to odroid-n2 dt only.

>
> [1] https://github.com/hardkernel/linux/commit/f86cd9487c7483b2a05f448b9ebacf6bd5a2ad2f
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Tim Lewis <elatllat@gmail.com>
>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi | 15 +++++++++++++++
>  1 files changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> index 046cc332d..1e5d0ee5d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi
> @@ -65,6 +65,11 @@
>  			opp-hz = /bits/ 64 <1896000000>;
>  			opp-microvolt = <981000>;
>  		};
> +
> +		opp-1992000000 {
> +			opp-hz = /bits/ 64 <1992000000>;
> +			opp-microvolt = <1001000>;
> +		};
>  	};
>  
>  	cpub_opp_table_1: opp-table-1 {
> @@ -120,5 +125,15 @@
>  			opp-hz = /bits/ 64 <1704000000>;
>  			opp-microvolt = <891000>;
>  		};
> +
> +		opp-1800000000 {
> +			opp-hz = /bits/ 64 <1800000000>;
> +			opp-microvolt = <981000>;
> +		};
> +
> +		opp-1908000000 {
> +			opp-hz = /bits/ 64 <1908000000>;
> +			opp-microvolt = <1022000>;
> +		};
>  	};
>  };

