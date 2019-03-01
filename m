From: <sean.wang@mediatek.com>
Subject: [PATCH v2 0/2] Bluetooth: mediatek: add support for MediaTek MT7663U and MT7668U UART devices
Date: Fri, 1 Mar 2019 10:14:06 +0800
Message-ID: <cover.1551405664.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

v2: changes since v1
- add Rob's review tag
- removed these merged patches

This adds the support of enabling MT7668U and MT7663U UART based Bluetooth
function running on the top of btmtkuart driver.

We are through several patches to reach the goal and also wish applied
the same flow in MediaTek btusb [1] for the transport independence.
Once [1] and the series is being merged and then in next step I will
consider to add a btmtk.c to hold these independent operations among
various transport reused by MediaTek UART, USB and SDIO-based Bluetooth.

Firstly,
in patch 1/6 to update the dt-binding document for the kind of devices.
in patch 2/6, 3/6 to fix the common error issues in the current code.
in Patch 4/6, 5/6 to add the general flow which MT7622 and even MT7663U and
MT7668U USB devices also utilize.

Finally, in patch 6/6 to add the specific setups for MediaTek UART-based
Bluetooth and enable MT7663U and MT7668U device.

[1] http://lists.infradead.org/pipermail/linux-mediatek/2019-January/017074.html 

Sean Wang (2):
  dt-bindings: net: bluetooth: add support for MediaTek MT7663U and
    MT7668U UART devices
  Bluetooth: mediatek: add support for MediaTek MT7663U and MT7668U UART
    devices

 .../bindings/net/mediatek-bluetooth.txt       |  64 ++++
 drivers/bluetooth/btmtkuart.c                 | 281 +++++++++++++++++-
 2 files changed, 335 insertions(+), 10 deletions(-)

-- 
2.18.0
