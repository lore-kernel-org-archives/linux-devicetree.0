Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C00C3A5A9
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 15:24:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C92320735
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 15:24:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6NWcErA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbgEDPYc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 11:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726908AbgEDPYb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 11:24:31 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBCDC061A0E
        for <devicetree@vger.kernel.org>; Mon,  4 May 2020 08:24:31 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id t11so10090044lfe.4
        for <devicetree@vger.kernel.org>; Mon, 04 May 2020 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=hiSySpURjELapjWkVuG5B+GMLNHdKW6iA+VycBG7Dso=;
        b=M6NWcErASTGsS5i10MWRd8/FRtBRWF5M41kIQ7Xypy9ecoAIyABYN8EdVTuvjteXP0
         nx11431qR1Ohzjx0MQgzsNcC+0swcaOftAktjXxVzXnrJl/sn/Qjq2tQBvwvSUQ50NvI
         VEBVzUPKIBGZ+pbCt1g2GwePYAwFFO383oHnGdosPTxGEMAxKNJbIvssgSiRRaGCeAhU
         dydDfjDCGwpM8qfGgVpFJJOD12XQukEdcSR4BcKa7IjkBiagIiVZQ29G/+SlqsjAQ8Xz
         ozuGm4cJWkY2frADjRPib3clmwYKVSiYD5ZN9jxZRLR1T/u88aEXUP2b/gC/r9ZiK0jp
         5xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=hiSySpURjELapjWkVuG5B+GMLNHdKW6iA+VycBG7Dso=;
        b=hdLEO5Q7cSWXAJEmjXrZnM4OXe7CdDnWbCTWm61RgIN0CXSkGXFDHJKTfG1b/JVWP+
         +/lkxdf86Aa0G++TBR5Xz/INJwgK/9hTTquUhX8tcmW8vkppOjygd5JMQyJbP/fa8VD2
         WPe30vhRnryFsIixjt/r/YtRhEX2s83VFU8HKurSjXGQE6fXImf/ZsGuMfj/npuzTS/q
         U1OtAPZh3LekqyEvqypvmEUrf9dh2fltX02l9jw4dXQyusAcU8BtnvGahuEr81JCqi6o
         OJmy0tqNiuL6g1tZtMCTQCLY4ERhKF0ENsU0OTSjVR/1LSli0Bj8U/+2Zv78jKzPxrhq
         O5iA==
X-Gm-Message-State: AGi0PuYTfFLFeeTmNwh9euZfuiE1o2HyHxX5LCA90XpjLvax11mdNbUi
        TAbyf3rEyd6loGIFTzdyqHw=
X-Google-Smtp-Source: APiQypKXi1u7L6aALLYofQe1fOadySmoHHzbC9gxqFfcwOBf3tl7ZIl3EHjNbNaLD9VVh2ECSpMzyQ==
X-Received: by 2002:ac2:5de5:: with SMTP id z5mr6769209lfq.68.1588605869706;
        Mon, 04 May 2020 08:24:29 -0700 (PDT)
Received: from elitebook.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id y21sm8466552ljg.66.2020.05.04.08.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 08:24:29 -0700 (PDT)
To:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vivek Unune <npcomplete13@gmail.com>
Cc:     BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Proper DT bindings for Broadcom's DMU node
Message-ID: <7da2db8f-66d0-24ec-d3eb-84247b383a06@gmail.com>
Date:   Mon, 4 May 2020 17:24:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

I need some help with designing proper bindings for Broadcom's DMU
block. We already have it partially covered but it's inconsistent, some
cleanups were rejected and so I want to redesign it as it should be.

DMU ("Device Management Unit") is a block that can be found on Broadcom
iProc / Northstar devices. On Northstar it's mapped at:
ranges = <0x1800c000 0x1000>

It contains:
1. Few random registers, some of them shared by various hardware
    blocks (and possibly hard to abstract?)
2. At least one sub-block with even more random registers

