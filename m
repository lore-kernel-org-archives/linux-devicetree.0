From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 1/4] dt-bindings: mtd: make partitions doc a bit more generic
Date: Mon, 24 Apr 2017 14:41:17 +0200
Message-ID: <20170424124120.31613-2-zajec5@gmail.com>
References: <20170420135731.13272-2-zajec5@gmail.com>
 <20170424124120.31613-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170424124120.31613-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Currently the only documented partitioning is "fixed-partitions" but
there are more methods in use that we may want to support in the future.
Mention them and make it clear Fixed Partitions are just a single case.

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
This is based on Brian's patch:
[RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding

V1: Dropped "Section B: On-Flash Partition Tables" with Google's FMAP as this
    patchset doesn't add that new parser.
V2: Add "We currently only document a binding for fixed layouts." part
---
 .../devicetree/bindings/mtd/partition.txt          | 30 +++++++++++++++++-----
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index 81a224da63be..b5de311b967a 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -1,29 +1,47 @@
-Representing flash partitions in devicetree
+Flash partitions in device tree
+===============================
 
-Partitions can be represented by sub-nodes of an mtd device. This can be used
+Flash devices can be partitioned into one or more functional ranges (e.g. "boot
+code", "nvram", "kernel").
+
+Different devices may be partitioned in a different ways. Some may use a fixed
+flash layout set at production time. Some may use on-flash table that describes
+the geometry and naming/purpose of each functional region. It is also possible
+to see these methods mixed.
+
+To assist system software in locating partitions, we provide a binding to
+describe which method is used for a given flash.
+
+We currently only document a binding for fixed layouts.
+
+
+Fixed Partitions
+================
+
+Partitions can be represented by sub-nodes of a flash device. This can be used
 on platforms which have strong conventions about which portions of a flash are
 used for what purposes, but which don't use an on-flash partition table such
 as RedBoot.
 
-The partition table should be a subnode of the mtd node and should be named
+The partition table should be a subnode of the flash node and should be named
 'partitions'. This node should have the following property:
 - compatible : (required) must be "fixed-partitions"
 Partitions are then defined in subnodes of the partitions node.
 
-For backwards compatibility partitions as direct subnodes of the mtd device are
+For backwards compatibility partitions as direct subnodes of the flash device are
 supported. This use is discouraged.
 NOTE: also for backwards compatibility, direct subnodes that have a compatible
 string are not considered partitions, as they may be used for other bindings.
 
 #address-cells & #size-cells must both be present in the partitions subnode of the
-mtd device. There are two valid values for both:
+flash device. There are two valid values for both:
 <1>: for partitions that require a single 32-bit cell to represent their
      size/address (aka the value is below 4 GiB)
 <2>: for partitions that require two 32-bit cells to represent their
      size/address (aka the value is 4 GiB or greater).
 
 Required properties:
-- reg : The partition's offset and size within the mtd bank.
+- reg : The partition's offset and size within the flash
 
 Optional properties:
 - label : The label / name for this partition.  If omitted, the label is taken
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
