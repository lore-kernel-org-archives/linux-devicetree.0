Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728C3C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 10:25:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F0D720674
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 10:25:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKS5CiYj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgHRKZz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 06:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgHRKZz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 06:25:55 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D67FC061389
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 03:25:55 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id u126so20536456iod.12
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2020 03:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zgNQdUHzF8dSuVSaU+C3ewro8dSYma23rzEUG9sMehY=;
        b=ZKS5CiYj3e/UXioFJ2eFJIzS3Dx5xjqimMKDtCCw+1PDnt2BV3C9wJdCqe94j3LVwk
         15WJ58m96jgfqFrCt+LHMHR74MT9GWQFQemwFrMRcXL0T1PHhfPzTemp/myoV1e/HuhC
         R1oIaYolr7xgePy+4AxlVxhyZXpuK9xMZ4z0emEeeJle2R8AgjVEOi0TiOZcZg7lKlRD
         ftVBsZkM0LAsCtyG54ph0D0Bv/mSI91rHzWhmT4PWuJe7wmo8n7siTgWF+nlFOEYTzez
         gvdfN9aePEGoSalN4DKMxNteFUPvU737joysw1KliSkO1xv3bgQYe+adAh2L6Ilegp2l
         l5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zgNQdUHzF8dSuVSaU+C3ewro8dSYma23rzEUG9sMehY=;
        b=IMDZ0zhyb/F+N8TDBNbl3NWngT24QGCN2WXYP3IahpaB/cE/Ta25VppZIN+5Rud7WM
         aa70CEzpL8J2QUQ2wVrRvu1OpkkmVTTKPzOGjdxWK/9dmnLgHGh1TC2UjqGa+W4aKrbn
         Y+zlgPXbk1//8r8VzD7Ih4poCqkXPu3abxjKaOCSxhTlJKiolEojAY+mj/Go1af+4yeU
         dpfNvyN52pMXcUEp/QTOlUuQjnMciPb14kpyUYhEUIczYduKD6SDBZn7QLoDROI5y7f4
         ofelDYf84NuSwUtxysbqXMK3MiABOHrKblpihVMqnfSsLEU0c5zHbLl2fLDrgZpZmJC5
         X8Ag==
X-Gm-Message-State: AOAM533qk/RlLs3ZUoBww/pdRvte+FrdxdZvMT+ByB+TflsNdFhvFbs2
        SChVkqpq4LVbJbBnMT7tWBJ2Z8pxbE5C1aSWXuw=
X-Google-Smtp-Source: ABdhPJzFOI9vNd7LzlXMLwcLhLc4bR4pD2Jeyh89ELFMK3se42heDlZ+wgkiyOxtRjkIGSjmvYRMMkHvstxLBk0TCTo=
X-Received: by 2002:a6b:fe0f:: with SMTP id x15mr15944348ioh.173.1597746354429;
 Tue, 18 Aug 2020 03:25:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200817102122.434-1-linux.amoon@gmail.com> <20200817102122.434-2-linux.amoon@gmail.com>
 <CAFBinCCYgm83Vs+dq6G4+1wv7T=S0mzt=gtLaHDfgBrCeRkk5A@mail.gmail.com>
 <CANAwSgTqAEyKFFan=opdF3MLtvkwj5MZ=oEizjeZNEfhL8ZzKA@mail.gmail.com>
 <CANAwSgTq+4KQJJLJPxV+afAYiqfpJ_JvwdJHn4sf5NVJgedbUQ@mail.gmail.com> <1j1rk4flh6.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j1rk4flh6.fsf@starbuckisacylon.baylibre.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Tue, 18 Aug 2020 15:55:44 +0530
Message-ID: <CANAwSgQwbAuHUnG1JwBQUxWJbn+MYwfhPSv=SH1g6+LLPKmsEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Martin, Jerome,

Thanks for your review comments.

On Tue, 18 Aug 2020 at 13:13, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> >> > >
> >> > > +&i2c3 {
> >> > > +       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> >> > > +       pinctrl-1 = <&tdm_c_din3_a_pins>;
> >
> > Note: without setting this *pinctrl-1* configuration RTC wake up
> > feature works as expected.
>
> As pointed out by Martin, the pinctrl-1 here makes no sense for RTC on
> i2c. If the rtc is on an I2C of AO bank, the pinctrl-0 is likely to be
> wrong as well.

Ok are you suggesting *I2C_AO_S0_SCL* and *I2C_AO_S0_SDA* pins.

+&i2c_AO {
+       status = "okay";
+       pinctrl-0 = <&i2c_ao_sck_pins>, <&i2c_ao_sda_pins>;
+       pinctrl-names = "default";
+
+       rtc@51 {
+               compatible = "nxp,pcf8563";
+               reg = <0x51>;
+               #clock-cells = <0>;
+       };
+};

But I get the following output with this configuration.

[root@archl-on2e ~]# dmesg | grep rtc
[    5.284632] rtc-pcf8563 0-0051: registered as rtc0
[    5.300148] rtc-pcf8563 0-0051: hctosys: unable to read the hardware clock

I also tried to move the my rtc nodes under i2c_AO, but I got the same result.

[root@archl-on2e ~]# dmesg | grep rtc
[    5.447423] rtc-pcf8563 0-0051: registered as rtc0
[    5.457465] rtc-pcf8563 0-0051: hctosys: unable to read the hardware clock

But as per the schematic RTC configured using GPIOA.BIT14 (SDA) and
GPIOA.BIT15 (SCL)
And with this configuration with i2c3 node RTC is getting configured correctly.

[root@archl-on2e ~]#  dmesg | grep rtc
[    5.240760] rtc-pcf8563 0-0051: registered as rtc0
[    5.243225] rtc-pcf8563 0-0051: setting system clock to
2020-08-18T10:23:04 UTC (1597746184)

Best Regards
-Anand
