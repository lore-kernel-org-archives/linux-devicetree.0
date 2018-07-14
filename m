From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/5] dt-bindings: add vendor prefix for Shenzhen Oranth
 Technology Co., Ltd.
Date: Sat, 14 Jul 2018 21:37:21 +0200
Message-ID: <20180714193725.17837-2-martin.blumenstingl@googlemail.com>
References: <20180714193725.17837-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180714193725.17837-1-martin.blumenstingl@googlemail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, khilman@baylibre.com
Cc: mark.rutland@arm.com, narmstrong@baylibre.com, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, yixun.lan@amlogic.com, robh+dt@kernel.org, carlo@caione.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
List-Id: devicetree@vger.kernel.org

According to their website (http://www.oranth.com/about-oranth/)
Shenzhen Oranth Technology Co., Ltd. (or simply "Oranth") "is a
professional Design House & Manufacturer for Android TV Box established
in 2014". One of their brands is Tanix (sometimes also spelled "TANIX").

One of their most popular devices is the "Tanix TX3 Mini" TV box (which
uses the Amlogic S905W chipset).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 7cad066191ee..5b9a96d863ee 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -271,6 +271,7 @@ opalkelly	Opal Kelly Incorporated
 opencores	OpenCores.org
 openrisc	OpenRISC.io
 option	Option NV
+oranth	Shenzhen Oranth Technology Co., Ltd.
 ORCL	Oracle Corporation
 orisetech	Orise Technology
 ortustech	Ortus Technology Co., Ltd.
-- 
2.18.0
