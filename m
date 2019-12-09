Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4923DC00454
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 22:13:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E90F214AF
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 22:13:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FkEM7j7v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbfLIWNv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 17:13:51 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40768 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfLIWNv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 17:13:51 -0500
Received: by mail-pg1-f194.google.com with SMTP id k25so7802153pgt.7
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 14:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=yo0DBQP6olVYld+QqR40EIZ5CI+nDeXH2q0W73K+blw=;
        b=FkEM7j7vlMlRR5kkXg7Lw6n3otl6GTo1gNNix7MzWjYhwNXDX5VIbIhRkHtDakXNMN
         VOy6fpqHbaD7XOe2pxchZyHnaK7VMGuxaS6VJMBnFFR1RknopH1ZwExvX+hxzmiuSvHa
         lRUpxSAd1n+Djf8VFnHvJKnNjuXIK1iKbP/MGsDO38YcM+ziX1JAOA7l0ykkiuqxjpR/
         ii+k9csh4TQ6HIDkIbpzeTenjOu4sS2D1CYLNUqgQB3qBC3fs8OpHxbCqeUZGEk2z+wa
         rdwR0E9eubjgdtpInyV9ZuSIPtEEnuNuDIFGulim0khaqEzuAz7M608sVgkrAGJ7Re40
         z3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=yo0DBQP6olVYld+QqR40EIZ5CI+nDeXH2q0W73K+blw=;
        b=TCf0kYb2IaVBpIaB3gBsYhWuUSvXP8WPXOOSL7WDRf6581qdbFvPpNA5We7UlbVFYQ
         T4f8kqpIFxJjfmfMGNftuLlaWbEdULD07XMTLu3eMHTuulkFJcQA6sXUZxpmCwMu0JWd
         STsB1jsz3tKjrBXHhzgXOHaQ2JBGO2lf69kHO4XarfkRQwOS3VAOyNCmpbbHOtjk74En
         bweg0d6hJCJmiIukykCcHBbPcosHSQ9vdyYXM1Rbr8y2YTytKXP1Sbr6dQEafpKO2ihg
         voRfyBknFmBwrkJIhf9gCtWCpBnV3gcyW7mU2YsumzxgQ8IpyUyd87cvQO5h2N9Gomu9
         uUVw==
X-Gm-Message-State: APjAAAWqEC46+JlQLfnBfta3t4OPzr+mLyaT8g0cERigX4K9xMwAkcXu
        KPq/zHg7mzwyBfAmzcZusbyqoA==
X-Google-Smtp-Source: APXvYqznSmUwaFhrmZSWkKFtOvv3dESgDaEoltHBEfbR1FsrJQp0ICXI9xzzy4t1Ej6BfYNGIOHqmg==
X-Received: by 2002:a63:d901:: with SMTP id r1mr21047882pgg.328.1575929630414;
        Mon, 09 Dec 2019 14:13:50 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id j3sm477409pfi.8.2019.12.09.14.13.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 14:13:49 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        Rob Herring <robh+dt@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: meson: a1: add pinctrl controller support
In-Reply-To: <5fb2a7f9-bd5b-2ac2-0158-cae1ca743bf9@baylibre.com>
References: <1573819429-6937-1-git-send-email-qianggui.song@amlogic.com> <1573819429-6937-4-git-send-email-qianggui.song@amlogic.com> <5fb2a7f9-bd5b-2ac2-0158-cae1ca743bf9@baylibre.com>
Date:   Mon, 09 Dec 2019 14:13:49 -0800
Message-ID: <7hblshrvtu.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 15/11/2019 13:03, Qianggui Song wrote:
>> add peripheral pinctrl controller to a1 SoC
>> 
>> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> index 7210ad049d1d..0965259af869 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> @@ -5,6 +5,7 @@
>>  
>>  #include <dt-bindings/interrupt-controller/irq.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/gpio/meson-a1-gpio.h>
>>  
>>  / {
>>  	compatible = "amlogic,a1";
>> @@ -74,6 +75,23 @@
>>  			#size-cells = <2>;
>>  			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x1000000>;
>>  
>> +			periphs_pinctrl: pinctrl@0400 {
>> +				compatible = "amlogic,meson-a1-periphs-pinctrl";
>> +				#address-cells = <2>;
>> +				#size-cells = <2>;
>> +				ranges;
>> +
>> +				gpio: bank@0400 {
>> +					reg = <0x0 0x0400 0x0 0x003c>,
>> +					      <0x0 0x0480 0x0 0x0118>;
>> +					reg-names = "mux", "gpio";
>> +					gpio-controller;
>> +					#gpio-cells = <2>;
>> +					gpio-ranges = <&periphs_pinctrl 0 0 62>;
>> +				};
>> +
>> +			};
>> +
>>  			uart_AO: serial@1c00 {
>>  				compatible = "amlogic,meson-gx-uart",
>>  					     "amlogic,meson-ao-uart";
>> 
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.6 with Neil's tag.

Kevin
