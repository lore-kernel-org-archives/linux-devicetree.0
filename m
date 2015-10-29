From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH v1 6/6] arm64: dts: Enable the Thermal on R88 board
Date: Thu, 29 Oct 2015 15:14:18 +0800
Message-ID: <1446102858-10116-7-git-send-email-wxt@rock-chips.com>
References: <1446102858-10116-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446102858-10116-1-git-send-email-wxt@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Eduardo Valentin <edubezval@gmail.com>
Cc: linux-rockchip@lists.infradead.org, Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch enable the TS-ADC.

When a thermal temperature is invoked use the CRU to reset the chip
on R88 board. TSHUT is low active on this board.

Signed-off-by: Caesar Wang <wxt@rock-chips.com>

---

Changes in v1: None

 arch/arm64/boot/dts/rockchip/rk3368-r88.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
index 401a812..7684426a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-r88.dts
@@ -336,6 +336,12 @@
 	status = "okay";
 };
 
+&tsadc {
+	rockchip,hw-tshut-mode = <0>; /* tshut mode 0:CRU 1:GPIO */
+	rockchip,hw-tshut-polarity = <0>; /* tshut polarity 0:LOW 1:HIGH */
+	status = "okay";
+}
+
 &uart2 {
 	status = "okay";
 };
-- 
1.9.1
