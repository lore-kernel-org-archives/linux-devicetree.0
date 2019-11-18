Return-Path: <SRS0=UR7X=ZK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D653FC43141
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 19:21:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0B8922318
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 Nov 2019 19:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pup8uN0/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfKRTVZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 Nov 2019 14:21:25 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45124 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbfKRTVZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 Nov 2019 14:21:25 -0500
Received: by mail-wr1-f66.google.com with SMTP id z10so20870379wrs.12
        for <devicetree@vger.kernel.org>; Mon, 18 Nov 2019 11:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o/90Ms6BI5x9icISft1MSO0ezPRhWphSB1+2IQPK3/A=;
        b=Pup8uN0/k8+sJUenGIEmJb/vEQ3KpMQoaagCA1h+1CSl+xPG8rs24thJ6EpgMC7BAW
         ulCN1GQnBgH9fEe9Yfiy1uati6fN/ZRCfW0q1G66kB7hbcKp6bQSu2AmJOIqWBiGXUXu
         yMUqq9rjpcwVKY+ywaWyVa1ywGD3EpjkUEmiQ8l4GJwnPvmeLbrsdQy7sd6fiA0RU+Pg
         ZyTsm0KWlvWzRFsn3LnjVWKcNYpZAjQXNwAzFfLFM7kutKBHE/E5AdZYH1A/tVWL4IhR
         5LbFnKWxyPnW5YS3vDlYaZWJVbMdboRCqJHORiZUPXkjAY8ajPwdaArNmTY3aT62yUFq
         PstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o/90Ms6BI5x9icISft1MSO0ezPRhWphSB1+2IQPK3/A=;
        b=tspJRNcv2PB9w8ahFlrRGAAdaiSSU+53j9JuWfOS2TFG9ilGXTjVSUgDPmBpVHs7RC
         r/yl7C8Ps8UuBMyZV6ldOt9zXDboqwD9wMkOPR45Pr6tryL1/G0Ze/kS1jhny7jZp0tm
         vr4DrOmCNDRqdALnXj0PRsn3hE+Pa1w4kck1FpJRgvZ46+Bgy33TnbUxR15097gsLpJO
         CrfeJ9LisBUQvOHImMtTqCe1dWySXUmYEU25Z216SVRWiIRrx7bSe+L/+rEIyxg4AtFs
         DoycRIUVuVsA6BLPMHi2eTCNzcrNMvmloCjMa2r5tl/B35WhypAOJeCc3fro0S4/9BU9
         1UXA==
X-Gm-Message-State: APjAAAVhAyJ17FHx6MNtKGzywbbrxs4oZogFfZ+jtQhbJ0MsR4zhv90A
        yfi5y86a8zFEhK3tdwFT6/4=
X-Google-Smtp-Source: APXvYqxMVnlTHNXmWdSIJuSfFodkvY6O8Jst/ot5IklWYLq25TKrixg1mk0a6CXuogvsGzKxe0S2iw==
X-Received: by 2002:adf:f388:: with SMTP id m8mr3407261wro.18.1574104882900;
        Mon, 18 Nov 2019 11:21:22 -0800 (PST)
Received: from localhost ([37.238.189.2])
        by smtp.gmail.com with ESMTPSA id p15sm384430wmb.10.2019.11.18.11.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 11:21:21 -0800 (PST)
Date:   Mon, 18 Nov 2019 22:21:19 +0300
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC PATCH 3/4] arm64: dts: meson-gxbb: add support for
 Videostrong KII Pro
Message-ID: <20191118192119.dht2cpk7so2wztcf@manjaro.localdomain>
References: <20191117175606.5050-1-mohammad.rasim96@gmail.com>
 <20191117175606.5050-4-mohammad.rasim96@gmail.com>
 <65a64f28-c1fe-0ce2-d954-e96bc1924001@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65a64f28-c1fe-0ce2-d954-e96bc1924001@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 19/11/18 11:26AM, Neil Armstrong wrote:
> On 17/11/2019 18:56, Mohammad Rasim wrote:
> > This patch adds support for the Videostrong KII Pro tv box which is based on the gxbb-p201 reference design
> > 
> > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
> >  .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 39 +++++++++++++++++++
> >  2 files changed, 40 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> > index 84afecba9ec0..a795a170dcab 100644
> > --- a/arch/arm64/boot/dts/amlogic/Makefile
> > +++ b/arch/arm64/boot/dts/amlogic/Makefile
> > @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> > +dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > new file mode 100644
> > index 000000000000..b63dabb7bf97
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > @@ -0,0 +1,39 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > +/* Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
> > +*/
> > +
> > +/dts-v1/;
> > +
> > +#include "meson-gxbb-p20x.dtsi"
> > +
> > +/ {
> > +	compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
> > +	model = "Videostrong KII Pro";
> > +
> > +
> > +};
> > +
> > +&uart_A {
> > +	status = "okay";
> > +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> > +	pinctrl-names = "default";
> > +	uart-has-rtscts;
> > +
> > +	bluetooth {
> > +		compatible = "brcm,bcm4335a0";
> 
> Use "brcm,bcm43438-bt" here if the I/F is compatible.
> 
> > +	};
> > +};
> > +
> > +&ethmac {
> > +	status = "okay";
> > +	pinctrl-0 = <&eth_rmii_pins>;
> > +	pinctrl-names = "default";
> > +	phy-mode = "rmii";
> > +
> > +	snps,reset-gpio = <&gpio GPIOZ_14 0>;
> > +	snps,reset-delays-us = <0>, <10000>, <1000000>;
> > +	snps,reset-active-low> +};
> > +
> > +
> > 
> 
> Did you try to determine the PHY and add a PHY node aswell ? The reset stuff could go in the PHY node.
looking at the PCB I can see the phy is "IP101GR" so I thought I can use
the phy node of nextbox-a95x [0] but I get these errors:

```
[   15.867041] meson8b-dwmac c9410000.ethernet eth0: no phy at addr -1
[   15.867079] meson8b-dwmac c9410000.ethernet eth0: stmmac_open: Cannot attach to PHY (error: -19)
```

[0] https://github.com/torvalds/linux/blob/f9717178b9be9477877d4c3776c61ff56d854ddf/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts#L165-L177
> 
> Neil
