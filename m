Return-Path: <SRS0=cZLa=YL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34685CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 16:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 05A8121D7C
	for <linux-devicetree@archiver.kernel.org>; Fri, 18 Oct 2019 16:14:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gZNchhad"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732159AbfJRQOR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 18 Oct 2019 12:14:17 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37464 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728594AbfJRQOQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 18 Oct 2019 12:14:16 -0400
Received: by mail-wr1-f68.google.com with SMTP id p14so6890619wro.4
        for <devicetree@vger.kernel.org>; Fri, 18 Oct 2019 09:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:subject:in-reply-to:date:message-id
         :mime-version;
        bh=0Cv5HxbYsKs88qKdDqqwy2GcVJ7JGGNauSIpovXmWjE=;
        b=gZNchhaduGtAYNPyOyjo0Q/R9PH//aDDplRrAmvdTTPx0Kmxn8NFK+7uAx8JKgIEeX
         CmgKuBT7wpTX5XgrppkFVgSvyCiZu9C7R70WHNEiHuYGIAt+FX3H7nG5/jkh44Rz1OeZ
         +Oo06tmY7t+R2wCBMZC5VxXtyEFPzndgMtS0AaJNXfn7Z92k0ZvHBesNFCCpAyIBKLGr
         S2lLW1EaKwt8i9PnSNjyZo3zC4zUjbt3z3L0mrfzR6prmno+8o5h44MIVZcom3MjiDPJ
         giuQ9ZZ5Bvd2l9TyhJ2tWXibsW3ZYIKbYwAhsEv/jwRDgeS+z2dmIppYCe9Hu/GeFRL3
         hzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:subject
         :in-reply-to:date:message-id:mime-version;
        bh=0Cv5HxbYsKs88qKdDqqwy2GcVJ7JGGNauSIpovXmWjE=;
        b=eiPTKG/2FNHZRt5nfFEpIMWd0p578lLbTa2zRjO/Ng+s3qRc62rnqdh1+qKS4Be44D
         FYPQauOdprg2Yclt2IrvswfMHTYXY80bdyT/zCCjzT6fyFWBsTIUJA3JWFY4pEugB2OO
         w3enqfWqL5/B+Q0fjKxEeJTYIZXUYyI33WRBhOnDCRSDxgaAxnJxLHsxpTNwm489QZZd
         xIbmfLCeIKd5+kigQqNmKVefFqU5GSk4X0gGsyq29BkJF/HguvILJSfQPY9BUnb67rQ1
         rsXwEeJ64oA1ooTTbQpewjyQL4UaVANRiitEshA/zBlySGAZ/kZe/BT86H7LisDO5NVX
         urnw==
X-Gm-Message-State: APjAAAUrFeGBeOj4yo2huxLZjloLk2xzm8ZEggf1VGjkrYiyiwIhjLFb
        R74vo3lzVjyMkzo+IGbaOi646Q==
X-Google-Smtp-Source: APXvYqxahX2Eo67G58sg7nvdDRQg5C58GloUqLjP/ZxQkAa40VhAeVwwcIp6pZ/sy3jdITFMe4NWDg==
X-Received: by 2002:adf:df05:: with SMTP id y5mr9222772wrl.84.1571415253811;
        Fri, 18 Oct 2019 09:14:13 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a204sm7706251wmh.21.2019.10.18.09.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 09:14:12 -0700 (PDT)
References: <1571393152-3698-1-git-send-email-christianshewitt@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Christian Hewitt <christianshewitt@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: khadas-vim3l: enable audio
In-reply-to: <1571393152-3698-1-git-send-email-christianshewitt@gmail.com>
Date:   Fri, 18 Oct 2019 18:14:11 +0200
Message-ID: <1jd0euf2uk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Fri 18 Oct 2019 at 12:05, Christian Hewitt <christianshewitt@gmail.com> wrote:

