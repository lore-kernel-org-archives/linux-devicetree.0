From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH V2 0/3] Add Spreadtrum SP9860G support
Date: Tue, 21 Feb 2017 14:55:01 +0800
Message-ID: <1487660104-15693-1-git-send-email-chunyan.zhang@spreadtrum.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, catalin.marinas@arm.com, will.deacon@arm.com, arnd@arndb.de
Cc: devicetree@vger.kernel.org, orson.zhai@spreadtrum.com, zhang.lyra@gmail.com, linux-kernel@vger.kernel.org, sudeep.holla@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

SC9860 is a Spreadtrum SoC with eight Cortex A53, which are divided
into 4 Big cores and 4 little cores.

This patch-set only provides a basic configuration for SC9860 in device
tree to make it run to console.  We will continue to submit other drivers
later on, which are using on Spreadtrum's SoCs.

Changes from v1:
* Removed useless idle-state node 'deep_sleep' from DT
* Removed useless property 'sc-id' from DT
* Removed 'clock-frequency' property from the node 'timer'
* Added another compatible string '"arm,cortex-a53-pmu"' and property
  'interrupt-affinity' for pmu
* Kept using the existed compatible string of sprd_serial driver, and added
  a new one for sc9860 in DT.

Thanks,
Chunyan

Chunyan Zhang (1):
  Documentation: sprd: Add bindings for SP9860G

Orson Zhai (1):
  arm64: dts: Add basic DT to support Spreadtrum's SP9860G

Wei Qiao (1):
  serial: sprd: adjust TIMEOUT to a big value

 Documentation/devicetree/bindings/arm/sprd.txt     |  13 +-
 .../devicetree/bindings/serial/sprd-uart.txt       |  16 +-
 arch/arm64/boot/dts/sprd/Makefile                  |   3 +-
 arch/arm64/boot/dts/sprd/sc9860.dtsi               | 531 +++++++++++++++++++++
 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts          |  56 +++
 arch/arm64/boot/dts/sprd/whale2.dtsi               |  70 +++
 drivers/tty/serial/sprd_serial.c                   |   2 +-
 7 files changed, 683 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/sprd/sc9860.dtsi
 create mode 100644 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
 create mode 100644 arch/arm64/boot/dts/sprd/whale2.dtsi

-- 
2.7.4
