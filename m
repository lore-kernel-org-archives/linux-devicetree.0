From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH] ARM: dts: zynqmp: replace gpio-key,
 wakeup with wakeup-source property
Date: Fri, 21 Dec 2018 18:12:13 +0000
Message-ID: <20181221181213.6812-1-sudeep.holla@arm.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

Most of the legacy "gpio-key,wakeup" boolean property is already
replaced with "wakeup-source". However few occurrences of old property
has popped up again, probably from the remnants in downstream trees.

Replace the legacy properties with the unified "wakeup-source"
property introduced in the commit 700a38b27eef ("Input: gpio_keys -
switch to using generic device properties")

Cc: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 arch/arm/boot/dts/zynq-zturn.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Hi Michal,

Olof requested to slipt the patch and send it via platform maintainers.
I totally forgot to follow up on this. You had acked this previously but
please pick this up and submit via your tree to ARM SoC. Sorry for the
confusion.

Regards,
Sudeep

diff --git a/arch/arm/boot/dts/zynq-zturn.dts b/arch/arm/boot/dts/zynq-zturn.dts
index b38704657960..5ec616ebca08 100644
--- a/arch/arm/boot/dts/zynq-zturn.dts
+++ b/arch/arm/boot/dts/zynq-zturn.dts
@@ -54,7 +54,7 @@
 			label = "K1";
 			gpios = <&gpio0 0x32 0x1>;
 			linux,code = <0x66>;
-			gpio-key,wakeup;
+			wakeup-source;
 			autorepeat;
 		};
 	};
--
2.17.1
