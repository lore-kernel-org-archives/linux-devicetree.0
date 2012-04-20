From: Wolfram Sang <w.sang@pengutronix.de>
Subject: [PATCH] devicetree: bindings: gpio-i2c belongs to i2c not gpio
Date: Fri, 20 Apr 2012 17:08:02 +0200
Message-ID: <1334934487-19201-1-git-send-email-w.sang@pengutronix.de>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: Wolfram Sang <w.sang@pengutronix.de>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Randy Dunlap <rdunlap@xenotime.net>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

gpio-i2c describes an I2C controller (using gpios for data and clock),
so it must be described in i2c, not gpio.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 .../{gpio/gpio_i2c.txt => i2c/gpio-i2c.txt}        |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{gpio/gpio_i2c.txt => i2c/gpio-i2c.txt} (100%)

diff --git a/Documentation/devicetree/bindings/gpio/gpio_i2c.txt b/Documentation/devicetree/bindings/i2c/gpio-i2c.txt
similarity index 100%
rename from Documentation/devicetree/bindings/gpio/gpio_i2c.txt
rename to Documentation/devicetree/bindings/i2c/gpio-i2c.txt
-- 
1.7.9.5

