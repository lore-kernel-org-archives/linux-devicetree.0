From: Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/2] add device tree probe support for gpio_keys
Date: Tue, 19 Jul 2011 00:45:06 +0800
Message-ID: <1311007508-8096-1-git-send-email-shawn.guo@linaro.org>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: linux-input@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

The first patch gets the driver stop referencing platform_data after
.probe exits.  And the second patch adds the actual device tree probe
support for the driver.

Shawn Guo (2):
      Input: gpio-keys: do not reference platform_data after .probe exits
      Input: gpio-keys: add device tree probe support

 Documentation/devicetree/bindings/gpio/key.txt |   57 +++++++++++
 drivers/input/keyboard/gpio_keys.c             |  128 +++++++++++++++++++-----
 2 files changed, 161 insertions(+), 24 deletions(-)
