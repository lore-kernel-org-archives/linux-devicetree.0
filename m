From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/3] microblaze: dts: replace 'linux,stdout-path' with 'stdout-path'
Date: Tue, 27 Mar 2018 21:07:00 -0500
Message-ID: <20180328020700.17050-4-robh@kernel.org>
References: <20180328020700.17050-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180328020700.17050-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

'linux,stdout-path' has been deprecated for some time in favor of
'stdout-path'. Now dtc will warn on occurrences of 'linux,stdout-path'.
Search and replace the one occurrence with 'stdout-path'.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Michal Simek <monstr@monstr.eu>
Cc: devicetree@vger.kernel.org
---
 arch/microblaze/boot/dts/system.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/microblaze/boot/dts/system.dts b/arch/microblaze/boot/dts/system.dts
index b620da23febb..8a420c6702eb 100644
--- a/arch/microblaze/boot/dts/system.dts
+++ b/arch/microblaze/boot/dts/system.dts
@@ -44,7 +44,7 @@
 	} ;
 	chosen {
 		bootargs = "console=ttyUL0,115200 highres=on";
-		linux,stdout-path = "/plb@0/serial@84000000";
+		stdout-path = "/plb@0/serial@84000000";
 	} ;
 	cpus {
 		#address-cells = <1>;
-- 
2.14.1
