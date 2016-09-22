From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 0/3] watchdog: dw_wdt: add reset lines
Date: Thu, 22 Sep 2016 09:02:29 +0200
Message-ID: <1474527753-22194-1-git-send-email-s.trumtrar@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-watchdog@vger.kernel.org
Cc: kernel@pengutronix.de, Steffen Trumtrar <s.trumtrar@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

This series adds support for the reset line that is
(potentially) holding the watchdog in reset.

As the watchdog is useless if this happens, it needs to be deasserted
in the probe function.
Additionally, the reset is the only way of stopping a once started watchdog.
This was previously not supported, so add the stop operation to the watchdog ops.

Tested on the SoCFPGA platform.

Regards,
Steffen

Steffen Trumtrar (3):
  watchdog: bindings: dw_wdt: add reset lines
  watchdog: dw_wdt: get reset lines from dt
  watchdog: dw_wdt: add stop watchdog operation

 .../devicetree/bindings/watchdog/dw_wdt.txt        |  5 +++++
 drivers/watchdog/dw_wdt.c                          | 25 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.8.1
