From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V7 0/6] mtd: add support for subpartitions
Date: Wed, 21 Jun 2017 08:26:41 +0200
Message-ID: <20170621062647.6072-1-zajec5@gmail.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170526131415.27186-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>
Cc: Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

This patchset adds support for subpartitions. This feature means support
for partitions that are containers with extra subpartitions / volumes.

V7 splits the first patch into two separated ones (see 1/6 and 2/6). It
also rebases 3/6 on top of l2-mtd.git and its recent changes.

I hope this is acceptable & clean & clear enough.

Please let me know if you think further improvements should be added.

Rafał Miłecki (6):
  mtd: partitions: add helper for deleting partition
  mtd: partitions: remove sysfs files when deleting all master's
    partitions
  mtd: partitions: rename "master" to the "parent" where appropriate
  mtd: partitions: add support for subpartitions
  mtd: partitions: add support for partition parsers
  mtd: extract TRX parser out of bcm47xxpart into a separated module

 drivers/mtd/Kconfig              |   4 +
 drivers/mtd/Makefile             |   1 +
 drivers/mtd/bcm47xxpart.c        |  99 +------------
 drivers/mtd/mtdpart.c            | 311 +++++++++++++++++++++++----------------
 drivers/mtd/parsers/Kconfig      |   8 +
 drivers/mtd/parsers/Makefile     |   1 +
 drivers/mtd/parsers/parser_trx.c | 126 ++++++++++++++++
 include/linux/mtd/partitions.h   |   7 +
 8 files changed, 336 insertions(+), 221 deletions(-)
 create mode 100644 drivers/mtd/parsers/Kconfig
 create mode 100644 drivers/mtd/parsers/Makefile
 create mode 100644 drivers/mtd/parsers/parser_trx.c

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
