Return-Path: <SRS0=iTj2=B4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626E1C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 05:10:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CF582076E
	for <linux-devicetree@archiver.kernel.org>; Tue, 18 Aug 2020 05:10:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF+kmdUd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgHRFKT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 18 Aug 2020 01:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgHRFKR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Aug 2020 01:10:17 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D05C061389
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 22:10:16 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id b16so20006833ioj.4
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2020 22:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dDeuI2at4DUnP5ePYzs4nh4EYYaqUTPmHOeGx+LVl8c=;
        b=lF+kmdUdd834Mkv9Nobn/W7Ww3ZsZFCdqIW0uWFWan/uei+LuYY2Azljs52L6GN46g
         +CM59rYvJBcvgnyi+IZre5Jqf9x69UeMaUO8LLJvwWPaCj1TbTrXL0cPywWr61VEOMQm
         DogPx+HLT8TuUsalQNCX44Q4WSpwtZWPzYeqnyJrS31TbB3dQ6akMrDTvO5+pkXSB0jo
         7PqPBJ+hC2qH2l2boMIT+fl+slhHq0bfeil9NiCrV9reOwMJezbUkArVq8DadcHipLHE
         FsJRgqqotGrV71uwJ0em1+zCGJh/ZLhgG3OmEMRPI4OMcPFPFX7HF5QKQzAEIYT5fkq3
         p9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dDeuI2at4DUnP5ePYzs4nh4EYYaqUTPmHOeGx+LVl8c=;
        b=b2/qhdTNBYvM0z/nhVAwxfRnQE7/fcJ5ZKrj7bZfw095ojY+0br6SW02OeAfAsDf2e
         PUtcLWzofIMpo9vsCNxn5NV7fXDgL4bTCP1MOp6tUn9Oi/o71S5qmQ3aNMRQXjjCDc95
         oq26RFk2y5FwmWvz4w4Yur7Q3AB3KeJA5YjpDbu5wUM470wBO5yjF38X5eJ697+0VD/y
         qOZlZ12Du3dDr1yuLGaom7In0lh9mdkOlI/OHjYG7SdPO1yK5+wNzPf1tweGNUF0cmth
         g9dFOkJ5THRG4P2G9nzHioCc8IO1b/e/K3mT0BqaKChbl5WPrO4XZIDOwriQPJ1eeNYt
         bHrQ==
X-Gm-Message-State: AOAM530lX4lsoY6wo2ZiE7ZWlx2y/fgjkx9GpuTGiyh6JCrh+VpyQW46
        zSWAMiVyK9ZJ102ZEaUH7WovW14NmiDi2S+bxmw=
X-Google-Smtp-Source: ABdhPJzlUMXFreLoLp9ldnImjq6T5h9bRsmZOZhfAkQQJ1NbB9rXaoytPT1YBx+ICz0ihvTUdkDmvHu+ioxe/BknC9M=
X-Received: by 2002:a6b:f801:: with SMTP id o1mr14969666ioh.43.1597727416068;
 Mon, 17 Aug 2020 22:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200817102122.434-1-linux.amoon@gmail.com> <20200817102122.434-2-linux.amoon@gmail.com>
 <CAFBinCCYgm83Vs+dq6G4+1wv7T=S0mzt=gtLaHDfgBrCeRkk5A@mail.gmail.com> <CANAwSgTqAEyKFFan=opdF3MLtvkwj5MZ=oEizjeZNEfhL8ZzKA@mail.gmail.com>
In-Reply-To: <CANAwSgTqAEyKFFan=opdF3MLtvkwj5MZ=oEizjeZNEfhL8ZzKA@mail.gmail.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Tue, 18 Aug 2020 10:40:06 +0530
Message-ID: <CANAwSgTq+4KQJJLJPxV+afAYiqfpJ_JvwdJHn4sf5NVJgedbUQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Martin,

