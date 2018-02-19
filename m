Return-Path: <SRS0=/mGh=FN=electromag.com.au=preid@kernel.org>
From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH v4 0/3] pinctrl: mcp32s08: add open drain config for irq
Date: Mon, 19 Feb 2018 17:25:17 +0800
Message-Id: <1519032320-103817-1-git-send-email-preid@electromag.com.au>
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, sre@kernel.org, preid@electromag.com.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, jan.kundrat@cesnet.cz
List-ID: <devicetree@vger.kernel.org>

This is a continuation of patch 2/3 from my previous version
The patches related to irq polarity dropped for the moment as that needs 
more work.

Changes from v3:
- Add a fix for probing mcp23s18
- Add reviewed-by and acked-by
- Rebased on pinctrl/for-next

Changes from v2:
- Use standard 'drive-open-drain' for irq output configuration


Phil Reid (3):
  pinctrl: mcp23s08: fix probing of mcp23s18
  dt-bindings: pinctrl: mcp23s08: add documentation for drive-open-drain
  pinctrl: mcp23s08: add open drain configuration for irq output

 Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.txt | 2 ++
 drivers/pinctrl/pinctrl-mcp23s08.c                             | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
1.8.3.1
