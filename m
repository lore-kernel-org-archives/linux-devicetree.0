From: Pratyush Anand <pratyush.anand@st.com>
Subject: [PATCH 12/15] SPEAr1310-EVB: DTS: Fix PCIe1 enable
Date: Mon, 29 Oct 2012 12:31:26 +0530
Message-ID: <b0da4af3263beb2d747a3e81d91e0cf7b4a70312.1351492562.git.pratyush.anand@st.com>
References: <cover.1351492562.git.pratyush.anand@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <cover.1351492562.git.pratyush.anand@st.com>
Sender: linux-pci-owner@vger.kernel.org
To: arnd@arndb.de, shiraz.hashim@st.com, viresh.linux@gmail.com
Cc: spear-devel@list.st.com, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, olof@lixom.net, Pratyush Anand <pratyush.anand@st.com>
List-Id: devicetree@vger.kernel.org

On SPEAr1310 EVB only PCIe2 can be used as PCIe host. Currently we do not
have driver for PCIe EP. So keep PCIe1 disabled.

Signed-off-by: Pratyush Anand <pratyush.anand@st.com>
---
 arch/arm/boot/dts/spear1310-evb.dts |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/spear1310-evb.dts b/arch/arm/boot/dts/spear1310-evb.dts
index 2c8da65..1bb5332 100644
--- a/arch/arm/boot/dts/spear1310-evb.dts
+++ b/arch/arm/boot/dts/spear1310-evb.dts
@@ -237,10 +237,6 @@
 			ignore_cpufreq_notification = <0>;
 		};
 
-		pcie1@b1800000 {
-			status = "okay";
-		};
-
 		pcie2@b4000000 {
 			status = "okay";
 		};
-- 
1.7.5.4
