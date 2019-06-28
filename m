From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 33/39] docs: phy: place documentation under driver-api
Date: Fri, 28 Jun 2019 09:30:26 -0300
Message-ID: <df0337d37a924dcfa1f528734ffd3bae430d93c4.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kamil Debski <kamil@wypas.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This subsystem-specific documentation belongs to the
driver-api.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 .../devicetree/bindings/phy/phy-bindings.txt     |  2 +-
 .../devicetree/bindings/phy/phy-pxa-usb.txt      |  2 +-
 Documentation/driver-api/index.rst               |  1 +
 Documentation/driver-api/phy/index.rst           | 16 ++++++++++++++++
 .../{phy.txt => driver-api/phy/phy.rst}          |  0
 .../{ => driver-api}/phy/samsung-usb2.rst        |  0
 Documentation/index.rst                          |  1 -
 MAINTAINERS                                      |  2 +-
 8 files changed, 20 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/driver-api/phy/index.rst
 rename Documentation/{phy.txt => driver-api/phy/phy.rst} (100%)
 rename Documentation/{ => driver-api}/phy/samsung-usb2.rst (100%)

diff --git a/Documentation/devicetree/bindings/phy/phy-bindings.txt b/Documentation/devicetree/bindings/phy/phy-bindings.txt
index a403b81d0679..c4eb38902533 100644
--- a/Documentation/devicetree/bindings/phy/phy-bindings.txt
+++ b/Documentation/devicetree/bindings/phy/phy-bindings.txt
@@ -1,5 +1,5 @@
 This document explains only the device tree data binding. For general
-information about PHY subsystem refer to Documentation/phy.txt
+information about PHY subsystem refer to Documentation/driver-api/phy/phy.rst
 
 PHY device node
 ===============
diff --git a/Documentation/devicetree/bindings/phy/phy-pxa-usb.txt b/Documentation/devicetree/bindings/phy/phy-pxa-usb.txt
index 93fc09c12954..d80e36a77ec5 100644
--- a/Documentation/devicetree/bindings/phy/phy-pxa-usb.txt
+++ b/Documentation/devicetree/bindings/phy/phy-pxa-usb.txt
@@ -15,4 +15,4 @@ Example:
 	};
 
 This document explains the device tree binding. For general
-information about PHY subsystem refer to Documentation/phy.txt
+information about PHY subsystem refer to Documentation/driver-api/phy/phy.rst
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index d6f532c8d824..12d68c3ab792 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -85,6 +85,7 @@ available subsections can be seen below.
    parport-lowlevel
    pps
    ptp
+   phy/index
    pti_intel_mid
    pwm
    rfkill
diff --git a/Documentation/driver-api/phy/index.rst b/Documentation/driver-api/phy/index.rst
new file mode 100644
index 000000000000..fce9ffae2812
--- /dev/null
+++ b/Documentation/driver-api/phy/index.rst
@@ -0,0 +1,16 @@
+=====================
+Generic PHY Framework
+=====================
+
+.. toctree::
+
+   phy
+   samsung-usb2
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
+
diff --git a/Documentation/phy.txt b/Documentation/driver-api/phy/phy.rst
similarity index 100%
rename from Documentation/phy.txt
rename to Documentation/driver-api/phy/phy.rst
diff --git a/Documentation/phy/samsung-usb2.rst b/Documentation/driver-api/phy/samsung-usb2.rst
similarity index 100%
rename from Documentation/phy/samsung-usb2.rst
rename to Documentation/driver-api/phy/samsung-usb2.rst
diff --git a/Documentation/index.rst b/Documentation/index.rst
index 28e6b5ef17b4..ea33cbbccd9d 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -112,7 +112,6 @@ needed).
    usb/index
    misc-devices/index
    mic/index
-   phy/samsung-usb2
    scheduler/index
 
 Architecture-specific documentation
diff --git a/MAINTAINERS b/MAINTAINERS
index 856db8015edd..cda68bbd9d1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14031,7 +14031,7 @@ M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/phy/samsung-phy.txt
-F:	Documentation/phy/samsung-usb2.rst
+F:	Documentation/driver-api/phy/samsung-usb2.rst
 F:	drivers/phy/samsung/phy-exynos4210-usb2.c
 F:	drivers/phy/samsung/phy-exynos4x12-usb2.c
 F:	drivers/phy/samsung/phy-exynos5250-usb2.c
-- 
2.21.0
