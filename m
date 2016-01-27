From: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Subject: [PATCH 09/13] dtb: amd: Add KCS device tree node
Date: Wed, 27 Jan 2016 15:11:57 -0600
Message-ID: <1453929121-12171-10-git-send-email-Suravee.Suthikulpanit@amd.com>
References: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453929121-12171-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, arnd@arndb.de
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, arm@kernel.org, brijeshkumar.singh@amd.com, thomas.lendacky@amd.com, leo.duran@amd.com, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: devicetree@vger.kernel.org

From: Brijesh Singh <brijeshkumar.singh@amd.com>

Add KCS device node to support IPMI solution on Overdrive
system.

Signed-off-by: Brijesh Singh <brijeshkumar.singh@amd.com>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
index c5461b2..a7fc059 100644
--- a/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
+++ b/arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi
@@ -236,5 +236,16 @@
 			reg = <0x0 0xe8000000 0 0x1000000>;
 			interrupts = <0 380 4>;
 		};
+
+		ipmi_kcs: kcs@e0010000 {
+			status = "disabled";
+			compatible = "ipmi-kcs";
+			device_type = "ipmi";
+			reg = <0x0 0xe0010000 0 0x8>;
+			interrupts = <0 389 4>;
+			interrupt-names = "ipmi_kcs";
+			reg-size = <1>;
+			reg-spacing = <4>;
+		};
 	};
 };
-- 
2.5.0
