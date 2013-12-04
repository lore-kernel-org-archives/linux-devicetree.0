From: Feng Kan <fkan@apm.com>
Subject: [PATCH 0/4] Add missing components for X-Gene reboot drivers.
Date: Wed,  4 Dec 2013 10:32:59 -0800
Message-ID: <1386181979-26547-1-git-send-email-fkan@apm.com>
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
To: patches@apm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Feng Kan <fkan@apm.com>
List-Id: devicetree@vger.kernel.org

Add dts node for X-Gene reboot driver. Apply documentation dts binding.
Some minor compile warning fix and enable reboot driver by default.

Feng Kan (4):
  Documentation: add dts binding for X-Gene reboot dts node.
  arm64: add missing dts entry for X-Gene platform.
  arm64: Enable system reset via arch Kconfig for X-Gene system.
  arm64: removed using of the mask attribute in the dts for reset bit.

 .../devicetree/bindings/arm64/xgene/reboot.txt     |   11 +++++++++++
 arch/arm64/Kconfig                                 |    1 +
 arch/arm64/boot/dts/apm-storm.dtsi                 |    5 +++++
 drivers/power/reset/xgene-reboot.c                 |    5 ++---
 4 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm64/xgene/reboot.txt

-- 
1.7.6.1
