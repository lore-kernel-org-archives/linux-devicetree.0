From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v4 0/2] Add rockchip serial flash controller support
Date: Mon, 16 Jan 2017 15:28:39 +0800
Message-ID: <2da2c3c4-9a61-2119-cdd8-b2e8311b8280@rock-chips.com>
References: <1481794068-241619-1-git-send-email-shawn.lin@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481794068-241619-1-git-send-email-shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Cyrille,

On 2016/12/15 17:27, Shawn Lin wrote:
>
> Here is another try for adding serial flash controller
> , namely SFC, found on Rockchip RK1108 platform.
>

Seems this patchset was acked by Marek and there is no more
comments from then. Does it look good to you?


> Feature:
> (1) Support x1, x2, x4 data bits mode
> (2) Support up to 4 chip select
> (3) Support two independent clock domain: AHB clock and SPI clock
> (4) Support DMA master up to 16KB/transfer
>
> Test environment:
> This patchset was tested on RK1108 evb boards with Winboud flash
> (w25q256) and working fine with PIO or DMA mode.
>
> How-to:
> Any rockchip guys who are interested in testing it could refer to
> the following steps:
> (1) enable CONFIG_MTD_M25P80
> (2) enable CONFIG_SPI_ROCKCHIP_SFC
> (3) enable CONFIG_MTD_CMDLINE_PARTS
> (4) enable CONFIG_SQUASHFS
> (4) CONFIG_CMDLINE="root=/dev/mtdblock2
> 	mtdparts=spi-nor:256k@0(loader)ro,8m(kernel)ro,7m(rootfs),-(freedisk)"
> 	Of course, you should check the partition layout if you modify it. Also
> 	you could pass it from your loader to the kernel's cmdline.
> (5) Add dts support:
> nor_flash: sfc@301c0000 {
> 	compatible = "rockchip,rk1108-sfc", "rockchip,sfc";
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 	clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
> 	clock-names = "sfc", "hsfc";
> 	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> 	reg = <0x301c0000 0x1000>;
> 	/* If you want to use PIO mode, activate this */
> 	#rockchip,sfc-no-dma;
> 	spi-nor@0 {
> 		compatible = "jedec,spi-nor";
> 		spi-max-frequency = <12000000>;
> 		reg = <0>;
> 	}
> };
>
> please make sure your DT's mdtid matchs what you assgin to the
> mdtparts(cmdline), namely they are both *spi-nor* here.
>
> With enabling DBG for cmdlinepart.c, you could get following log and
> boot kernel and rootfs successfully.
>
> [    0.481420] rockchip-sfc 301c0000.sfc: w25q256 (32768 Kbytes)
> [    0.481962] DEBUG-CMDLINE-PART: parsing
> <256k@0(loader)ro,8m(kernel)ro,7m(rootfs)ro,-(freedisk)>
> [    0.482897] DEBUG-CMDLINE-PART: partition 3: name
> <freedisk>, offset ffffffffffffffff, size ffffffffffffffff, mask flags 0
> [    0.484021] DEBUG-CMDLINE-PART: partition 2: name
> <rootfs>, offset ffffffffffffffff, size 700000, mask flags 400
> [    0.485066] DEBUG-CMDLINE-PART: partition 1: name
> <kernel>, offset ffffffffffffffff, size 800000, mask flags 400
> [    0.486108] DEBUG-CMDLINE-PART: partition 0: name
> <loader>, offset 0, size 40000, mask flags 400
> [    0.487152] DEBUG-CMDLINE-PART: mtdid=<spi-nor> num_parts=<4>
> [    0.487827] 4 cmdlinepart partitions found on MTD device spi-nor
> [    0.488370] Creating 4 MTD partitions on "spi-nor":
> [    0.488826] 0x000000000000-0x000000040000 : "loader"
> [    0.492340] 0x000000040000-0x000000840000 : "kernel"
> [    0.495679] 0x000000840000-0x000000f40000 : "rootfs"
> [    0.499241] 0x000000f40000-0x000002000000 : "freedisk"
>
> [root@arm-linux]#
> [root@arm-linux]#mount
> /dev/root on / type squashfs (ro,relatime)
> devtmpfs on /dev type devtmpfs
> (rw,relatime,size=26124k,nr_inodes=6531,mode=755)
> proc on /proc type proc (rw,relatime)
> none on /tmp type ramfs (rw,relatime)
> none on /var type ramfs (rw,relatime)
> sysfs on /sys type sysfs (rw,relatime)
> debug on /sys/kernel/debug type debugfs (rw,relatime)
> none on /dev/pts type devpts (rw,relatime,mode=600,ptmxmode=000)
>
>
> Changes in v4:
> - use uppercase DMA for description
> - simplify the code of get_if_type
> - use dma_dir to simplify the code
> - simplify the rockchip_sfc_do_rd_wr
> - some minor improvements
> - add reset controller when doing resume
>
> Changes in v3:
> - use io{read32,write32}_rep to simplify the corner cases
> - remove more unnecessary bit definitions
> - some minor comment fixes and improvement
> - fix wrong unregister function
> - unify more code
> - use nor to avoid constantly replicating the whole
>   sfc->flash[sfc->num_chip].nor
> - add email for MODULE_AUTHOR
> - remove #if 1 --- #endif
> - extract DMA code to imporve the code structure
> - reset all when failing to do dma
> - pass sfc to get_if_type
> - rename sfc-no-dma to sfc-no-DMA
>
> Changes in v2:
> - fix typos
> - add some comment for buffer and others operations
> - rename SFC_MAX_CHIP_NUM to MAX_CHIPSELECT_NUM
> - use u8 for cs
> - return -EINVAL for default case of get_if_type
> - use readl_poll_*() to check timeout cases
> - simplify and clarify some condition checks
> - rework the bitshifts to simplify the code
> - define SFC_CMD_DUMMY(x)
> - fix ummap for dma read path and finish all the
>   cache maintenance.
> - rename to rockchip_sfc_chip_priv and embed struct spi_nor
>   in it.
> - add MODULE_AUTHOR
> - add runtime PM and general PM support.
> - Thanks for Marek's comments. Link:
>   http://lists.infradead.org/pipermail/linux-mtd/2016-November/070321.html
>
> Shawn Lin (2):
>   mtd: spi-nor: Bindings for Rockchip serial flash controller
>   mtd: spi-nor: add rockchip serial flash controller driver
>
>  .../devicetree/bindings/mtd/rockchip-sfc.txt       |  31 +
>  MAINTAINERS                                        |   8 +
>  drivers/mtd/spi-nor/Kconfig                        |   7 +
>  drivers/mtd/spi-nor/Makefile                       |   1 +
>  drivers/mtd/spi-nor/rockchip-sfc.c                 | 872 +++++++++++++++++++++
>  5 files changed, 919 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip-sfc.txt
>  create mode 100644 drivers/mtd/spi-nor/rockchip-sfc.c
>


-- 
Best Regards
Shawn Lin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
