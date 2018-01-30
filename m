From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V9 0/4] mtd: read partitions compatible prop for "ofpart" type
Date: Tue, 30 Jan 2018 21:10:55 +0100
Message-ID: <20180130201059.4424-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

This patchset provides a proper support for flash device DT node with
"partitions" subnode using "compatible" property. It's already
documented in the: Documentation/devicetree/bindings/mtd/partition.txt

We believed a previous version 8 was ready to go, but soon after landing
in the linux-next we got a regression report from Peter.

This version takes a safe path by:
1) Respecting parsers order as specified in the default/driver-provided
   list.
2) Looking at "compatible" property only when "ofpart" type gets
   speciied.

I double-checked the code and cannot think of any regression this could
cause. I also hope this design (roughly discussed with Boris) can be
acceptable for the mtd subsystem.

This is of course 4.17 material at best.

Brian Norris (1):
  mtd: partitions: add of_match_table parser matching

Rafał Miłecki (3):
  mtd: partitions: add special treating for the "ofpart" parser type
  mtd: rename "ofpart" parser to "fixed-partitions" as it fits it better
  mtd: ofpart: add of_match_table with "fixed-partitions"

 drivers/mtd/mtdpart.c          | 116 +++++++++++++++++++++++++++++++++++++----
 drivers/mtd/ofpart.c           |  18 +++++--
 include/linux/mtd/partitions.h |   1 +
 3 files changed, 121 insertions(+), 14 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
