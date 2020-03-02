Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED113C3F2CD
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 17:51:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF2C52173E
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 17:51:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="UUxYtZ0a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgCBRv1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 12:51:27 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:52187 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbgCBRv1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 12:51:27 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 9FF7223E25;
        Mon,  2 Mar 2020 18:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1583171483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=74cE+QG1nhyUA4/MJKl/6UbDqN8vbWum2t0uZBLB5XA=;
        b=UUxYtZ0arZoQis3cpv8GVzRiyLFZi56mbN0pSMf33huompXOurGAv6joLxFDzdukZg0PEg
        TOpjTDqNDHowtvZZUHG6yVA4c+FbmHQbgw5VkjWyW4bW3qaxF1Y/UCiz5NoVbC8L1+7Z/7
        RgXfyXGPJIHdYvySmtgn6o8gnH7q5dc=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Mar 2020 18:51:23 +0100
From:   Michael Walle <michael@walle.cc>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     devicetree@vger.kernel.org
Subject: RFC Board management controller, MFD and device tree
Message-ID: <0e3e8204ab992d75aa07fc36af7e4ab2@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: +
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 9FF7223E25
X-Spamd-Result: default: False [1.40 / 15.00];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[4];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         DKIM_SIGNED(0.00)[];
         DBL_PROHIBIT(0.00)[0.0.0.4:email,0.0.0.0:email,0.0.0.10:email,0.0.0.1:email];
         NEURAL_HAM(-0.00)[-0.178];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         MID_RHS_MATCH_FROM(0.00)[];
         SUSPICIOUS_RECIPS(1.50)[]
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

fHi

now that the basic support for the sl28 board is upstream I'd want to
continue with the onboard management CPLD. Connected via I2C, the CPLD
has different building blocks at different internal addresses. Eg. there
is a watchog, GPIO, PWM, interrupt controller and a fan monitoring.
Somehow like a PMIC but without the regulator support. The basic
building blocks might be there multiple times, eg. there are two PWM
controllers (at different internal addresses) and multiple GPIO
controllers. But due to size constraints some of them are output-only
and some of them are input only. This board management CPLD might be
reused by other boards but with different components inside at
different addresses. Thus, naturally this is a MFD.

How would you implement this regarding the device tree binding? At the
moment there are individual drivers (like in gpio/, pwm/ watchdog/,..)
and one MFD driver which basically just exports one regmap, which is
fetched by the individual drivers by dev_get_regmap(pdev->dev.parent).
The current device tree binding is as follows:

