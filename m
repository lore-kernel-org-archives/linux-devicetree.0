From: Andreas Fenkart <afenkart@gmail.com>
Subject: Re: regression: nand/spi flashes listed in reversed order after "ARM:
 dts: at91: Switch to the new NAND bindings"
Date: Thu, 27 Jun 2019 12:44:08 +0200
Message-ID: <CALtMJEBEo8u0YSqqAbRY0YwnuzCByAuQ8YKt8FrPzhoJpW_YCg@mail.gmail.com>
References: <CALtMJEBpxc+oN1Uf03F0oG-smHZazeeptE=BRX7tPpixnAgFrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CALtMJEBpxc+oN1Uf03F0oG-smHZazeeptE=BRX7tPpixnAgFrw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: alexandre.belloni@free-electrons.com, "Michonski,
 Krzysztof" <krzysztof.michonski@digitalstrom.com>
List-Id: devicetree@vger.kernel.org

fyi,

actually straight forward when also dumping the attributes:
udevadm info -a /dev/mtd0

here my rules
SUBSYSTEM=="mtd", ATTR{type}=="nand", ACTION=="add", SYMLINK+="mtd/%s{name}"
SUBSYSTEM=="mtd", ATTR{type}=="nor", ACTION=="add" SYMLINK+="mtd/spi"

/andi

Am Mi., 26. Juni 2019 um 11:36 Uhr schrieb Andreas Fenkart <afenkart@gmail.com>:
>
> After this patch, which is of course much appreciated:
>
> 1004a2977bdc7566bca87c565541c3232ed467c4
> Refs: v4.12-rc1-7-g1004a2977bdc
> Author:     Boris Brezillon <boris.brezillon@free-electrons.com>
> AuthorDate: Tue May 30 11:20:53 2017 +0200
> Commit:     Alexandre Belloni <alexandre.belloni@free-electrons.com>
> CommitDate: Wed May 31 11:55:41 2017 +0200
>
>     ARM: dts: at91: Switch to the new NAND bindings
>
>     Use the new EBI/NAND bindings to declare NAND chips and remove old NAND
>     nodes along the way.
>
>     Note that we keep using old bindings in at91rm9200.dtsi because this
>     SoC is not supported by the EBI driver.
>
> The listing and indexing of my mtd devices changed:
>
> root@after:~# cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00080000 00010000 "spi32766.0"
> ...
> mtd4: 32000000 00080000 "rootfs"
> mtd5: 0bc00000 00080000 "config"
>
> root@before:~# cat /proc/mtd
> dev:    size   erasesize  name
> ...
> mtd3: 32000000 00080000 "rootfs"
> mtd4: 0bc00000 00080000 "config"
> mtd5: 00080000 00010000 "spi32766.0"
>
>
> I assume sorting the mtd listing in a specific order is not supported
> nor desired by the mtd maintainers. So I'm not argueing about that.
>
> But since the index of rootfs device is hard-coded in the cmdline, the
> fw-utils config file and a custom script to backup/retrieve
> configuration, this is causing me some problems.
>
> The nand is partitioned, the spi is not:
> mtdparts=mtdparts=atmel_nand:2M(foo),2M(bar),32M(baz),800M(rootfs),-(config)
>
> While the bootargs can be fixed easily by using the human readable
> name (ubi.mtd=rootfs). I can't retrieve that human readable name from
> udev alone, nor can I build something from major/minor alone, since
> the major is the same for nand/spi flash.
>
> root@before:/etc/udev/rules.d# udevadm info /dev/mtd3
> P: /devices/platform/ahb/40000000.nand/mtd/mtd3
> N: mtd3
> E: DEVNAME=/dev/mtd3
> E: DEVPATH=/devices/platform/ahb/40000000.nand/mtd/mtd3
> E: DEVTYPE=mtd
> E: MAJOR=90
> E: MINOR=6
>
> root@dSS:/etc/udev/rules.d# udevadm info /dev/mtd5
> P: /devices/platform/ahb/ahb:apb/fffc8000.spi/spi_master/spi32766/spi32766.0/mtd/mtd5
> N: mtd5
> E: DEVNAME=/dev/mtd5
> E: DEVPATH=/devices/platform/ahb/ahb:apb/fffc8000.spi/spi_master/spi32766/spi32766.0/mtd/mtd5
> E: DEVTYPE=mtd
> E: MAJOR=90
> E: MINOR=10
> E: OF_COMPATIBLE_0=st,m25p40
> E: OF_COMPATIBLE_N=1
> E: OF_FULLNAME=/ahb/apb/spi@fffc8000/m25p40@0
> E: OF_NAME=m25p40
> E: SUBSYSTEM=mtd
>
> What is the preferred to make the rootfs agnostic of a particular mtd
> listing order

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