Some of known DMU registers are:
reg = <0x100 0x14>	CRU LCPLL control0
reg = <0x140 0x24>	CRU GENPLL
reg = <0x164 0x04>	CRU_USB2_CONTROL
reg = <0x180 0x04>	CRU_CLKSET_KEY
reg = <0x184 0x04>	CRU_RESET
reg = <0x1c0 0x24>	pinctrl
reg = <0x2a0 0x04>	CRU_STRAPS_CTRL
reg = <0x2c0 0x04>	PVTMON control0
(Broadcom never released a proper documentation)


As you can see there are a few CRU registers (depending on a source it's
a "Clock and Reset Unit" or "Central Resource Unit"). It's said to be
separated block and was described by Scott (from Broadcom) as: "unit
with a lot of random registers to perform various operations".

As I said, there are also some shared registers:

CRU_CLKSET_KEY is accessed by:
1. USB 2.0 PHY driver for (un)locking DMU PLL settings
2. GMAC for changing 2.66G line rate to 2Gbps

CRU_STRAPS_CTRL needs to be accessed by:
1. USB 3.0 PHY driver for PHY connected to MDIO
2. PCIE driver for PHY connected to MDIO


My initial idea was to have something like:

dmu@1800c000 {
	compatible = "simple-bus";
	ranges = <0 0x1800c000 0x1000>;
	#address-cells = <1>;
	#size-cells = <1>;

	cru@100 {
		compatible = "simple-bus";
		reg = <0x100 0x1a4>;

		lcpll { ... };
		genpll { ... };
		reset { ... };
	};
};

but Rob noticed that "simple-bus" requires everything in DMU to have
sub-nodes [0] [1].


I thought it can be solved by using compatible = "syscon", "simple-mfd"
and I even got one patch for that accepted [2] [3] (pinctrl). It seems
it slipped through and was possibly a mistake. Another similar patch was
rejected [4] [5] (bcm-ns-usb2-phy).

What I tried to achieve was something like this:

dmu@1800c000 {
	compatible = "simple-bus";
	ranges = <0 0x1800c000 0x1000>;
	#address-cells = <1>;
	#size-cells = <1>;

	cru: syscon@100 {
		compatible = "syscon", "simple-mfd";
		reg = <0x100 0x1a4>;
		ranges;
		#address-cells = <1>;
		#size-cells = <1>;

		lcpll0@0 {
			#clock-cells = <1>;
			compatible = "brcm,nsp-lcpll0";
			reg = <0x0 0x14>;
		};

		genpll@40 {
			#clock-cells = <1>;
			compatible = "brcm,nsp-genpll";
			reg = <0x40 0x24>;
		};

		pin-controller@c0 {
			compatible = "brcm,bcm4708-pinmux";
			reg = <0xc0 0x24>;
			reg-names = "cru_gpio_control";
		};

		thermal@1c0 {
			compatible = "brcm,ns-thermal";
			reg = <0x1c0 0x10>;
			#thermal-sensor-cells = <0>;
		};
	};
};

cru-reset@??? {
	compatible = "brcm,ns-cru-reset";
	syscon-cru = <&cru>; /* CRU_RESET */
	#reset-cells = <1>;
};

usb2-phy@??? {
	compatible = "brcm,ns-usb2-phy";
	syscon-cru = <&cru>; /* CRU_CLKSET_KEY */
	#phy-cells = <0>;
};

(apparently it wasn't a good idea)

So my question is: how to properly handle this? I'm not sure what's the
proper "compatible" string to use. Is my idea of:
1. Using sub-node for registers explicitly used by one driver
2. Using syscon for shared registers
OK?


[0] https://www.spinics.net/lists/arm-kernel/msg682838.html
[1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20181015093013.31651-1-zajec5@gmail.com/
[2] https://spinics.net/lists/linux-gpio/msg35285.html
[3] https://patchwork.kernel.org/patch/10735931/
[4] https://lkml.org/lkml/2019/1/15/913
[5] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20190108123907.19816-1-zajec5@gmail.com/