On Tue, 18 Aug 2020 at 08:33, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin,
>
> Thanks for your review comments .
>
> On Tue, 18 Aug 2020 at 01:06, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Anand,
> >
> > thank you for updating this patch!
> >
> > On Mon, Aug 17, 2020 at 12:21 PM Anand Moon <linux.amoon@gmail.com> wrote:
> > [...]
> > > changes v2
> > > --Fix the missing INT (GPIOA.BIT7) pinctrl.
> > should I also expect an interrupt property somewhere below?
> >
> > > --Fix the missing rtcwakeup.
> > > --Drop the clock not required clock property by the PCF8563 driver.
> > > ---
> > >  .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > > index 34fffa6d859d..f08ae1b337ad 100644
> > > --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > > +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> > > @@ -477,6 +477,19 @@ hdmi_tx_tmds_out: endpoint {
> > >         };
> > >  };
> > >
> > > +&i2c3 {
> > > +       pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
> > > +       pinctrl-1 = <&tdm_c_din3_a_pins>;

Note: without setting this *pinctrl-1* configuration RTC wake up
feature works as expected.

> > > +       pinctrl-names = "default";
> > why is there pinctrl-1 without any corresponding "pinctrl-names" entry?
> > also I'm surprised to see a TDM (audio) related pin function as part
> > of an I2C controller. if this is correct then I'd appreciate a bit
> > information (for example as part of the patch description) why that is
> >
> >
> > Martin
>
> Opps, I could not figure the difference between GPIOA_7 and GPIOAO_7 pins
> I will try to figure out the correct configuration pin for this node.
>
> Best Regards
> -Anand

I see from the schematics [0] odroid-n2_rev0.4_20190307.pdf section S905D2  IO.
Following pin configuration is used for RTC
RTC    GPIOAO_7(JTAG_A_TMS//TSIN_A_DIN0//TDMB_FS//TDMB_SLV_FS)

As per the data sheets [1] S922X_Public_Datasheet_V0.2.pdf  following
are the pin funtion description.

JTAG_A_TMS                       DI                 JTAG Test mode
select input channel A
TSIN_A_DIN0                       DI                 Serial TS input port A data
TDMB_FS                            DO               Frame sync output
of TDM port B (Word clock of I2S)
TDMB_SLV_FS                    DI                 Frame sync input of
TDM port B (Word clock of I2S)

But I dont observe this configration is linked to the RTC INT (GPIOAO.BIT7) pin.
Without setting the *pinctrl-1*  rtc is getting registeed correcly and
suspend / resume feature is also working correcly see below.

[root@archl-on2e ~]# dmesg | grep rtc
[    5.269079] rtc-pcf8563 0-0051: registered as rtc0
[    5.270948] rtc-pcf8563 0-0051: setting system clock to
2020-08-18T04:52:26 UTC (1597726346)
[root@archl-on2e ~]#
[root@archl-on2e ~]#
[root@archl-on2e ~]# rtcwake -s 30 -m mem
rtcwake: assuming RTC uses UTC ...
rtcwake: wakeup from "mem" using /dev/rtc0 at Tue Aug 18 05:06:05 2020
[  793.341957] PM: suspend entry (deep)
[  793.342292] Filesystems sync: 0.000 seconds
[  793.649621] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  793.652309] OOM killer disabled.
[  793.655514] Freezing remaining freezable tasks ... (elapsed 0.001
seconds) done.
[  793.666584] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
[  793.686014] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  793.778908] Disabling non-boot CPUs ...
[  793.783712] CPU1: shutdown
[  793.783845] psci: CPU1 killed (polled 0 ms)
[  793.795813] CPU2: shutdown
[  793.795941] psci: CPU2 killed (polled 0 ms)
[  793.807337] CPU3: shutdown
[  793.807465] psci: CPU3 killed (polled 0 ms)
[  793.819110] CPU4: shutdown
[  793.819235] psci: CPU4 killed (polled 0 ms)
[  793.833682] CPU5: shutdown
[  793.834614] psci: CPU5 killed (polled 0 ms)
bl30 get wakeup sources!
process command 00000006
bl30 enter suspend!
Little core clk suspend rate 100000000
Big core clk suspend rate 24000000
store restore gp0 pll
suspend_counter: 1
Enter ddr suspend
ddr suspend time: 16us
alarm=0S
process command 00000001
GPIOA_11/13 off
cec ver:2018/04/19
CEC cfg:0x0000
WAKEUP GPIO cfg:0x00000000
use vddee new table!
kern log_addr:0x00
cec T: 00
err: tx not finish flag
cec reset
Set cec pinmux:0x11
Set cec log_addr:0x10,ADDR0:10
use vddee new table!
exit_reason:0x03
Enter ddr resume
ddr resume time: 124us
store restore gp0 pll
cfg15 3b00000
cfg15 33b00000
Little [  793.845285] Enabling non-boot CPUs ...
core clk re[  793.846900] Detected VIPT I-cache on CPU1
[  793.847250] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[  793.850966] CPU1 is up
[  793.858728] Detected VIPT I-cache on CPU2
[  793.858825] arch_timer: CPU2: Trapping CNTVCT access
[  793.858851] CPU2: Booted secondary processor 0x0000000100 [0x410fd092]
[  793.860784] cpufreq: cpufreq_online: CPU2: Running at unlisted
freq: 999999 KHz
[  793.880028] cpufreq: cpufreq_online: CPU2: Unlisted initial
frequency changed to: 1000000 KHz
[  793.889018] CPU2 is up
[  793.891578] Detected VIPT I-cache on CPU3
[  793.891609] arch_timer: CPU3: Trapping CNTVCT access
[  793.891617] CPU3: Booted secondary processor 0x0000000101 [0x410fd092]
[  793.892276] CPU3 is up
[  793.909048] Detected VIPT I-cache on CPU4
[  793.909077] arch_timer: CPU4: Trapping CNTVCT access
[  793.909084] CPU4: Booted secondary processor 0x0000000102 [0x410fd092]
[  793.909896] CPU4 is up
[  793.926797] Detected VIPT I-cache on CPU5
[  793.926827] arch_timer: CPU5: Trapping CNTVCT access
[  793.926834] CPU5: Booted secondary processor 0x0000000103 [0x410fd092]
[  793.927609] CPU5 is up
sume rate 100000000
Big core clk resume rate 50000000
[  793.971976] meson8b-dwmac ff3f0000.ethernet eth0: No Safety
Features support found
[  793.974405] meson8b-dwmac ff3f0000.ethernet eth0: configuring for
phy/rgmii link mode

[root@archl-on2e ~]# dmesg | grep rtc
[    5.269079] rtc-pcf8563 0-0051: registered as rtc0
[    5.270948] rtc-pcf8563 0-0051: setting system clock to
2020-08-18T04:52:26 UTC (1597726346)

Schematics [0] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.4_20190307.pdf
Datasheets [1] https://dn.odroid.com/S922X/ODROID-N2/Datasheet/S922X_Public_Datasheet_V0.2.pdf

Best Regards
-Anand
