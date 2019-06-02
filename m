From: <sean.wang@mediatek.com>
Subject: [PATCH v1 0/4] add boot-gpios and clock property to btmtkuart
Date: Sun, 2 Jun 2019 09:04:13 +0800
Message-ID: <1559437457-26766-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

Update dt-binding and the corresponding implmentation of boot-gpios and clock
property to btmtkuart.

Sean Wang (4):
  dt-bindings: net: bluetooth: add boot-gpios property to UART-based
    device
  dt-bindings: net: bluetooth: add clock property to UART-based device
  Bluetooth: btmtkuart: add an implementation for boot-gpios property
  Bluetooth: btmtkuart: add an implementation for clock osc property

 .../bindings/net/mediatek-bluetooth.txt       | 17 +++++++
 drivers/bluetooth/btmtkuart.c                 | 51 +++++++++++++++----
 2 files changed, 58 insertions(+), 10 deletions(-)

-- 
2.17.1
