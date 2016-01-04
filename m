From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v4 net-next 0/3] Add new capability and macb DT variant
Date: Mon,  4 Jan 2016 10:42:50 +0100
Message-ID: <1451900573-22657-1-git-send-email-narmstrong@baylibre.com>
References: <1451898103-21868-1-git-send-email-narmstrong@baylibre.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1451898103-21868-1-git-send-email-narmstrong@baylibre.com>
Sender: netdev-owner@vger.kernel.org
To: nicolas.ferre@atmel.com, davem@davemloft.net, harini.katakam@xilinx.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, joshc@ni.com, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

The first patch introduces a new capability bit to disable usage of the
USRIO register on platform not implementing it thus avoiding some external
imprecise aborts on ARM based platforms.
The two last patchs adds a new macb variant compatible name using the
capability, the NPx name is temporary and must be fixed when the first patch
hits mainline.

Only the first patch should be merged right now until the compatible name
is fixed.

v1: http://lkml.kernel.org/r/1449485914-12883-1-git-send-email-narmstrong@baylibre.com
v2: http://lkml.kernel.org/r/1449582726-6148-1-git-send-email-narmstrong@baylibre.com
v3: http://lkml.kernel.org/r/1451898103-21868-1-git-send-email-narmstrong@baylibre.com
v4: as nicolas suggested, use a new macb config and a new product/vendor prefix

Neil Armstrong (3):
  net: ethernet: cadence-macb: Add disabled usrio caps
  net: macb: Add NPx macb config using USRIO_DISABLED cap
  dt-bindings: net: macb: Add NPx macb variant

 Documentation/devicetree/bindings/net/macb.txt |  1 +
 drivers/net/ethernet/cadence/macb.c            | 33 ++++++++++++++++----------
 drivers/net/ethernet/cadence/macb.h            |  1 +
 3 files changed, 23 insertions(+), 12 deletions(-)

-- 
1.9.1
