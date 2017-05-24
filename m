From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V5 0/4] mtd: add support for subpartitions
Date: Wed, 24 May 2017 11:44:33 +0200
Message-ID: <20170524094437.2174-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

This patchset adds support for subpartitions. This feature means support
for partitions that are containers with extra subpartitions / volumes.

Initially I wanted to keep my changes minimalistic but Brian pointed
that casting const to non-const is hacky and I should work with
add_mtd_partitions / allocate_partition instead.

Apart from trivial rename I needed to add 1 condition to the
allocate_partition and modify 3 lines of code. I hope this is
acceptable.

Please let me know if you can still see any problems with this.

Rafał Miłecki (4):
  mtd: partitions: rename allocate_partition master argument to the
    parent
  mtd: partitions: add support for allocating subpartition
  mtd: partitions: add support for partition parsers
  mtd: extract TRX parser out of bcm47xxpart into a separated module

 drivers/mtd/Kconfig              |   4 +
 drivers/mtd/Makefile             |   1 +
 drivers/mtd/bcm47xxpart.c        |  99 ++---------------------
 drivers/mtd/mtdpart.c            | 170 +++++++++++++++++++++++++--------------
 drivers/mtd/parsers/Kconfig      |   8 ++
 drivers/mtd/parsers/Makefile     |   1 +
 drivers/mtd/parsers/parser_trx.c | 126 +++++++++++++++++++++++++++++
 include/linux/mtd/partitions.h   |   7 ++
 8 files changed, 260 insertions(+), 156 deletions(-)
 create mode 100644 drivers/mtd/parsers/Kconfig
 create mode 100644 drivers/mtd/parsers/Makefile
 create mode 100644 drivers/mtd/parsers/parser_trx.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
