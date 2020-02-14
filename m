Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90810C2BA83
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 11:10:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6D5922082F
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 11:10:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbgBNLKm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 06:10:42 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:54327 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728522AbgBNLKm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 06:10:42 -0500
Received: from [5.158.153.55] (helo=adam.guests.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.80)
        (envelope-from <bage@linutronix.de>)
        id 1j2Yro-00043V-2s; Fri, 14 Feb 2020 12:10:40 +0100
From:   bage@linutronix.de
To:     devicetree@vger.kernel.org
Cc:     Bastian Germann <bage@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 0/3] dts: Add Linutronix Testbox
Date:   Fri, 14 Feb 2020 12:10:00 +0100
Message-Id: <20200214111003.11115-1-bage@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200206113328.7296-1-bage@linutronix.de>
References: <20200206113328.7296-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

The Testbox board is an open hardware enhancement for the Lamobo R1 router
board.  The Testbox board is used in the CI-RT project to manage devices
under test (https://ci-rt.linutronix.de).

This series adds the device tree for that board and the necessary bindings.

Changelog
  v2: - change the lx binding vendor to linutronix
      - drop Lamobo R1 dts license header SPDX change
      - drop extracting a dtsi from Lamobo R1 dts
      - include Lamobo R1's dts instead of dtsi in the new dts
      - drop the pinctrl nodes from the leds node in the new dts

Bastian Germann (3):
  dt-bindings: Add vendor prefix for Linutronix
  dt-bindings: arm: sunxi: Add Linutronix Testbox
  ARM: dts: sun7i: Add Linutronix Testbox v2 board

 .../devicetree/bindings/arm/sunxi.yaml        |  6 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm/boot/dts/Makefile                    |  1 +
 .../dts/sun7i-a20-linutronix-testbox-v2.dts   | 56 +++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun7i-a20-linutronix-testbox-v2.dts

-- 
2.20.1