&i2c {
         sl28cpld@4a {
                 #address-cells = <1>;
                 #size-cells = <0>;
                 compatible = "kontron,sl28cpld";
                 reg = <0x4a>;

                 watchdog@4 {
                         compatible = "kontron,sl28cpld-wdt";
                         reg = <0x4>;
                 };

                 hwmon@b {
                         compatible = "kontron,sl28cpld-hwmon";
                         reg = <0xb>;
                 };

                 pwm0: pwm@c {
                         #pwm-cells = <2>;
                         compatible = "kontron,sl28cpld-pwm";
                         reg = <0xc>;
                 };

                 pwm1: pwm@e {
                         #pwm-cells = <2>;
                         compatible = "kontron,sl28cpld-pwm";
                         reg = <0xe>;
                 };

                 gpio0: gpio-controller@10 {
                         compatible = "kontron,sl28cpld-gpio";
                         reg = <0x10>;
                         interrupt-parent = <&gpio2>;
                         interrupts = <6 IRQ_TYPE_EDGE_FALLING>;

                         gpio-controller;
                         #gpio-cells = <2>;
                         gpio-line-names = "a", "b", "c";

                         interrupt-controller;
                         #interrupt-cells = <2>;
                 };

                 gpio1: gpio-controller@1a {
                         compatible = "kontron,sl28cpld-gpo";
                         reg = <0x1a>;
                         gpio-controller;
                         #gpio-cells = <2>;
                 };

                 intc: interrupt-controller@1c {
                         compatible = "kontron,sl28cpld-intc";
                         reg = <0x1c>;
                         interrupt-parent = <&gpio2>;
                         interrupts = <6 IRQ_TYPE_EDGE_FALLING>;

                         interrupt-controller;
                         #interrupt-cells = <2>;
                 };
                 [..snip..]

Note that the reg property is the internal offset of the building block.
Because there might be multiple variants of this CPLD on different
boards, the register map is not fixed. Thus individual drivers need to
know the base offset of their registers. At the moment, they read the
reg property using of_get_address(np, 0, NULL, NULL) to get the base
offset.

This is working but has some drawbacks. First of all, that might fall
into the category "this is no information about the hardware and thus
should not go into the device tree". Second, if there is an update in
the future I would like to be able to support also these CPLDs. Eg. you
can read a global version register and for example know that since this
version something has changed like the register map. Thus it might make
sense to have the base offsets inside the MFD base driver, where they
can be adjusted in _probe(). I guess that also falls into the first
argument to not have to much information in the device tree.

I've looked into how you could do the second implementation. The MFD can
pass the register offset via resources and IORESOURCE_REG like the
wm831x-core.c does it. Also the interrupt which in the device tree above
is a property of the children (which I think is kinda hacky), could be
a property of the mfd and passed to the children with IORESOURCE_IRQ.

What is still missing is the device tree binding. Eg. if I need to have
a phandle to the first pwm controller. Here, I could think of two
different implementations:

&i2c {
         bmc: sl28cpld@4a {
                 #address-cells = <1>;
                 #size-cells = <0>;
                 compatible = "kontron,sl28cpld";
                 reg = <0x4a>;
                 interrupt-parent = <&gpio2>;
                 interrupts = <6 IRQ_TYPE_EDGE_FALLING>;

                 gpio-controller;
                 #gpio-cells = <2>;

                 interrupt-controller;
                 #interrupt-cells = <2>;

                 #pwm-cells = <2>;
};

&i2c {
         sl28cpld@4a {
                 #address-cells = <1>;
                 #size-cells = <0>;
                 compatible = "kontron,sl28cpld";
                 reg = <0x4a>;

                 watchdog {
                         compatible = "kontron,sl28cpld-wdt";
                 };

                 hwmon {
                         compatible = "kontron,sl28cpld-hwmon";
                 };

                 pwm0: pwm@0 {
                         #pwm-cells = <2>;
                         compatible = "kontron,sl28cpld-pwm";
                         reg = <0>;
                 };

                 pwm1: pwm@1 {
                         #pwm-cells = <2>;
                         compatible = "kontron,sl28cpld-pwm";
                         reg = <1>;
                 };

                 gpio0: gpio-controller@0 {
                         compatible = "kontron,sl28cpld-gpio";
                         reg = <0>;

                         gpio-controller;
                         #gpio-cells = <2>;
                         gpio-line-names = "a", "b", "c";

                         interrupt-controller;
                         #interrupt-cells = <2>;
                 };

                 gpio1: gpio-controller@1a {
                         compatible = "kontron,sl28cpld-gpo";
                         reg = <0x1a>;
                         gpio-controller;
                         #gpio-cells = <2>;
                 };

                 intc: interrupt-controller {
                         compatible = "kontron,sl28cpld-intc";

                         interrupt-controller;
                         #interrupt-cells = <2>;
                 };
                 [..snip..]
};

The first implementation would just be some kind of super node which
exposes all features, eg. you'd do "pwms = <&bmc 0>;" or "gpios = <&bmc
0 GPIO_ACTIVE_LOW>;". I don't know it this is a good idea or if this is
even possible.

The second one is almost like the current implemention only that there
are no register offsets or irqs in the child nodes. But because there
might be two children of the same building block (eg. two pwm nodes)
the reg property is now an ID.

Phew, that was a long mail. I wanted to know your thoughts/ideas if
  (1) the current solution would be accepted, (if one would life with the
      drawback of not being able to detect multiple verions of the CPLD
      on runtime)
  (2) whould you do the super-node contains everything or the more
      elaborate device tree.

I tend to have the last one (the more elaborate device tree). The mfd
core can already match mfd_cells to device tree nodes, but only if the
compatible string is unique (see mfd_add_device()). Eg. the current code
would match the mfd cells with of_compatible = "kontron,sl28cpld-pwm"
only to the first node. I thought of also comparing the reg property
against the id property of struct mfd_cell.

-michael
