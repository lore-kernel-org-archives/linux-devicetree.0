From: Benoit Cousson <b-cousson@ti.com>
Subject: [RFC PATCH 07/10] documentation/dt: Add spinlock bindings
Date: Wed, 24 Aug 2011 15:09:13 +0200
Message-ID: <1314191356-10963-8-git-send-email-b-cousson@ti.com>
References: <1314191356-10963-1-git-send-email-b-cousson@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1314191356-10963-1-git-send-email-b-cousson@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: grant.likely@secretlab.ca, tony@atomide.com
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, khilman@ti.com, devicetree-discuss@lists.ozlabs.org, manjugk@ti.com, Benoit Cousson <b-cousson@ti.com>, Randy Dunlap <rdunlap@xenotime.net>
List-Id: devicetree@vger.kernel.org

Add documentation for the HW spinlock in OMAP4.

Signed-off-by: Benoit Cousson <b-cousson@ti.com>
Cc: Randy Dunlap <rdunlap@xenotime.net>
---
 .../bindings/hwspinlock/omap-spinlock.txt          |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwspinlock/omap-spinlock.txt

diff --git a/Documentation/devicetree/bindings/hwspinlock/omap-spinlock.txt b/Documentation/devicetree/bindings/hwspinlock/omap-spinlock.txt
new file mode 100644
index 0000000..36ac074
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwspinlock/omap-spinlock.txt
@@ -0,0 +1,5 @@
+HW spinlock on OMAP platform:
+
+Required properties:
+- compatible : Must be "ti,omap-spinlock";
+- hwmods : "spinlock"
-- 
1.7.0.4

