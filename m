Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AF6C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 14:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABF0F2072D
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 14:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IJQWeCoG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgHYOaY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 10:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgHYOaX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 10:30:23 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B82BC061574
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 07:30:22 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id a21so858046ejp.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 07:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=ZdXw+gzbskoX8H1mxygEd0s91nu0t19+/xojv0RSuX8=;
        b=IJQWeCoGzir8E9IhX9rAY/Bc6IeARVKlNiU9ZkBU0/0yibpLv4cjbyr96f1p0vhhHh
         Rv7YarCPFmu2TeTR2ztbxdtMw8cqE189SzCNEgyhVIdrsBhW3XO13PWgF+epl737p59v
         P80XdyjTHuP+/KyDzSK+FbAp3N84s3eIFk+NGFW/JaHGd6QDrbZBkMAbsTXCBKQqFlet
         Uw86hWEVV2y4TBWuSly7w6JPCQaSfpJHOluyE9rbWFSlJrlmFj6c5lIkbDnSJted85K9
         t8tIg4cHG3LxFSGbo3Urg+hhpSpWLg044N4qh9AWIRSMHHiZVmPdGAExEJmFmWl7KjJd
         g6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=ZdXw+gzbskoX8H1mxygEd0s91nu0t19+/xojv0RSuX8=;
        b=YGQ3RNv8FbRlzlwXEe+1Y82xG583/fBadkhDPqmDzInZt2mpIE0CLuuuToFsqtoYzk
         u+OKg6CFycJJJrDLQTPmgYKFxLRCfqcGiN6s/uoP+crAKm4qiXB1408Z92M+DLKWNa9/
         64j4/UW2YTL8u8Eaj0A4jd+rZYsvJKYXWrF9HrMV84t69JQAkFV8CVcNpHm3/PZNIJGh
         sFiP7TxfcgOzrKjb8nMTIptk5yoD0sh9AEskXj0mzNARMrV5AoBr/JWoYb/BlVpMecrL
         8+NAi/fRkWjmMSEp/BWhxYYXaS8HBeuTq2V4xltXqGijTteNa+FyY/8s6h+QhahttGL/
         KChg==
X-Gm-Message-State: AOAM5339UtbeC+ZG14ARFNyZl1IVUMn+NvMDtxue+am+J0/lHYp4ycBS
        stzsQbLfRdwNgxlBwyvFsaubEg==
X-Google-Smtp-Source: ABdhPJyv9q0WZs4EBQ9N2uAlkPmF7aGcdCaZUOfdv1FKhsKBZ811vlnQ9VKtvqi1WNIv1Io/39b50w==
X-Received: by 2002:a17:906:80d3:: with SMTP id a19mr11461547ejx.217.1598365821066;
        Tue, 25 Aug 2020 07:30:21 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id e14sm13266895edl.86.2020.08.25.07.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 07:30:20 -0700 (PDT)
References: <20200820121323.564-1-linux.amoon@gmail.com> <20200820121323.564-2-linux.amoon@gmail.com> <7hlfi9xgch.fsf@baylibre.com> <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com> <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com> <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com> <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com> <CANAwSgQ1Miu73hfdK+cgL3howpekn2xj_5qwGasQZwtQpSGj5Q@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
In-reply-to: <CANAwSgQ1Miu73hfdK+cgL3howpekn2xj_5qwGasQZwtQpSGj5Q@mail.gmail.com>
Date:   Tue, 25 Aug 2020 16:30:19 +0200
Message-ID: <1j4koq4x38.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Tue 25 Aug 2020 at 11:01, Anand Moon <linux.amoon@gmail.com> wrote:

> Hi Jerome
>
> On Mon, 24 Aug 2020 at 20:00, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Mon 24 Aug 2020 at 15:50, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> > On 24/08/2020 15:41, Anand Moon wrote:
>> >> hi All,
>> >>
>> >> On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
>> >>>
>> >>> Hi Kevin,
>> >>>
>> >>> Thanks for your review comments.
>> >>>
>> >>> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
>> >>>>
>> >>>> Anand Moon <linux.amoon@gmail.com> writes:
>> >>>>
>> >>>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
>> >>>>> support the RTC wakealarm feature for suspend and resume.
>> >>>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
>> >>>>> timer device to prevent it being assigned to /dev/rtc0
>> >>>>> which disto userspace tools assume is a clock device.
>> >>>>>
>> >>>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>> >>>>> Cc: Kevin Hilman <khilman@baylibre.com>
>> >>>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
>> >>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>> >>>>> ---
>> >>>>> Changes V3
>> >>>>> --Drop the INI GPIOAO.BIT7 pinctrl.
>> >>>>
>> >>>> Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
>> >>>> wakeup the system?  If so, this should be included as part of this
>> >>>> patch.
>> >>>>
>> >>>> It probably still works because the bootloader configures this GPIO as
>> >>>> input, but the kernel should not rely on the booloader for that, so
>> >>>> please include as part of this patch.
>> >>>>
>> >>>
>> >>> Ok I will figure out the correct pinctrl need for this settings.
>> >>> looking into the Odroid N2 schematics.
>> >>>
>> >>
>> >> I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.
>> >
>> >
>> > Simply add:
>> >
>> > interrupt-parent = <&gpio_intc>;
>> > interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
>> >
>> > to reflect the interrupt connection.
>
> I have tried this setting, but it is not working.
>
> [alarm@archl-on2e ~]$ dmesg| grep rtc
> [    5.378002] meson-vrtc ff8000a8.rtc: registered as rtc1
> [    5.942307] rtc-pcf8563 0-0051: pcf8563_write_block_data: err=-110
> addr=0e, data=03
> [    5.942316] rtc-pcf8563 0-0051: pcf8563_probe: write error
> [    5.945983] rtc-pcf8563: probe of 0-0051 failed with error -5
>

-110 is timeout ... either you i2c bus is broken and you device is not
at 0x51. In both case, it has nothing to do with the interrupt configuration

>
>> >
>> > No need to setup pinctrl here since the GPIO input is always connected
>> > to the gpio irq generator whatever pinctrl mode is set.
>>
>> It is actually better to setup pinctrl. Yes the irq controller can work
>> whatever the pin setup but if an output function is active it can mess with
>> what the irq controller gets.
>>
>> Think about applying/removing bias if necessary too.
>>
>
> Ok, I am trying to add a new pinctrl configuration for
> TSIN_A_DIN0 //  TDMB_FS // TDMB_SLV_FS
> But it's still not working at my end.

Either you are quite confused when it comes to pinctrl or I am.
TSIN and TDM have nothing to do with an i2c RTC.

>
> -Anand

