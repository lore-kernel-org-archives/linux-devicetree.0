Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail.karo-electronics.de ([81.173.242.67]:50482 "EHLO
	mail.karo-electronics.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752557Ab3IBNEN (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 2 Sep 2013 09:04:13 -0400
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: [PATCH v2 1/3] ARM: dts: mxs: add pinctrl header files
Date: Mon,  2 Sep 2013 15:03:53 +0200
Message-Id: <1378127036-24861-1-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <20130812072957.GB25061@S2101-09.ap.freescale.net>
References: <20130812072957.GB25061@S2101-09.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Shawn Guo <shawn.guo@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>
List-ID: <devicetree@vger.kernel.org>

Changes vs. v2:
- move header files to arch/arm/boot/dts
- update documentation file to use the defined names rather than
  numeric values and remove the pinmux-id list

These patches add header files for the MXS arch to
arch/arm/boot/dts and convert the DTS files to use the pad
definitions from thoose files rather than hardcoding the pinctrl
values.

The conversion from numerical representation to symbolic names has
been done with a perl script that checked the definitions for
consistency of the pin function comments and the numerical values
used.

This revealed an inconsistency in:
arch/arm/boot/dts/imx28-apx4devkit.dts, which pretended to use
MX28_PAD_SSP2_SS0__GPIO_2_19 in the comment (equivalent to 0x2133),
but actually was using MX28_PAD_SSP2_SS0__AUART3_TX by the numerical
value 0x2131.

I decided to use the (probably wrong) assignment
MX28_PAD_SSP2_SS0__AUART3_TX because that is what is actually
configured without this patch. A comment stating the old setup has
been added to the .dts file.

