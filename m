From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: [PATCH 2/3] mfd: cros_ec_spi: Add additional compatible string for NI version
Date: Wed, 28 Sep 2016 09:59:20 -0700
Message-ID: <1475081961-3858-2-git-send-email-moritz.fischer@ettus.com>
References: <1475081961-3858-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475081961-3858-1-git-send-email-moritz.fischer@ettus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, emilio.lopez@collabora.co.uk, javier@osg.samsung.com, treding@nvidia.com, shawnguo@kernel.org, jarkko.sakkinen@linux.intel.com, dmitry.torokhov@gmail.com, antonynpavlov@gmail.com, devicetree@vger.kernel.org, moritz.fischer.private@gmail.com, julia@ni.com, Moritz Fischer <moritz.fischer@ettus.com>
List-Id: devicetree@vger.kernel.org

Document the alternative compatibility string for the NI version
of the chromium embedded controller.

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 Documentation/devicetree/bindings/mfd/cros-ec.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Documentation/devicetree/bindings/mfd/cros-ec.txt
index 136e0c2..c49afa9 100644
--- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
@@ -14,7 +14,7 @@ Required properties (I2C):
 - reg: I2C slave address
 
 Required properties (SPI):
-- compatible: "google,cros-ec-spi"
+- compatible: "google,cros-ec-spi" or "ni,cros-ec-spi"
 - reg: SPI chip select
 
 Optional properties (SPI):
-- 
2.7.4
