From: "Bean Huo (beanhuo)" <beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Date: Wed, 22 Mar 2017 13:20:04 +0000
Message-ID: <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <538805ebf8e64015a8b833de755652b3-aBoyCxvc2dBaXkNJqdKpEhSpLNRU/VIH@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "richard-/L3Ra7n9ekc@public.gmane.org" <richard-/L3Ra7n9ekc@public.gmane.org>, Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

>+micron_nand_read_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip
>*chip,
>+                                                         uint8_t *buf, int oob_required,
>+                                                         int page)
>+{
>+             int status;
>+             int max_bitflips = 0;
>+
>+             micron_nand_on_die_ecc_setup(chip, true);
>+
>+             chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>+             chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
>+             status = chip->read_byte(mtd);
>+             if (status & NAND_STATUS_FAIL)
>+                           mtd->ecc_stats.failed++;
>+             /*
>+             * The internal ECC doesn't tell us the number of bitflips
>+             * that have been corrected, but tells us if it recommends to
>+             * rewrite the block. If it's the case, then we pretend we had
>+             * a number of bitflips equal to the ECC strength, which will
>+             * hint the NAND core to rewrite the block.
>+             */
>+             else if (status & NAND_STATUS_WRITE_RECOMMENDED)
>+                           max_bitflips = chip->ecc.strength;
>+
>+             chip->cmdfunc(mtd, NAND_CMD_READ0, -1, -1);
>+
>+             nand_read_page_raw(mtd, chip, buf, oob_required, page);
>+
>+             micron_nand_on_die_ecc_setup(chip, false);
>+
>+             return max_bitflips;
>+}


Hi, 
Let me give you some information, hopefully you can do some modification based on above codes.

I noticed that this patches are based on MT29F1G08ABADAWP SLC NAND, it is our 60s 34nm SLC NAND.
So far, we have 2 series SLC NAND with implementations of on die ECC.
1. M79A for all 25nm (70series) SLC NAND with on-die ECC (M78A, M79A, and future design M70A)
2. M60A for all 34nm (60series) SLC NAND with on-die ECC

NAND_STATUS_FAIL:
For the both of series SLC NAND with on-die ECC, SR bit 0 (NAND_STATUS_FAIL) indicates an uncorrectable read fail,
data is lost, no recovery possible, unless we have software additional protection, the block is not necessarily
bad but the data is lost.

NAND_STATUS_WRITE_RECOMMENDED:

For the NAND_STATUS_WRITE_RECOMMENDED, it only works on 60s NAND, it is 4 bit ECC, the status register only
indicates if there is 0 or 1-4 correctable error bits. We don't want to trigger refresh if only 1 or 2 bits fail.
the base refresh is that if there 3 or 4 bitflips. But unfortunately we can't get failed bit count trough read status register. 
SW workaround proposal:
1. If SR bit 3 is set to 1 it means 1~4 bitflips and correctable.
2. Read out the page with ECC ON
3. Read out the page with ECC OFF
4. Compare the data
5. Count the number of bitflips for the sectors (there are 4 ECC sectors)
6. if 3 or more fail bits, trigger fresh. 
I know this is not good solution, but if as long as NAND_STATUS_WRITE_RECOMMENDED is set, and trigger refresh,
this will definitely increase NAND PE cycle.

For the 70s, it is 8 bits on-die ECC, the status register can report 7-8 bitflips (refresh recommended), 4-6 bitflips and 1-3 bitflips.
So we can trigger refresh according to its bitflips status.

Thanks.
//beanhuo


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
