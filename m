From: <sean.wang@mediatek.com>
Subject: [PATCH 0/6]Bluetooth: mediatek: add support for MediaTek MT7663U and
 MT7668U UART devices
Date: Fri, 15 Feb 2019 07:19:32 +0800
Message-ID: <cover.1550184473.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang@mediatek.com>

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

Sean Wang (6):
  dt-bindings: net: bluetooth: add support for MediaTek MT7663U and
    MT7668U UART devices
  Bluetooth: mediatek: trivial typo fix
  Bluetooth: mediatek: fix up an error path to restore bdev->tx_state
  Bluetooth: mediatek: pass a pointer to mtk_hci_wmt_sync
  Bluetooth: mediatek: update the common setup between MT7622 and other
    devices
  Bluetooth: mediatek: add support for MediaTek MT7663U and MT7668U UART
    devices

 .../bindings/net/mediatek-bluetooth.txt       |  64 +++
 drivers/bluetooth/btmtkuart.c                 | 538 ++++++++++++++++--
 2 files changed, 569 insertions(+), 33 deletions(-)

-- 
2.18.0
