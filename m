From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 0/4] mtd: extend support for "fixed-partitions"
Date: Mon, 24 Apr 2017 14:41:16 +0200
Message-ID: <20170424124120.31613-1-zajec5@gmail.com>
References: <20170420135731.13272-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170420135731.13272-2-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

My recent work on adding wide support for linux,part-probe was reviewed and
kind of Nack-ed, but fortunately I was pointed to the old (!) patchset from
Brian doing similar thing in a cleaner way.

This patchset picks the important changes from Brian, cleans them and rebases.

Original patches:
(not picked) [RFC PATCH 1/7] mtd: move partition parsers to drivers/mtd/partitions/
(not picked) [RFC PATCH 2/7] mtd: move partition parsers' Kconfig under a sub-menu
(partially)  [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
(picked)     [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and of_mtd_match_mtd_parser() helpers
(partially)  [RFC PATCH 5/7] mtd: partitions: factor out "match by name" handling
(picked)     [RFC PATCH 6/7] RFC: mtd: partitions: enable of_match_table matching
(not picked) [RFC PATCH 7/7] mtd: partitions: add Google's FMAP partition parser

At this point this simply adds a full support for "fixed-partitions" binding.
It should also make adding new bindings (like Google's FMAP) easier in the
future.

I've successfully tested this with bcm47xxsflash driver on Tenda AC9 device. I
used following DT node to get "ofpart" driver parse & register my partitions.

&bcma-sflash {
	partitions {
		compatible = "fixed-partitions";
		#address-cells = <1>;
		#size-cells = <1>;

		partition@0 {
			label = "cfe";
			reg = <0x0000000 0x40000>;
			read-only;
		};

		firmware@40000 {
			label = "firmware";
			reg = <0x40000 0x7f0000>;
		};
	};
};

V2: Modify patch 1/4
    Include list of original patches in 0/4
    Include changelog in every patch
    Add Brian's tags (Acked/Reviewed/Tested)

Brian Norris (3):
  dt-bindings: mtd: make partitions doc a bit more generic
  mtd: partitions: factor out code calling parser
  mtd: partitions: add of_match_table parser matching

Rafał Miłecki (1):
  mtd: ofpart: add of_match_table with "fixed-partitions"

 .../devicetree/bindings/mtd/partition.txt          | 30 ++++++--
 drivers/mtd/mtdpart.c                              | 80 +++++++++++++++++++---
 drivers/mtd/ofpart.c                               |  7 ++
 include/linux/mtd/partitions.h                     |  1 +
 4 files changed, 103 insertions(+), 15 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
