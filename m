From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: mtd: document Broadcom's BCM47xx partitions
Date: Fri, 12 Jan 2018 10:33:53 +0100
Message-ID: <20180112093354.17593-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Broadcom based home router devices use partitions which have to be
discovered in a specific non-standard way. As there is no partition
table this commit adds and describes a new custom binding.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 .../devicetree/bindings/mtd/partition.txt          | 46 +++++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index 36f3b769a626..b201d497b618 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -14,8 +14,6 @@ method is used for a given flash device. To describe the method there should be
 a subnode of the flash device that is named 'partitions'. It must have a
 'compatible' property, which is used to identify the method to use.
 
-We currently only document a binding for fixed layouts.
-
 
 Fixed Partitions
 ================
@@ -109,3 +107,47 @@ flash@2 {
 		};
 	};
 };
+
+
+Broadcom BCM47xx Partitions
+===========================
+
+Broadcom is one of hardware manufacturers providing SoCs (BCM47xx) used in
+home routers. Their BCM947xx boards using CFE bootloader have several partitions
+without any on-flash partition table. On some devices their sizes and/or
+meanings can also vary so fixed partitioning can't be used.
+
+Discovering partitions on these devices is possible thanks to having a special
+header and/or magic signature at the beginning of each of them. They are also
+block aligned which is important for determinig a size.
+
+Most of partitions use ASCII text based magic for determining a type. More
+complex partitions (like TRX with its HDR0 magic) may include extra header
+containing some details, including a length.
+
+A list of supported partitions includes:
+1) Bootloader with Broadcom's CFE (Common Firmware Environment)
+2) NVRAM with configuration/calibration data
+3) Device manufacturer's data with some default values (e.g. SSIDs)
+4) TRX firmware container which can hold up to 4 subpartitions
+5) Backup TRX firmware used after failed upgrade
+
+As mentioned earlier, role of some partitions may depend on extra configuration.
+For example both: main firmware and backup firmware use the same TRX format with
+the same header. To distinguish currently used firmware a CFE's environment
+variable "bootpartition" is used.
+
+
+Devices using Broadcom partitions described above should should have flash node
+with a subnode named "partitions" using following properties:
+
+Required properties:
+- compatible : (required) must be "brcm,bcm947xx-cfe-partitions"
+
+Example:
+
+flash@0 {
+	partitions {
+		compatible = "brcm,bcm947xx-cfe-partitions";
+	};
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
