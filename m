From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] i2c: rcar: document R8A77970 bindings
Date: Fri, 13 Oct 2017 15:23:55 +0300
Message-ID: <20171013122401.540656908@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline; filename=i2c-rcar-document-R8A77970-bindings.patch
Sender: linux-i2c-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
List-Id: devicetree@vger.kernel.org

R-Car V3M (R8A77970) SoC also has the R-Car gen3 compatible I2C controller,
so document  the SoC specific bindings.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 Documentation/devicetree/bindings/i2c/i2c-rcar.txt |    1 +
 1 file changed, 1 insertion(+)

Index: linux/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
===================================================================
--- linux.orig/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
+++ linux/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
@@ -13,6 +13,7 @@ Required properties:
 	"renesas,i2c-r8a7794" if the device is a part of a R8A7794 SoC.
 	"renesas,i2c-r8a7795" if the device is a part of a R8A7795 SoC.
 	"renesas,i2c-r8a7796" if the device is a part of a R8A7796 SoC.
+	"renesas,i2c-r8a77970" if the device is a part of a R8A77970 SoC.
 	"renesas,rcar-gen1-i2c" for a generic R-Car Gen1 compatible device.
 	"renesas,rcar-gen2-i2c" for a generic R-Car Gen2 or RZ/G1 compatible
 				device.
