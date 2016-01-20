From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: ARM: dts: sama5d4: add support for Ka-Ro electronics TXA5 modules
Date: Wed, 20 Jan 2016 13:35:34 +0100
Message-ID: <1453293337-16078-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Kumar Gala <galak@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds support for the Ka-Ro electronics TXA5 modules.

The first patch is a cleanup patch without functional changes.
The second patch adds some labels to DTS nodes which are used in the
third patch.

ARM: dts: sama5d4: cleanup - add blank lines between pinctrl nodes
ARM: dts: sama5d4: add labels for watchdog and pinctrl nodes
ARM: dts: sama5d4: add support for Ka-Ro electronics TXA5 modules
