From: James Hogan <james.hogan@imgtec.com>
Subject: [PATCH v3 06/15] dt: binding: add binding for ImgTec IR block
Date: Fri, 7 Feb 2014 15:49:15 +0000
Message-ID: <1391788155-29191-1-git-send-email-james.hogan@imgtec.com>
References: <CAL_JsqLL6MbwajCUAm+NJk=ofL5OHq8b0zwO3LFb-TKY6UtVMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLL6MbwajCUAm+NJk=ofL5OHq8b0zwO3LFb-TKY6UtVMQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: James Hogan <james.hogan@imgtec.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: devicetree@vger.kernel.org

Add device tree binding for ImgTec Consumer Infrared block, specifically
major revision 1 of the hardware.

Signed-off-by: James Hogan <james.hogan@imgtec.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: linux-media@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org
Cc: Rob Landley <rob@landley.net>
Cc: linux-doc@vger.kernel.org
Cc: Tomasz Figa <tomasz.figa@gmail.com>
---
v3:
- Rename compatible string to "img,ir-rev1" (Rob Herring).
- Specify ordering of clocks explicitly (Rob Herring).

v2:
- Future proof compatible string from "img,ir" to "img,ir1", where the 1
  corresponds to the major revision number of the hardware (Tomasz
  Figa).
- Added clock-names property and three specific clock names described in
  the manual, only one of which is used by the current driver (Tomasz
  Figa).
---
 .../devicetree/bindings/media/img-ir-rev1.txt      | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/img-ir-rev1.txt

diff --git a/Documentation/devicetree/bindings/media/img-ir-rev1.txt b/Documentation/devicetree/bindings/media/img-ir-rev1.txt
new file mode 100644
index 000000000000..5434ce61b925
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/img-ir-rev1.txt
@@ -0,0 +1,34 @@
+* ImgTec Infrared (IR) decoder version 1
+
+This binding is for Imagination Technologies' Infrared decoder block,
+specifically major revision 1.
+
+Required properties:
+- compatible:		Should be "img,ir-rev1"
+- reg:			Physical base address of the controller and length of
+			memory mapped region.
+- interrupts:		The interrupt specifier to the cpu.
+
+Optional properties:
+- clocks:		List of clock specifiers as described in standard
+			clock bindings.
+			Up to 3 clocks may be specified in the following order:
+			1st:	Core clock (defaults to 32.768KHz if omitted).
+			2nd:	System side (fast) clock.
+			3rd:	Power modulation clock.
+- clock-names:		List of clock names corresponding to the clocks
+			specified in the clocks property.
+			Accepted clock names are:
+			"core":	Core clock.
+			"sys":	System clock.
+			"mod":	Power modulation clock.
+
+Example:
+
+	ir@02006200 {
+		compatible = "img,ir-rev1";
+		reg = <0x02006200 0x100>;
+		interrupts = <29 4>;
+		clocks = <&clk_32khz>;
+		clock-names =  "core";
+	};
-- 
1.8.1.2