> Add and enable the audio nodes on the VIM3L. This is based on the recent
> submission for the SEI610 device [1] and the existing VIM3 dts.
>
> [1] https://patchwork.kernel.org/patch/11180785/
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    | 147 +++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> index dbbf29a..d07f0cf 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
> @@ -8,6 +8,7 @@
>  
>  #include "meson-sm1.dtsi"
>  #include "meson-khadas-vim3.dtsi"
> +#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>  
>  / {
>  	compatible = "khadas,vim3l", "amlogic,sm1";
> @@ -31,6 +32,86 @@
>  		regulator-boot-on;
>  		regulator-always-on;
>  	};
> +
> +	sound {
> +		compatible = "amlogic,axg-sound-card";
> +		model = "SM1-KHADAS-VIM3L";
> +		audio-aux-devs = <&tdmout_a>, <&tdmout_b>,
> +				 <&tdmin_a>, <&tdmin_b>;
> +		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 0",
> +				"TDMOUT_A IN 1", "FRDDR_B OUT 0",
> +				"TDMOUT_A IN 2", "FRDDR_C OUT 0",
> +				"TDM_A Playback", "TDMOUT_A OUT",

The route above are useless since you are not using TDM A in this card

> +				"TDMOUT_B IN 0", "FRDDR_A OUT 1",
> +				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
> +				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
> +				"TDM_B Playback", "TDMOUT_B OUT";
> +
> +		assigned-clocks = <&clkc CLKID_MPLL2>,
> +				  <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +		status = "okay";
> +
> +		dai-link-0 {
> +			sound-dai = <&frddr_a>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&frddr_b>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&frddr_c>;
> +		};

You have only one output, so one FRDDR is enough.
So either enable a put just one, or put them all (including FRDDR D)

> +
> +		dai-link-3 {
> +			sound-dai = <&toddr_a>;
> +		};
> +
> +		dai-link-4 {
> +			sound-dai = <&toddr_b>;
> +		};
> +
> +		dai-link-5 {
> +			sound-dai = <&toddr_c>;
> +		};

There is no capture Backend, to the TODDR are useless

> +
> +		/* 8ch hdmi interface */
> +		dai-link-6 {
> +			sound-dai = <&tdmif_b>;

Any particular reason for using TDM B interface ? What is khadas doing
in there own code ?

> +			dai-format = "i2s";
> +			dai-tdm-slot-tx-mask-0 = <1 1>;
> +			dai-tdm-slot-tx-mask-1 = <1 1>;
> +			dai-tdm-slot-tx-mask-2 = <1 1>;
> +			dai-tdm-slot-tx-mask-3 = <1 1>;
> +			mclk-fs = <256>;
> +
> +			codec {
> +				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
> +			};
> +		};
> +
> +		/* hdmi glue */
> +		dai-link-7 {
> +			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
> +
> +			codec {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +	};
> +};
> +
> +&arb {
> +	status = "okay";
> +};
> +
> +&clkc_audio {
> +	status = "okay";
>  };
>  
>  &cpu0 {
> @@ -61,6 +142,24 @@
>  	clock-latency = <50000>;
>  };
>  
> +&frddr_a {
> +	status = "okay";
> +};
> +
> +&frddr_b {
> +	status = "okay";
> +};
> +
> +&frddr_c {
> +	status = "okay";
> +};
> +
> +&pdm {
> +	pinctrl-0 = <&pdm_din0_z_pins>, <&pdm_dclk_z_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};

Why do you enable PDM ? does this board provide some digital mics ?
There is no links using PDM in your card. Please clarify

> +
>  &pwm_AO_cd {
>  	pinctrl-0 = <&pwm_ao_d_e_pins>;
>  	pinctrl-names = "default";
> @@ -93,3 +192,51 @@
>  	phy-names = "usb2-phy0", "usb2-phy1";
>  };
>   */
> +
> +&tdmif_a {
> +	pinctrl-0 = <&tdm_a_dout0_pins>, <&tdm_a_fs_pins>, <&tdm_a_sclk_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	assigned-clocks = <&clkc_audio AUD_CLKID_TDM_SCLK_PAD0>,
> +			  <&clkc_audio AUD_CLKID_TDM_LRCLK_PAD0>;
> +	assigned-clock-parents = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
> +				 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
> +	assigned-clock-rates = <0>, <0>;
> +};
> +
> +&tdmif_b {
> +	status = "okay";
> +};
> +
> +&tdmin_a {
> +	status = "okay";
> +};
> +
> +&tdmin_b {
> +	status = "okay";
> +};
> +
> +&tdmout_a {
> +	status = "okay";
> +};
> +
> +&tdmout_b {
> +	status = "okay";
> +};
> +
> +&toddr_a {
> +	status = "okay";
> +};
> +
> +&toddr_b {
> +	status = "okay";
> +};
> +
> +&toddr_c {
> +	status = "okay";
> +};
> +
> +&tohdmitx {
> +	status = "okay";
> +};

