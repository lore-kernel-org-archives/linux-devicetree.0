Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D626AC2BB1D
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 16:44:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF134206C0
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 16:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V3fGpkqk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732156AbgCPQoo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 12:44:44 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:37498 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731717AbgCPQoo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Mar 2020 12:44:44 -0400
Received: by mail-pj1-f66.google.com with SMTP id ca13so9014031pjb.2
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=OzTibJtwHWvgkYEqJ0BJY+oA4+jt7ssN/aIUWbaaV84=;
        b=V3fGpkqkFtEjPimrGJV0q10vLHNWAa+tM8qZwtIwuhKOiGhd7jeXVRM0ZgDbMd3sb/
         KIUY0yo3hhvD3juiaq7+p93GnfPlGpDHE6HLf7rOemeDRnHy1wlUaOAt0D3EkTqYBtHX
         CshSpdAmN3y63ZHMJKAvgq+hNO0GWX4KGeKfC+fY9x1+7F0ec8LfaPK435zXsZzqm26k
         0f4EzkvaJmMbOmtE9FmMTAfvbY3suqXSJJVgcrsWLU/BqvybOtn1gJzzUlq2F4pV70lM
         S/qrlksKby46Vd4KIzAKht7gHoh3m/2zIkB9AkWfrZF4fqDIadKPCyHl4GdB/bJNEZPt
         LPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=OzTibJtwHWvgkYEqJ0BJY+oA4+jt7ssN/aIUWbaaV84=;
        b=dC+btFOvM4wwTkF/YCUgFyiRGdraf/gqAMh1WpNz2r6jrR0jQl+J0cqzkY6JqbZZH6
         5mwTTIE7cwk3rFpk/L2APWu55mx3ZGLYr/Pbyvn/vTBtRVwJoq78NP4FsqoGkAtcYh7S
         Bo7r8vXRCN6Y7Nzfe85bIlBAPOPyrs6FgGhUmm9nlcPN4+4/LjoNrAf99JGBqmvqHLUB
         o1JTwL61/sB1oJWH7zhR9pGKLu2AERUY2rav9PsfK9Fjjd/MB1azCBbMUK35OEXLxsfR
         rL+0f8o/Ko5ozx0ZH7q6FqcEpLwSKlZs8wiJ8R4lz61r6gb4JYRPoPOw35yywiP5ujOO
         L+uA==
X-Gm-Message-State: ANhLgQ3Ycl3MFfj+AB8jhpHLUupymUu36CFvmkci4683xVD9tzCX4hAm
        emp/q/SO5CNysi0CFM7wPjUjJg==
X-Google-Smtp-Source: ADFU+vuHs/YqjTagHQi8/SIGIi44ZkuT3e9cdVdLX441TK+A0Z2om/47O08Fbn3La/oetfhgCq1UYQ==
X-Received: by 2002:a17:902:b901:: with SMTP id bf1mr59761plb.133.1584377080944;
        Mon, 16 Mar 2020 09:44:40 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:dcc4:2a10:1b38:3edc])
        by smtp.gmail.com with ESMTPSA id gv7sm332411pjb.16.2020.03.16.09.44.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 09:44:40 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Christian Hewitt <christianshewitt@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson-g12b-gtking: add initial device-tree
In-Reply-To: <1582985353-83371-3-git-send-email-christianshewitt@gmail.com>
References: <1582985353-83371-1-git-send-email-christianshewitt@gmail.com> <1582985353-83371-3-git-send-email-christianshewitt@gmail.com>
Date:   Mon, 16 Mar 2020 09:44:39 -0700
Message-ID: <7h36a8w8p4.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> The Shenzen AZW (Beelink) GT-King is based on the Amlogic W400 reference
> board with an S922X chip.
>
> - 4GB LPDDR4 RAM
> - 64GB eMMC storage
> - 10/100/1000 Base-T Ethernet
> - AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
> - HDMI 2.1 video
> - S/PDIF optical output
> - Analogue audio output
> - 1x USB 2.0 port
> - 2x USB 3.0 ports
> - IR receiver
> - 1x micro SD card slot
>
> The device-tree is largely based on meson-g12b-ugoos-am6.

It's more than just based on, it's identical (other than compatible
strings and whitespace fixup[1].)

Both of these are based on the W400 ref design, so please make a W400
.dtsi that can be used by both ugoos and this.

Sorry to be a bit picky here, but there's a prolifieration of these
boards out there based on the Amlogic designs with little/no difference,
so I'd like our DTs to reflect that.

Thanks,

Kevin


[1]
$ diff -u arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
--- arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts	2020-03-04 07:06:17.089604752 -0800
+++ arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts	2020-03-16 09:38:06.983705705 -0700
@@ -14,8 +14,8 @@
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
-	compatible = "ugoos,am6", "amlogic,g12b";
-	model = "Ugoos AM6";
+	compatible = "azw,gtking", "amlogic,g12b";
+	model = "Beelink GT-King";
 
 	aliases {
 		serial0 = &uart_AO;
@@ -200,7 +200,7 @@
 
 	sound {
 		compatible = "amlogic,axg-sound-card";
-		model = "G12B-UGOOS-AM6";
+		model = "G12B-GTKING";
 		audio-aux-devs = <&tdmout_b>;
 		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
 				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
@@ -532,7 +532,7 @@
 		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
 		max-speed = <2000000>;
 		clocks = <&wifi32k>;
-	clock-names = "lpo";
+		clock-names = "lpo";
 	};
 };
 
