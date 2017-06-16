From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 2/5] soc: bcm: brcmstb: Add Kconfig entry point for power management
Date: Fri, 16 Jun 2017 14:37:00 -0700
Message-ID: <20170616213703.21487-3-f.fainelli@gmail.com>
References: <20170616213703.21487-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170616213703.21487-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Markus Mayer <mmayer@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Eric Anholt <eric@anholt.net>, Justin Chen <justinpopo6@gmail.com>, Doug Berger <opendmb@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-kernel
List-Id: devicetree@vger.kernel.org

Add the necessary pluming to select and build CONFIG_BRCMSTB_PM.
Functional code is not added yet.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/soc/bcm/Kconfig          | 2 ++
 drivers/soc/bcm/brcmstb/Kconfig  | 8 ++++++++
 drivers/soc/bcm/brcmstb/Makefile | 1 +
 3 files changed, 11 insertions(+)
 create mode 100644 drivers/soc/bcm/brcmstb/Kconfig

diff --git a/drivers/soc/bcm/Kconfig b/drivers/soc/bcm/Kconfig
index 49f1e2a75d61..055a845ed979 100644
--- a/drivers/soc/bcm/Kconfig
+++ b/drivers/soc/bcm/Kconfig
@@ -20,4 +20,6 @@ config SOC_BRCMSTB
 
 	  If unsure, say N.
 
+source "drivers/soc/bcm/brcmstb/Kconfig"
+
 endmenu
diff --git a/drivers/soc/bcm/brcmstb/Kconfig b/drivers/soc/bcm/brcmstb/Kconfig
new file mode 100644
index 000000000000..996a75db015e
--- /dev/null
+++ b/drivers/soc/bcm/brcmstb/Kconfig
@@ -0,0 +1,8 @@
+if SOC_BRCMSTB
+
+config BRCMSTB_PM
+        bool "Support suspend/resume for STB platforms"
+        default y
+        depends on PM
+
+endif # SOC_BRCMSTB
diff --git a/drivers/soc/bcm/brcmstb/Makefile b/drivers/soc/bcm/brcmstb/Makefile
index 9120b2715d3e..ee5b4de741b8 100644
--- a/drivers/soc/bcm/brcmstb/Makefile
+++ b/drivers/soc/bcm/brcmstb/Makefile
@@ -1 +1,2 @@
 obj-y				+= common.o biuctrl.o
+obj-y				+= pm/
-- 
2.9.3
