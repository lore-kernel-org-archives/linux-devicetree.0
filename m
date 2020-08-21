Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBDBC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 04:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB9642075E
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 04:44:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGnw9Z6u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbgHUEoE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 00:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725855AbgHUEn7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Aug 2020 00:43:59 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82437C061385
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 21:43:59 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id g13so539121ioo.9
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2020 21:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YlFL/rih+H8KvWvRJX1TR8uI1YiOlEWobneX6YOAnrI=;
        b=IGnw9Z6uw3LnNjby4EHVvMBdfvlVmIh2wTBxASlHvRpWHZIAAb1j4JT/NQ8d68/4Lf
         L//B7aWsQgKtT7XFhQn/Y59vLfymj/YkscQODdPDQXZLZ00T4S8NTKXVXjo2uxDOfjBG
         BPBfSlOWQWRl/l+TApUU1ay3rCF7mC+m4GfomOaFqBPyJFi0xbaW62iT/BGHvs1WMhxb
         bZ5KzvdCAM3fr7V/UWbjz45Yz4DjZ/AeKw2VEOGdB0yS5EhAWWKvkZKfUYjlPn8oVbsd
         8cgKZYk4Pz3kcFzUaDYQotNG+JFBHHLpGm3P6OGSB4uUWOkhgLOW8Drs15gRsseq+XRu
         /GEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YlFL/rih+H8KvWvRJX1TR8uI1YiOlEWobneX6YOAnrI=;
        b=dbbN60mck+na16ZYXP+8/pKu/DoA/wa1OUltEMiTuqI7ba+zGXz29c3zxQMmOtSaqC
         BtWhnuQ9B0KIT+iqjOdbEpGJNmL3veCpvcEBWHnuNYxjqRvXf9p8L0IAh51BgRp8GBns
         PSHJm7fMSOERb6ZKEhBAMXAUsXpM3N+7EyNfxl2ZTdoes6yq/8t/6kkrw+jW8MGAPRcO
         YZ2kH6JRW5/WmW02xKpFvj3H97Z1HmakUZThPEn0pe4w5MW72zmgHqL+mU9uyfTzspyB
         g4lsD4gpPWuS9/xTG3iuqoKjvojF/WXiR127zF1rc60LVu0qdLTTkoXVlZH93oBFgc4Y
         Dwsg==
X-Gm-Message-State: AOAM530H/48owwpJkxeOt6TD9rUx+up2SaE7eEZ7Fhmmd5pZKgqDELhU
        ouckEx7Bj4cYnku9V16RV30/DYUsgbKL8re4ZXLh62fli74=
X-Google-Smtp-Source: ABdhPJz7ddkTjw4ZxIFpwLp3qVrNW6dH6qle+slWsqodsDzU8TRMPw3PbtGHC5wm+q0HFRYleeKVkId7fFfameuhX1o=
X-Received: by 2002:a02:3f16:: with SMTP id d22mr1072449jaa.30.1597985038680;
 Thu, 20 Aug 2020 21:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200820121323.564-1-linux.amoon@gmail.com> <20200820121323.564-2-linux.amoon@gmail.com>
 <7hlfi9xgch.fsf@baylibre.com>
In-Reply-To: <7hlfi9xgch.fsf@baylibre.com>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Fri, 21 Aug 2020 10:13:47 +0530
Message-ID: <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Kevin,

Thanks for your review comments.

On Fri, 21 Aug 2020 at 01:03, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Anand Moon <linux.amoon@gmail.com> writes:
>
> > Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> > support the RTC wakealarm feature for suspend and resume.
> > Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> > timer device to prevent it being assigned to /dev/rtc0
> > which disto userspace tools assume is a clock device.
> >
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > Changes V3
> > --Drop the INI GPIOAO.BIT7 pinctrl.
>
> Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
> wakeup the system?  If so, this should be included as part of this
> patch.
>
> It probably still works because the bootloader configures this GPIO as
> input, but the kernel should not rely on the booloader for that, so
> please include as part of this patch.
>

Ok I will figure out the correct pinctrl need for this settings.
looking into the Odroid N2 schematics.

> Other than that, this is looking OK.
>
> Curious how you're testing this?
>
> When I tested with rtcwake (from buildroot), I'm getting this:
>
> / # rtcwake -d rtc0 -m mem -s4
> rtcwake: RTC_RD_TIME: Invalid argument
>
> Kevin

