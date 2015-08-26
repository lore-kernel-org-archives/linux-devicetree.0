From: Alexander Holler <holler@ahsoftware.de>
Subject: [PATCH 10/16] deps: dts: omap: beagle: make some remote-endpoints
 non-dependencies
Date: Wed, 26 Aug 2015 14:28:22 +0200
Message-ID: <1440592108-3740-11-git-send-email-holler@ahsoftware.de>
References: <1440592108-3740-1-git-send-email-holler@ahsoftware.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1440592108-3740-1-git-send-email-holler@ahsoftware.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Russel King <linux@arm.linux.org.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Greg KH <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Alexander Holler <holler@ahsoftware.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is necessary to remove dependency cycles introduced by
'remote-endpoints'.

Signed-off-by: Alexander Holler <holler@ahsoftware.de>
---
 arch/arm/boot/dts/omap3-beagle.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/omap3-beagle.dts b/arch/arm/boot/dts/omap3-beagle.dts
index a547411..78ba39e 100644
--- a/arch/arm/boot/dts/omap3-beagle.dts
+++ b/arch/arm/boot/dts/omap3-beagle.dts
@@ -101,6 +101,7 @@
 
 				tfp410_in: endpoint@0 {
 					remote-endpoint = <&dpi_out>;
+					no-dependencies = <&dpi_out>;
 				};
 			};
 
@@ -109,6 +110,7 @@
 
 				tfp410_out: endpoint@0 {
 					remote-endpoint = <&dvi_connector_in>;
+					no-dependencies = <&dvi_connector_in>;
 				};
 			};
 		};
@@ -150,6 +152,7 @@
 			etb_in: endpoint {
 				slave-mode;
 				remote-endpoint = <&etm_out>;
+				no-dependencies = <&etm_out>;
 			};
 		};
 	};
@@ -373,6 +376,7 @@
 	port {
 		venc_out: endpoint {
 			remote-endpoint = <&tv_connector_in>;
+			no-dependencies = <&tv_connector_in>;
 			ti,channels = <2>;
 		};
 	};
-- 
2.1.0
