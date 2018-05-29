From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH] dt-bindings: fsi-master-gpio: Document "no-gpio-delays"
 property
Date: Tue, 29 May 2018 11:43:40 +1000
Message-ID: <1a2aaf52c2f4d948d55ccf3953db92528c296733.camel@kernel.crashing.org>
References: <20180529013044.23815-1-benh@kernel.crashing.org>
         <20180529013044.23815-6-benh@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180529013044.23815-6-benh@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>, Christopher Bostic <cbostic@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Support for this is being added to the driver but the original
patch forgot to add this documentation.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
index a767259dedad..1e442450747f 100644
--- a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
+++ b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
@@ -11,6 +11,10 @@ Optional properties:
  - trans-gpios = <gpio-descriptor>;	: GPIO for voltage translator enable
  - mux-gpios = <gpio-descriptor>;	: GPIO for pin multiplexing with other
                                           functions (eg, external FSI masters)
+ - no-gpio-delays;			: Don't add extra delays between GPIO
+                                          accesses. This is useful when the HW
+					  GPIO block is running at a low enough
+					  frequency.
 
 Examples:
 
