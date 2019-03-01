From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH v2 1/4] dt-bindings: Add vendor prefix for MaxBotix
Date: Fri, 1 Mar 2019 14:41:57 +0100
Message-ID: <20190301134155.ujtl434di6eb7jir@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-iio@vger.kernel.org
Cc: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, arnd@arndb.de, davem@davemloft.net, gregkh@linuxfoundation.org, johan@kernel.org, khilman@baylibre.com, knaack.h@gmx.de, lars@metafoo.de, linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com, mchehab+samsung@kernel.org, m.othacehe@gmail.com, nicolas.ferre@microchip.com, pmeerw@pmeerw.net, robh@kernel.org, songqiang1304521@gmail.com, treding@nvidia.com, techsupport@maxbotix.com
List-Id: devicetree@vger.kernel.org

Add MaxBotix, which is a vendor of ultrasonic rangers in different
varieties and interfaces.

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389508584f48..added54a1108 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -225,6 +225,7 @@ lsi	LSI Corp. (LSI Logic)
 lwn	Liebherr-Werk Nenzing GmbH
 macnica	Macnica Americas
 marvell	Marvell Technology Group Ltd.
+maxbotix	MaxBotix Inc.
 maxim	Maxim Integrated Products
 mbvl	Mobiveil Inc.
 mcube	mCube
-- 
2.11.0
