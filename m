From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] Documentation: bindings: fix palmas-rtc documentation
Date: Tue, 19 Apr 2016 17:42:52 +0200
Message-ID: <185436a6e4b162dce97d0036faf11cf828918d97.1461080571.git.hns@goldelico.com>
References: <cover.1461080571.git.hns@goldelico.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1461080571.git.hns@goldelico.com>
In-Reply-To: <cover.1461080571.git.hns@goldelico.com>
References: <cover.1461080571.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 Documentation/devicetree/bindings/rtc/rtc-palmas.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/rtc-palmas.txt b/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
index adbccc0..eb1c7fd 100644
--- a/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
+++ b/Documentation/devicetree/bindings/rtc/rtc-palmas.txt
@@ -15,9 +15,9 @@ Optional properties:
 	battery is chargeable or not. If charging battery then driver can
 	enable the charging.
 - ti,backup-battery-charge-high-current: Enable high current charging in
-	backup battery. Device supports the < 100mA and > 100mA charging.
-	The high current will be > 100mA. Absence of this property will
-	charge battery to lower current i.e. < 100mA.
+	backup battery. Device supports the < 100uA and > 100uA charging.
+	The high current will be > 100uA. Absence of this property will
+	charge battery to lower current i.e. < 100uA.
 
 Example:
 	palmas: tps65913@58 {
-- 
2.7.3
