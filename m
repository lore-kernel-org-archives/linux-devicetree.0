Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330EEC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 14:05:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 084D520657
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 14:05:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFq8Qquz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgEOOFv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 10:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726168AbgEOOFv (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 May 2020 10:05:51 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25E7C061A0C
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 07:05:50 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id y3so3748444wrt.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=4v9bretAYI6uT6+7ub/j/XC6Z562Kb4DSa23uXBjBx8=;
        b=iFq8QquzNT3+IX+0I06rZP+ykN+Pvw/yJRKOnE/1itw/ozlNfbRJO+5mT29yMik6ga
         x/XmVatUtb5E9z26jKaFgLzaMsWsLdMXKwIqOhTWpjdpoB/oPc+4qNdhwRrNJo+0RJKg
         VZhAw64hnooZTZV67AAG3K/Cmcnf8pGKtefPCKGeBKukt0acyZ5UsUsHZzNg9hxw9NRS
         cLNrsraIqEI+Vth6XuAZMx6CyNksaeNU9RrfHu2yofA5hRxFRcf4W3leR5JwmU6LJE4X
         53/Y2uesDCwrXP49UI4elx/XXv/Vf8V92C3KiltP8l2KsKorEsEdcQEY2x2FRGyB62/J
         89dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=4v9bretAYI6uT6+7ub/j/XC6Z562Kb4DSa23uXBjBx8=;
        b=Fl/+xG5jXy/pbzBb9ALn36fGdKvCbbf6tUogSHOj8BmzMYik4JoCnGebr6fIfuhoxT
         bhBt3k417dG17tqWs2Co+hAO3P7QrFxvTX2Hl7WM3vA9CztMwkqDIPgSqbwDvCn8/g67
         ydm1rvZh2YuX3RlEu6HFgFZ38SWgCv45aM11k6pQjnFcZ0awj9QxcUqij3VvLK3eMEfE
         wD/Zm6aSeOS6SfQmExfe5IDwRdmhB+p04APD1hIBkZcYj5t4hpmYQp4ejpTVPKu8IM7w
         0SwIH6fno8cnSRDKttMEzpMdpYHmLXLbN1OkAN5u+EW2pC0WHJ3+HuSojBU9yKvRo94r
         zhow==
X-Gm-Message-State: AOAM532F3tgbWUFJisy6uH4SkfmlUU8/z+YGAPdQpmFiOzgdTSkuF3VA
        ynJkr3z+hq32Pm8FgSGfsqSKUnC0
X-Google-Smtp-Source: ABdhPJwC7LVZjmfJIhkt1nw0e4EgeOrpjMiwr0Gmi2PK3Vcoe9TeDD1Bwofilv3FVVGuZuZWH74FHQ==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr4491318wru.83.1589551549102;
        Fri, 15 May 2020 07:05:49 -0700 (PDT)
Received: from vasteMachine (s559503e2.adsl.online.nl. [85.149.3.226])
        by smtp.gmail.com with ESMTPSA id h133sm4026568wmf.25.2020.05.15.07.05.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:05:48 -0700 (PDT)
Date:   Fri, 15 May 2020 16:05:46 +0200
From:   Jacko Dirks <jdirks.linuxdev@gmail.com>
To:     devicetree@vger.kernel.org
Subject: Fail to configure interrupt for new device
Message-ID: <20200515140546.GA31320@vasteMachine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

I am working on implementing a new device on the raspberry pi 4, an I2C
slave. The interrupt is not working, and I think I did something wrong
with the DTS. But I cannot quite figure out what it is.

Here is what I have so far:
In bcm2711-rpi-4-b.dts

	i2c_slave0_pins: i2cs0 {
		brcm,pins = <10 11>;
		brcm,function = <BCM2835_FSEL_ALT3>;
	};

In bcm2711.dtsi


		i2cs0: i2c_slave@7e214000 {
			compatible = "brcm,bcm2711-i2c-slave";
			reg = <0x7e214000 0x200>;
			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
			clocks = <&clocks BCM2835_CLOCK_VPU>;
			#address-cells = <1>;
			#size-cells = <0>;
			status = "disabled";
		};

Interrupt number 107 here is a guess. The guess goes as follows: In the
bcm2711 ARM periphials file there is a table on page 108. This table
shows my interrupt (SPI/BSC slave) to be at place 43. This table also
shows all I2C master interrupts to be at place 53. A I2C master 
interrupt uses number 117. 117 - (53 - 43) = 107. So, that approach
might be an issue.

Moreover, I have never specifed that I want that interrupt to be
attached to pin 11. There was a large renovation somewhat recently, but
before that I could drop a line like

interrupts = <2 11>;

Somewhere.

To be complete: here is the overlay:

/dts-v1/;
/plugin/;

/{
	compatible = "brcm,bcm2711";

	fragment@0 {
		target = <&i2cs0>;
		frag0: __overlay__ {
			status = "okay";
			pinctrl-names = "default";
			pinctrl-0 = <&i2c_slave0_pins>;
		};
	};
};

Any feedback or input would be very welcome.

Jacko Dirks