On my side I have tested on ArcLinux using mainline u-boot.

# uname -a
Linux archl-on2e 5.9.0-rc1-00105-gaabe42051eab #1 SMP PREEMPT Thu Aug
20 10:38:40 UTC 2020 aarch64 GNU/Linux

# sudo hwclock --show
2020-08-21 10:12:09.964155+05:30

# timedatectl status
               Local time: Fri 2020-08-21 10:12:30 IST
           Universal time: Fri 2020-08-21 04:42:30 UTC
                 RTC time: Fri 2020-08-21 04:42:32
                Time zone: Asia/Kolkata (IST, +0530)
System clock synchronized: yes
              NTP service: active
          RTC in local TZ: no

# rtcwake -d rtc0 -m mem -s4
rtcwake: wakeup from "mem" using rtc0 at Fri Aug 21 04:20:33 2020
[  113.003840] PM: suspend entry (deep)
[  113.004122] Filesystems sync: 0.000 seconds
[  113.386993] Freezing user space processes ... (elapsed 0.003 seconds) done.
[  113.391925] OOM killer disabled.
[  113.395132] Freezing remaining freezable tasks ... (elapsed 0.001
seconds) done.
[  113.405562] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
[  113.534222] Disabling non-boot CPUs ...
[  113.535014] CPU1: shutdown
[  113.535113] psci: CPU1 killed (polled 0 ms)
[  113.541518] CPU2: shutdown
[  113.541971] psci: CPU2 killed (polled 0 ms)
[  113.547949] CPU3: shutdown
[  113.548743] psci: CPU3 killed (polled 0 ms)
[  113.554753] CPU4: shutdown
[  113.555558] psci: CPU4 killed (polled 0 ms)
[  113.561863] CPU5: shutdown
[  113.563556] psci: CPU5 killed (polled 0 ms)
bl30 get wakeup sources!
process command 00000006
bl30 enter suspend!
Little core clk suspend rate 500000000
Big core clk suspend rate 24000000
store restore gp0 pll
suspend_counter: 1
Enter ddr suspend
DMC_DRAM_STAT11: 0x544
ddr suspend time: 2178us
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
Lit[  113.567994] Enabling non-boot CPUs ...
[  113.568486] Detected VIPT I-cache on CPU1
[  113.568579] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[  113.569409] CPU1 is up
[  113.579874] Detected VIPT I-cache on CPU2
[  113.579918] arch_timer: CPU2: Trapping CNTVCT access
[  113.579932] CPU2: Booted secondary processor 0x0000000100 [0x410fd092]
[  113.580221] cpufreq: cpufreq_online: CPU2: Running at unlisted
freq: 499999 KHz
[  113.601661] cpufreq: cpufreq_online: CPU2: Unlisted initial
frequency changed to: 500000 KHz
[  113.610292] CPU2 is up
[  113.612682] Detected VIPT I-cache on CPU3
[  113.612706] arch_timer: CPU3: Trapping CNTVCT access
[  113.612713] CPU3: Booted secondary processor 0x0000000101 [0x410fd092]
[  113.613064] CPU3 is up
[  113.630312] Detected VIPT I-cache on CPU4
[  113.630336] arch_timer: CPU4: Trapping CNTVCT access
[  113.630344] CPU4: Booted secondary processor 0x0000000102 [0x410fd092]
[  113.630733] CPU4 is up
[  113.647997] Detected VIPT I-cache on CPU5
[  113.648020] arch_timer: CPU5: Trapping CNTVCT access
[  113.648028] CPU5: Booted secondary processor 0x0000000103 [0x410fd092]
[  113.648448] CPU5 is up
tle core clk resume rate 500000000
Big core clk resume rate 50000000
[  113.694610] meson8b-dwmac ff3f0000.ethernet eth0: No Safety
Features support found
[  113.696672] meson8b-dwmac ff3f0000.ethernet eth0: configuring for
phy/rgmii link mode
[  113.731329] usb usb1: root hub lost power or was reset
[  113.731573] usb usb2: root hub lost power or was reset
[  114.092879] usb 2-1: reset SuperSpeed Gen 1 USB device number 2
using xhci-hcd
[  114.244300] usb 1-1: reset high-speed USB device number 2 using xhci-hcd
[  114.771933] usb 1-1.4: reset full-speed USB device number 3 using xhci-hcd
[  114.967002] OOM killer enabled.
[  114.967165] Restarting tasks ... done.


