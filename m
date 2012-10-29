From: Pratyush Anand <pratyush.anand@st.com>
Subject: [PATCH 11/15] SPEAr1340-evb: dts: Enable PCIe0
Date: Mon, 29 Oct 2012 12:31:25 +0530
Message-ID: <4b9cf1f95d60f47ed8f50f493e8c779b278c8184.1351492562.git.pratyush.anand@st.com>
References: <cover.1351492562.git.pratyush.anand@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <cover.1351492562.git.pratyush.anand@st.com>
Sender: linux-pci-owner@vger.kernel.org
To: arnd@arndb.de, shiraz.hashim@st.com, viresh.linux@gmail.com
Cc: spear-devel@list.st.com, linux-pci@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, olof@lixom.net, Pratyush Anand <pratyush.anand@st.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Pratyush Anand <pratyush.anand@st.com>
---
 arch/arm/boot/dts/spear1340-evb.dts |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/spear1340-evb.dts b/arch/arm/boot/dts/spear1340-evb.dts
index fb5ae40..926781c 100644
--- a/arch/arm/boot/dts/spear1340-evb.dts
+++ b/arch/arm/boot/dts/spear1340-evb.dts
@@ -228,6 +228,10 @@
 			};
 		};
 
+		pcie0@b1000000 {
+			status = "okay";
+		};
+
 		ehci@e4800000 {
 			status = "okay";
 		};
-- 
1.7.5.4
