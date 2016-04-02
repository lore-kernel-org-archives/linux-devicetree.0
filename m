From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] ARM: dts: armv7-m: add address to unit name
Date: Fri,  1 Apr 2016 23:08:19 -0700
Message-ID: <1459577299-2818-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de
Cc: mcoquelin.stm32@gmail.com, u.kleine-koenig@pengutronix.de, shawnguo@kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Add address to unit name to remove the following warning:
 Warning (unit_address_vs_reg): Node /nv-interrupt-controller has a
 reg or ranges property, but no unit name

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Hi Arnd,

Not sure through which tree this should go but an earlier patch
seemd to be applied directly by you...