# rtcwake -d rtc1 -m mem -s4
rtcwake: wakeup from "mem" using rtc1 at Thu Jan  1 00:02:32 1970
[  147.661305] PM: suspend entry (deep)
[  147.661836] Filesystems sync: 0.000 seconds
[  148.016605] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  148.019636] OOM killer disabled.
[  148.022805] Freezing remaining freezable tasks ... (elapsed 0.001
seconds) done.
[  148.032945] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
[  148.167760] Disabling non-boot CPUs ...
[  148.169733] CPU1: shutdown
[  148.170846] psci: CPU1 killed (polled 0 ms)
[  148.177272] CPU2: shutdown
[  148.178390] psci: CPU2 killed (polled 0 ms)
[  148.184226] CPU3: shutdown
[  148.184293] psci: CPU3 killed (polled 0 ms)
[  148.190565] CPU4: shutdown
[  148.190631] psci: CPU4 killed (polled 0 ms)
[  148.197579] CPU5: shutdown
[  148.198689] psci: CPU5 killed (polled 0 ms)
bl30 get wakeup sources!
process command 00000006
bl30 enter suspend!
Little core clk suspend rate 250000000
Big core clk suspend rate 24000000
store restore gp0 pll
suspend_counter: 1
Enter ddr suspend
ddr suspend time: 16us
alarm=4S
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
ddr resume time: 231us
store restore gp0 pll
cfg15 3b00000
cfg15 33b00000
Litt[  148.205717] Enabling non-boot CPUs ...
[  148.206395] Detected VIPT I-cache on CPU1
[  148.206552] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
[  148.208110] CPU1 is up
[  148.217759] Detected VIPT I-cache on CPU2
[  148.217815] arch_timer: CPU2: Trapping CNTVCT access
[  148.217831] CPU2: Booted secondary processor 0x0000000100 [0x410fd092]
[  148.219095] cpufreq: cpufreq_online: CPU2: Running at unlisted
freq: 999999 KHz
[  148.239430] cpufreq: cpufreq_online: CPU2: Unlisted initial
frequency changed to: 1000000 KHz
[  148.248209] CPU2 is up
[  148.250643] Detected VIPT I-cache on CPU3
[  148.250668] arch_timer: CPU3: Trapping CNTVCT access
[  148.250676] CPU3: Booted secondary processor 0x0000000101 [0x410fd092]
[  148.251068] CPU3 is up
[  148.268231] Detected VIPT I-cache on CPU4
[  148.268256] arch_timer: CPU4: Trapping CNTVCT access
[  148.268263] CPU4: Booted secondary processor 0x0000000102 [0x410fd092]
[  148.268686] CPU4 is up
[  148.285889] Detected VIPT I-cache on CPU5
[  148.285913] arch_timer: CPU5: Trapping CNTVCT access
[  148.285921] CPU5: Booted secondary processor 0x0000000103 [0x410fd092]
[  148.286416] CPU5 is up
le core clk resume rate 250000000
Big core clk resume rate 50000000
[  148.338091] meson8b-dwmac ff3f0000.ethernet eth0: No Safety
Features support found
[  148.340483] meson8b-dwmac ff3f0000.ethernet eth0: configuring for
phy/rgmii link mode
[  148.454331] usb usb1: root hub lost power or was reset
[  148.454575] usb usb2: root hub lost power or was reset
[  148.814331] usb 2-1: reset SuperSpeed Gen 1 USB device number 2
using xhci-hcd
[  148.965394] usb 1-1: reset high-speed USB device number 2 using xhci-hcd
[  149.493501] usb 1-1.4: reset full-speed USB device number 3 using xhci-hcd
[  149.689468] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000008
[  149.692835] Mem abort info:
[  149.695588]   ESR = 0x96000004
[  149.698471]   EC = 0x25: DABT (current EL), IL = 32 bits
[  149.703825]   SET = 0, FnV = 0
[  149.706732]   EA = 0, S1PTW = 0
[  149.709922] Data abort info:
[  149.712767]   ISV = 0, ISS = 0x00000004
[  149.716559]   CM = 0, WnR = 0
[  149.719509] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000d42d4000
[  149.725909] [0000000000000008] pgd=0000000000000000, p4d=0000000000000000
[  149.732643] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[  149.738040] Modules linked in: rfkill snd_soc_hdmi_codec
dw_hdmi_i2s_audio dw_hdmi_cec meson_gxl realtek dwmac_generic
dwmac_meson8b stmmac_platform stmmac rc_odroid meson_dw_hdmi meson_ir
axg_audio dw_hdmi snd_soc_meson_g12a_toacodec meson_drm sclk_div
rtc_pcf8563 rc_core cec snd_soc_meson_g12a_tohdmitx clk_phase
snd_soc_meson_codec_glue nvmem_meson_efuse crct10dif_ce
snd_soc_meson_axg_sound_card drm_kms_helper snd_soc_meson_card_utils
meson_rng pwm_meson rtc_meson_vrtc rng_core reset_meson_audio_arb
mdio_mux_meson_g12a display_connector mdio_xpcs
snd_soc_meson_axg_tdmout snd_soc_meson_axg_tdmin
snd_soc_meson_axg_toddr meson_canvas snd_soc_meson_axg_frddr
snd_soc_meson_t9015 snd_soc_meson_axg_fifo snd_soc_simple_amplifier
snd_soc_meson_axg_tdm_interface snd_soc_meson_axg_tdm_formatter drm
ip_tables x_tables ipv6
[  149.809601] CPU: 3 PID: 417 Comm: rtcwake Not tainted
5.9.0-rc1-00105-gaabe42051eab #1
[  149.817393] Hardware name: Hardkernel ODROID-N2 (DT)
[  149.822344] pstate: 60000005 (nZCv daif -PAN -UAO BTYPE=--)
[  149.827906] pc : sugov_start+0x40/0x120
[  149.831687] lr : cpufreq_start_governor+0x54/0x90
[  149.836275] sp : ffff80001279bb20
[  149.839561] x29: ffff80001279bb20 x28: ffff0000d424c600
[  149.844817] x27: 0000000000000000 x26: 0000000000000000
[  149.850075] x25: ffff0000f2854218 x24: ffff800011ad1d84
[  149.855336] x23: ffff800011ab9980 x22: ffff8000116671b0
[  149.860595] x21: ffff800011aba360 x20: ffff0000f2854000
[  149.865855] x19: 0000000000000000 x18: 0000000000000001
[  149.871116] x17: 0000000000000000 x16: 0000000000000000
[  149.876380] x15: 000001bc458f2e9c x14: 0000000000000362
[  149.881639] x13: 0000000000000001 x12: 0000000000000000
[  149.886899] x11: 0000000000000001 x10: 00000000000009c0
[  149.892165] x9 : ffff80001279b860 x8 : ffff0000d424d020
[  149.897425] x7 : ffff0000d8d32e00 x6 : ffff0000f2854250
[  149.902685] x5 : ffff80001279ba90 x4 : 0000000000000000
[  149.907945] x3 : 0000000000000000 x2 : 00000000000003e8
[  149.913208] x1 : ffff800011ad1bb0 x0 : 00000000ffffffff
[  149.918472] Call trace:
[  149.920945]  sugov_start+0x40/0x120
[  149.924388]  cpufreq_start_governor+0x54/0x90
[  149.928689]  cpufreq_resume+0x88/0x170
[  149.932398]  dpm_resume+0x1c8/0x1e8
[  149.935836]  dpm_resume_end+0x18/0x30
[  149.939465]  suspend_devices_and_enter+0x23c/0x4d8
[  149.944197]  pm_suspend+0x258/0x2c0
[  149.947645]  state_store+0x8c/0x118
[  149.951133]  kobj_attr_store+0x18/0x30
[  149.954841]  sysfs_kf_write+0x44/0x58
[  149.958445]  kernfs_fop_write+0xfc/0x218
[  149.962340]  vfs_write+0xf0/0x230
[  149.965609]  ksys_write+0x6c/0xf8
[  149.968889]  __arm64_sys_write+0x1c/0x28
[  149.972788]  el0_svc_common.constprop.0+0x6c/0x168
[  149.977510]  do_el0_svc+0x24/0x90
[  149.980787]  el0_sync_handler+0x90/0x198
[  149.984649]  el0_sync+0x158/0x180
[  149.987985] Code: f9405013 910d82b5 912602f7 12800000 (f9400661)
[  149.993970] ---[ end trace f23c646bedf2247c ]---

Best Regards
-Anand
