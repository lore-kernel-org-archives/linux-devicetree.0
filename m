From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 1/2] mtd: partitions: add of_match_table parser matching
Date: Wed, 28 Jun 2017 23:19:31 +0200
Message-ID: <CAOiHx=kkOfQpj-aUdck25WDQQkpwxRh8CDJAmP=ymSMm02K_Vg@mail.gmail.com>
References: <20170624231025.23292-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170624231025.23292-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, MTD Maling List <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 25 June 2017 at 01:10, Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Partition parsers can now provide an of_match_table to enable
> flash<-->parser matching via device tree.
>
> This support is currently limited to built-in parsers as it uses
> request_module() and friends. This should be sufficient for most cases
> though as compiling parsers as modules isn't a common choice.
>
> Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

I gave this and Rafa=C5=82's recent patches a spin and split out
bcm63xxpart's imagetag parsing into its own parser as a partition
parser assigned to the imagetag partition, then added an
of_match_table to bcm63xxpart, and it worked beautifully:

[    1.111302] m25p80 spi1.0: s25fl129p1 (16384 Kbytes)
[    1.117222] bcm63xxpart: Partition 0 is CFE offset 0 and length 10000
[    1.127313] bcm63xxpart: Partition 1 is nvram offset ff0000 and length 1=
0000
[    1.134604] bcm63xxpart: Partition 2 is linux offset 10000 and length fe=
0000
[    1.141927] 3 bcm63xxpart partitions found on MTD device spi1.0
[    1.148032] Creating 3 MTD partitions on "spi1.0":
[    1.152945] 0x000000000000-0x000000010000 : "CFE"
[    1.161004] 0x000000ff0000-0x000001000000 : "nvram"
[    1.169777] 0x000000010000-0x000000ff0000 : "linux"
[    1.179489] parser_bcm63xx_imagetag: rootfs: CFE image tag found at
0x0 with version 6, board type 96328avng
[    1.189671] parser_bcm63xx_imagetag: Partition 0 is kernel offset
100 and length 151f52
[    1.197902] parser_bcm63xx_imagetag: Partition 1 is rootfs offset
152052 and length e8dfae
[    1.206405] parser_bcm63xx_imagetag: Spare partition is offset
350004 and length c8fffc
[    1.214738] 2 bcm63xx-imagetag partitions found on MTD device linux
[    1.221201] Creating 2 MTD partitions on "linux":
[    1.226032] 0x000000000100-0x000000152052 : "kernel"
[    1.234445] 0x000000152052-0x000000fe0000 : "rootfs"

Things I did:
1) having just the compatible for bcm63xxpart: bcm63xxpart was used.
2) bcm63xxpart, then fixed-partitions as two compatible strings:
bcm63xxpart was used.
3) fixed-partitons, then bcm63xxpart: ofpart was used.
4) non-existent compatible, then fixed-partitons: ofpart was used.

then I ran out of ideas to test.

I guess this might be enough for a

Tested-by: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


Regards
Jonas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
