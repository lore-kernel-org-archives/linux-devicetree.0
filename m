From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: [PATCH 0/3] Add EHCI support for Armada 37xx
Date: Wed,  8 Mar 2017 17:24:20 +0100
Message-ID: <20170308162423.25553-1-gregory.clement@free-electrons.com>
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

The EHCI controller in the Armada 37xx SoCs is the one used on many
other mvebu SoCs such as the orion5x, the kirkwood, or the
armada. However, for Armada 37xx an extra initialization step is
needed: this is the purpose of the first patch.

The second patch allows to build the driver for the ARM64 Armada SoCs.

The last one enables the EHCI in the device tree.

Thanks,

Gregory

Gregory CLEMENT (2):
  usb: host: Allow to build ehci orion with mvebu SoCs
  ARM64: dts: marvell: armada-37xx: Add USB2 node

jinghua (1):
  usb: orion-echi: Add support for the Armada 3700

 .../devicetree/bindings/usb/ehci-orion.txt         |  4 ++-
 arch/arm64/boot/dts/marvell/armada-3720-db.dts     |  6 ++++
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |  7 ++++
 drivers/usb/host/Kconfig                           |  2 +-
 drivers/usb/host/ehci-orion.c                      | 39 ++++++++++++++++++++++
 5 files changed, 56 insertions(+), 2 deletions(-)

-- 
2.11.0
