Return-Path: <SRS0=2Ix+=4H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD768C34050
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 10:32:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96E9C208E4
	for <linux-devicetree@archiver.kernel.org>; Wed, 19 Feb 2020 10:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgBSKcl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 19 Feb 2020 05:32:41 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48957 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgBSKcl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 19 Feb 2020 05:32:41 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j4Meh-0000nA-Tr; Wed, 19 Feb 2020 11:32:35 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j4Meh-0008SQ-2y; Wed, 19 Feb 2020 11:32:35 +0100
Date:   Wed, 19 Feb 2020 11:32:35 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     kernel@pengutronix.de, Geert Uytterhoeven <geert@glider.be>,
        linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Subject: enabling a regulator before doing an ADC measurement
Message-ID: <20200219103235.u2roy3uchlrxqgqw@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello,

I have a hardware setup that looks as follows:

                                ,-------------------.
 ,---------.       ,---/ -------| current-regulator |
 |  ADC    |       |            `-------------------'
 |      CH0--------+
 |         |       |
 `.........'    ,-----.
                |PT100|
		`-----'
		   |
		   ⏚

So the idea is that I enable the regulator and then measure the adc's
input to determine the resistance of the PT100 and so its temperature.

I wonder if/how I should represent that in my device's device tree. I
discussed this already a bit with Geert on irc and he came up with
something like:

	adc {
		...
		channel@0 {
			reg = <0>;
			supply = <&myregulator>;
		};
	};

with the intention that the adc driver enables myregulator before
starting a measurement on channel 0.

Does this sound sensible? Does something like this maybe even already
exist and I missed it?

What is a bit special here is that usually a regulator is used to supply
a device and it's just enabled at probe time (or when the device is
started to be used) and disabled when done. Here the regulator is
supposed to be enabled only during a measurement[1] to yield the reference
current and doesn't supply a device. So maybe better use another
property name instead of plain "supply", maybe "reference-supply"?

Best regards
Uwe

[1] When the current measurement is done, the regulator must be swiched
off again to not warm up the PT100 and so fudge future measurements.

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
