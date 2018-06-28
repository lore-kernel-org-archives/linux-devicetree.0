From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Subject: [PATCH 2/2] regulator: bd71837: Remove duplicate description from DT
 bindings
Date: Thu, 28 Jun 2018 14:23:04 +0300
Message-ID: <b4d847919a7c72365478240f443debd2601a073e.1530184909.git.matti.vaittinen@fi.rohmeurope.com>
References: <3f1f74f57cbe2d4af395219da841df63daedc1f7.1530184909.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3f1f74f57cbe2d4af395219da841df63daedc1f7.1530184909.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, andy.shevchenko@gmail.com, axel.lin@ingics.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Same general chip description was written in MFD and Regulator
binding documents for ROHM bd71837 PMIC. Remove description from
regulator binding as suggested by Rob H.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 .../devicetree/bindings/regulator/rohm,bd71837-regulator.txt      | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
index 4edf3137d9f7..76ead07072b1 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
@@ -1,13 +1,5 @@
 ROHM BD71837 Power Management Integrated Circuit (PMIC) regulator bindings
 
-BD71837MWV is a programmable Power Management
-IC (PMIC) for powering single-core, dual-core, and
-quad-core SoC’s such as NXP-i.MX 8M. It is optimized
-for low BOM cost and compact solution footprint. It
-integrates 8 Buck regulators and 7 LDO’s to provide all
-the power rails required by the SoC and the commonly
-used peripherals.
-
 Required properties:
  - regulator-name: should be "buck1", ..., "buck8" and "ldo1", ..., "ldo7"
 
-- 
2.14.3
