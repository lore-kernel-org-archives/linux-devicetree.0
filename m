From: Tomasz Duszynski <tduszyns@gmail.com>
Subject: [PATCH 2/2] dt-bindings: iio: chemical: pms7003: extend supported sensors list
Date: Sun, 17 Feb 2019 20:22:13 +0100
Message-ID: <20190217192213.15803-3-tduszyns@gmail.com>
References: <20190217192213.15803-1-tduszyns@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190217192213.15803-1-tduszyns@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-iio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Tomasz Duszynski <tduszyns@gmail.com>
List-Id: devicetree@vger.kernel.org

Add other sensors to the compatible list.

Signed-off-by: Tomasz Duszynski <tduszyns@gmail.com>
---
 .../bindings/iio/chemical/plantower,pms7003.txt           | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
index 7b5f06f324c8..c52ea2126eaa 100644
--- a/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
+++ b/Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.txt
@@ -1,7 +1,13 @@
 * Plantower PMS7003 particulate matter sensor
 
 Required properties:
-- compatible: must be "plantower,pms7003"
+- compatible: must one of:
+   "plantower,pms1003"
+   "plantower,pms3003"
+   "plantower,pms5003"
+   "plantower,pms6003"
+   "plantower,pms7003"
+   "plantower,pmsa003"
 - vcc-supply: phandle to the regulator that provides power to the sensor
 
 Optional properties:
-- 
2.20.1
