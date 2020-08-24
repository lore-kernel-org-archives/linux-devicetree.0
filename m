Return-Path: <SRS0=8UcW=CC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8E9C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 14:30:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE3AF2071E
	for <linux-devicetree@archiver.kernel.org>; Mon, 24 Aug 2020 14:30:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="L0s0KaAK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgHXOao (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 24 Aug 2020 10:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgHXOan (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 24 Aug 2020 10:30:43 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896BFC061573
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 07:30:43 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id h15so2169255wrt.12
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2020 07:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=RHuBLgC0m+LUiNwXMCDSGu7Z90iRqwpC4kBmEQcAFEk=;
        b=L0s0KaAKzKwULpNbDdSiI9Q3TRXfy00ZIao1905z6D4bKbTqFwNrUTg+B0AQH3dsIr
         e22hXrwQ/mUBRQIPcEJGJCtUNXGjee0uIF8tBuYsR5A7H2NWnQuk9PtIzT5G7DlxOumJ
         H9DtDu56rTXVInVsgHPqulRMJ3BdmDMN0M2p79zsnNoCxEvOfE20Wf3XKf+XL9etUtt9
         t5eOUfdzUomowEG977CMEp9qBGUJjromG1+ONs8QZaCRGhN0+gzUMRm9FNYEvR5U/A0F
         ndmkZtr2jvYrz4QNMp73Co4oY8JlODx/Bq1at2aHuXhNAntcv59TcZumdpqBK/UkSs/m
         aOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=RHuBLgC0m+LUiNwXMCDSGu7Z90iRqwpC4kBmEQcAFEk=;
        b=unv6ZrkqN2NdO6wuzonXYihoXhG9o1W2CkgV3YSldS9x3+n+zcfqyZzQTCgCwLO41Z
         SvTCLnf99byA19QA3wrX6O1JyMpFabbqGqmhOso3o+lFavhoGaprxbtfO2h01amitOps
         EljB2O3zRJ4M/BUUA5i47C3mgot9G4I5KO7/lZLOLG3LAdPoa6Qwh0a3HYnA7Yr3C59v
         ZNkfP6ea/FVJhvCx755s4Zfriy9YapVntOhFkXuv6Wy9dmafJ/n8b6T6W6FpgwQkRAwr
         xlLYCk5kGUtq0nrrtOgw7wITObe7S6tpAWLvaIbXLJ1DydFXh8z119u8Ql/jRp2YleL7
         tH3Q==
X-Gm-Message-State: AOAM5309Hux5m9ZPN6zIX0DFanZaTHRQ+sDa5/83qrdSSCI4zMZvwNaw
        uwmtXd4APL/SWpTVOUHEhS39qw==
X-Google-Smtp-Source: ABdhPJyntYozy+eUWWxM9WVIe9x6/Pwd+iThG/oXBKu5qtdzRPHghDUR5kEkyemUzw0ZfVo4uLm6mg==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr5989121wro.43.1598279442159;
        Mon, 24 Aug 2020 07:30:42 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o125sm26178299wma.27.2020.08.24.07.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 07:30:41 -0700 (PDT)
References: <20200820121323.564-1-linux.amoon@gmail.com> <20200820121323.564-2-linux.amoon@gmail.com> <7hlfi9xgch.fsf@baylibre.com> <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com> <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com> <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Anand Moon <linux.amoon@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC controller node
In-reply-to: <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
Date:   Mon, 24 Aug 2020 16:30:41 +0200
Message-ID: <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Mon 24 Aug 2020 at 15:50, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 24/08/2020 15:41, Anand Moon wrote:
>> hi All,
>> 
>> On Fri, 21 Aug 2020 at 10:13, Anand Moon <linux.amoon@gmail.com> wrote:
>>>
>>> Hi Kevin,
>>>
>>> Thanks for your review comments.
>>>
>>> On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
>>>>
>>>> Anand Moon <linux.amoon@gmail.com> writes:
>>>>
>>>>> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
>>>>> support the RTC wakealarm feature for suspend and resume.
>>>>> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
>>>>> timer device to prevent it being assigned to /dev/rtc0
>>>>> which disto userspace tools assume is a clock device.
>>>>>
>>>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>>>> Cc: Kevin Hilman <khilman@baylibre.com>
>>>>> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
>>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>>>> ---
>>>>> Changes V3
>>>>> --Drop the INI GPIOAO.BIT7 pinctrl.
>>>>
>>>> Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
>>>> wakeup the system?  If so, this should be included as part of this
>>>> patch.
>>>>
>>>> It probably still works because the bootloader configures this GPIO as
>>>> input, but the kernel should not rely on the booloader for that, so
>>>> please include as part of this patch.
>>>>
>>>
>>> Ok I will figure out the correct pinctrl need for this settings.
>>> looking into the Odroid N2 schematics.
>>>
>> 
>> I am trying to map the RTC INT pinctrl, ie RTC INT GPIOAO.BIT7.
>
>
> Simply add:
>
> interrupt-parent = <&gpio_intc>;
> interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
>
> to reflect the interrupt connection.
>
> No need to setup pinctrl here since the GPIO input is always connected
> to the gpio irq generator whatever pinctrl mode is set.

It is actually better to setup pinctrl. Yes the irq controller can work
whatever the pin setup but if an output function is active it can mess with
what the irq controller gets.

Think about applying/removing bias if necessary too.

>
> Neil
>
>> 
>> So from the schematics it is seen below.
>> RTC INT  GPIOAO_7 (AV46)   GPIOAO_7 (JTAG_A_TMS // TSIN_A_DIN0 //
>> TDMB_FS // TDMB_SLV_FS)
>> 
>> But the S922X datasheet this pin *AV46* shows to following settings,
>> AN16    DVSS    AV46      GPIOAO_7    BD19    BOOT_11
>> 
>> From the schematics it BOOT_11 is linked to
>>               BOOT_11 (NAND_CE0)      BD19
>> 
>> So can I conclude that BOOT_11 (nand_ce0_pins) pin linked to the RTC INT setting
>> Please can somebody help me with correct pinctrl settings.
>> 
>> Best Regards
>> -Anand Moon
>> 

