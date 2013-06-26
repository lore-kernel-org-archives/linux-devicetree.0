From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: [PATCH 0/3] watchdog: dw_wdt: common clock framework and devicetree support
Date: Wed, 26 Jun 2013 20:03:12 +0200
Message-ID: <201306262003.13256.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@iguana.be>
Cc: Jamie Iles <jamie@jamieiles.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This small series changes the dw_wdt driver, so that it is usable on
machines using the common clock framework (needs the clk to be prepared)
and devicetree (needs a binding).

Heiko Stuebner (3):
  watchdog: dw_wdt: convert to SIMPLE_DEV_PM_OPS
  watchdog: dw_wdt: use clk_prepare_enable and clk_disable_unprepare
  watchdog: dw_wdt: add a devicetree binding

 .../bindings/watchdog/snps-dw-apb-wdt.txt          |   18 ++++++++++++
 drivers/watchdog/dw_wdt.c                          |   31 ++++++++++++--------
 2 files changed, 36 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/snps-dw-apb-wdt.txt

-- 
1.7.10.4
