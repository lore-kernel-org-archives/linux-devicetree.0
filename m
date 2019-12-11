Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C23C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 19:17:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F162206A5
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 19:17:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=newoldbits-com.20150623.gappssmtp.com header.i=@newoldbits-com.20150623.gappssmtp.com header.b="QeQ8lQGX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfLKTRT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 14:17:19 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45900 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfLKTRT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 14:17:19 -0500
Received: by mail-lj1-f196.google.com with SMTP id d20so25309640ljc.12
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 11:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newoldbits-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1AN7tQu9E9F6CdQAkLeGav9Txv7MLGF3KKMoUN11PvY=;
        b=QeQ8lQGXrcaZThSohmj5J4TTft2Hk+yT4BAC0TNFBi5uyW2IaFb19TgIFO4MFkhwD4
         S0lBFjWpveGnFzflxslGepWBXAcZ+Qp7EqBBlBLj7TclbZ/wxc2bj4wlOI2v+IpcOIXv
         dqK3hKlZGA6ZiPCWmYV6EinkhyrPTtwoVvaBTPK64jUizGTiHRtZ+gjXmPGOH9QdtnLm
         6d++npDsoXzfj8VDoUMgnvqU3e2xI73Az5D4nHts5G3FaSj+ViWTTjBZOlsnMFg2PyYJ
         1sYpbylZoOH/a5gbV1wlDhJkz7DdsNI/pP5F2jmHpMyFSyvhdIHLWS88WCHN9kkCO7nT
         kSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1AN7tQu9E9F6CdQAkLeGav9Txv7MLGF3KKMoUN11PvY=;
        b=kwk2Ha3xdLMCBRdKXDYH7jwxayAJ2D7es3ZyWE+71+tIQ2KoLb8Mw7BEPp7xJaEo2j
         PesyoVP5noNLJmbZwCKYifuv8aixbvglYeJAY1YjQ70XJCaXwj+y+BayChmTyOaadOt1
         QlMbBiIe/SMWPcD2+V0UKfLZ3vy9xAd4z806k97wHpX8YN5hVFsBrZtuWVkvQII0igcD
         Z0y9YFmuC/3cIrn6ikSeKVw4A49Bg7Jnz69lVFF+XXsW3MV8W8OzSUgCZ2/20A4pHgMO
         qe1qBQYVn8S4aeGQDtAAKfHwAaFPEFOAaBdTOAQVJznrCCk4fl9BvrjEo7XA46fEQPCc
         CC8Q==
X-Gm-Message-State: APjAAAX4QKJMer3ARCwk4zOEcZRHSZx4xjHMEw4xqTF1yAVEPrPllVBs
        TRoOSC/A9tuMzKrraIX+LT97T0thx0mAlgZmvMQvWQ==
X-Google-Smtp-Source: APXvYqyv09qAzakZNbU22xLMm5awfN09PNZBeZ1R+OinwKrNzz9E6Lx7pD0YcJkonKfsJewyU0RjeSfCXuWiwL/be7k=
X-Received: by 2002:a05:651c:32b:: with SMTP id b11mr3366910ljp.203.1576091837445;
 Wed, 11 Dec 2019 11:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20191210215831.6199-1-tony@atomide.com>
In-Reply-To: <20191210215831.6199-1-tony@atomide.com>
From:   Jean Pihet <jean.pihet@newoldbits.com>
Date:   Wed, 11 Dec 2019 20:17:06 +0100
Message-ID: <CAORVsuWOh2kVuo5MscT3EG+SJdLCBQqYHnvCbVE-DqeEHgO5bA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: Configure interconnect target module for
 am4 qspi
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Tony,

On Tue, Dec 10, 2019 at 10:58 PM Tony Lindgren <tony@atomide.com> wrote:
>
> We can now probe devices with device tree only configuration using
> ti-sysc interconnect target module driver. Let's configure the
> module, but keep the legacy "ti,hwmods" peroperty to avoid new boot
> time warnings. The legacy property will be removed in later patches
> together with the legacy platform data.
>
> Cc: Jean Pihet <jean.pihet@newoldbits.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Tested OK on AM4376 QSPI.
Acked-by: Jean Pihet <jean.pihet@newoldbits.com>

Thanks!
Jean

> ---
>  arch/arm/boot/dts/am4372.dtsi | 38 ++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
> --- a/arch/arm/boot/dts/am4372.dtsi
> +++ b/arch/arm/boot/dts/am4372.dtsi
> @@ -305,17 +305,35 @@ gpmc: gpmc@50000000 {
>                         status = "disabled";
>                 };
>
> -               qspi: spi@47900000 {
> -                       compatible = "ti,am4372-qspi";
> -                       reg = <0x47900000 0x100>,
> -                             <0x30000000 0x4000000>;
> -                       reg-names = "qspi_base", "qspi_mmap";
> -                       #address-cells = <1>;
> -                       #size-cells = <0>;
> +               target-module@47900000 {
> +                       compatible = "ti,sysc-omap4", "ti,sysc";
>                         ti,hwmods = "qspi";
> -                       interrupts = <0 138 0x4>;
> -                       num-cs = <4>;
> -                       status = "disabled";
> +                       reg = <0x47900000 0x4>,
> +                             <0x47900010 0x4>;
> +                       reg-names = "rev", "sysc";
> +                       ti,sysc-sidle = <SYSC_IDLE_FORCE>,
> +                                       <SYSC_IDLE_NO>,
> +                                       <SYSC_IDLE_SMART>,
> +                                       <SYSC_IDLE_SMART_WKUP>;
> +                       clocks = <&l3s_clkctrl AM4_L3S_QSPI_CLKCTRL 0>;
> +                       clock-names = "fck";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0x0 0x47900000 0x1000>,
> +                                <0x30000000 0x30000000 0x4000000>;
> +
> +                       qspi: spi@0 {
> +                               compatible = "ti,am4372-qspi";
> +                               reg = <0 0x100>,
> +                                     <0x30000000 0x4000000>;
> +                               reg-names = "qspi_base", "qspi_mmap";
> +                               clocks = <&dpll_per_m2_div4_ck>;
> +                               clock-names = "fck";
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               interrupts = <0 138 0x4>;
> +                               num-cs = <4>;
> +                       };
>                 };
>
>                 dss: dss@4832a000 {
> --
> 2.24.0
