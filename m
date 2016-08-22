From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 3/4] arm64: dts: hikey: Add hikey support for
 syscon-reboot-mode
Date: Mon, 22 Aug 2016 15:48:04 -0700
Message-ID: <1471906085-16682-3-git-send-email-john.stultz@linaro.org>
References: <1471906085-16682-1-git-send-email-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1471906085-16682-1-git-send-email-john.stultz@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, John Stultz <john.stultz@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add support to hikey dts for the syscon-reboot-mode driver.

After trying an approach using a sram driver and node, a number
of issues cropped up which would make it so we would be
duplicating a lot of extra syscon infrastructure in order to
support mfds on sram. After talking with Bjorn, using the
syscon driver for this seems like an better choice.

Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Guodong Xu <guodong.xu@linaro.org>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 8597e9b..4492a15 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -29,6 +29,7 @@
 	 * Reserve below regions from memory node:
 	 *
 	 *  0x05e0,0000 - 0x05ef,ffff: MCU firmware runtime using
+	 *  0x05f0,1000 - 0x05f0,1fff: Reboot reason
 	 *  0x06df,f000 - 0x06df,ffff: Mailbox message data
 	 *  0x0740,f000 - 0x0740,ffff: MCU firmware section
 	 *  0x3e00,0000 - 0x3fff,ffff: OP-TEE
@@ -36,11 +37,26 @@
 	memory@0 {
 		device_type = "memory";
 		reg = <0x00000000 0x00000000 0x00000000 0x05e00000>,
-		      <0x00000000 0x05f00000 0x00000000 0x00eff000>,
+		      <0x00000000 0x05f00000 0x00000000 0x00001000>,
+		      <0x00000000 0x05f02000 0x00000000 0x00efd000>,
 		      <0x00000000 0x06e00000 0x00000000 0x0060f000>,
 		      <0x00000000 0x07410000 0x00000000 0x36bf0000>;
 	};
 
+	reboot-mode-syscon@5f01000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0x0 0x05f01000 0x0 0x00001000>;
+
+		reboot-mode {
+			compatible = "syscon-reboot-mode";
+			offset = <0x0>;
+
+			mode-normal	= <0x77665501>;
+			mode-bootloader	= <0x77665500>;
+			mode-recovery	= <0x77665502>;
+		};
+	};
+
 	soc {
 		spi0: spi@f7106000 {
 			status = "ok";
-- 
1.9.1
