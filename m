From: Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH v5 4/4] ARM: dts: Enable USB host1(dwc) on rk3288-evb
Date: Fri,  8 Aug 2014 11:55:59 +0800
Message-ID: <1407470159-14722-5-git-send-email-kever.yang@rock-chips.com>
References: <1407470159-14722-1-git-send-email-kever.yang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1407470159-14722-1-git-send-email-kever.yang@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Zimmerman <paulz@synopsys.com>, heiko@sntech.de
Cc: dianders@chromium.org, olof@lixom.net, sonnyrao@chromium.org, addy.ke@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, wulf@rock-chips.com, lyz@rock-chips.com, hj@rock-chips.com, huangtao@rock-chips.com, Kever Yang <kever.yang@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

USB host1 port is the host A port nearby the otg port.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

---

Changes in v5:
- don't enable otg port for evb

Changes in v4: None
Changes in v3:
- Rebase

Changes in v2:
- evb patch added in version 2

 arch/arm/boot/dts/rk3288-evb.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288-evb.dtsi b/arch/arm/boot/dts/rk3288-evb.dtsi
index 4f57209..4b62df6 100644
--- a/arch/arm/boot/dts/rk3288-evb.dtsi
+++ b/arch/arm/boot/dts/rk3288-evb.dtsi
@@ -94,3 +94,7 @@
 &usb_host0_ehci {
 	status = "okay";
 };
+
+&usb_host1 {
+	status = "okay";
+};
-- 
1.9.1
