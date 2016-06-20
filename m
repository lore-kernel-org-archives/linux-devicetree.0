From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Mon, 20 Jun 2016 10:09:50 +0200
Message-ID: <6411961.soYuJ4Ixfs@wuerfel>
References: <20160619130514.GB820@makrotopia.org>
 <20160619214820.GB1222@makrotopia.org>
 <c00ff150-9197-7bcf-8ea7-7ebba979d058@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <c00ff150-9197-7bcf-8ea7-7ebba979d058@hauke-m.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: mark.rutland@arm.com, Boris Brezillon <boris.brezillon@free-electrons.com>, dedekind1@gmail.com, Richard Weinberger <richard@nod.at>, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On Monday, June 20, 2016 12:21:07 AM CEST Hauke Mehrtens wrote:
> On 06/19/2016 11:48 PM, Daniel Golle wrote:
> > Hi Boris,
> > 
> > On Sun, Jun 19, 2016 at 10:14:34PM +0200, Boris Brezillon wrote:
> >> On Sun, 19 Jun 2016 21:42:39 +0200
> >> Daniel Golle <daniel@makrotopia.org> wrote:
> >>>>> That's nice and I also didn't know that.
> >>>>> It's still not perfect because I got to add it to the cmdline (in DT),
> >>>>> and should have it only on devices where a partition with that given
> >>>>> name actually exists. A flag for the mtd partition would still be
> >>>>> nicer.
> 
> Is it possible to addend the kernel command line with device tree? Some
> vendor boot loaders are adding the mac address to the kernel command
> line and I would like to get it. Like Daniel said replacing the vendor
> boot loader is dangerous because sometimes recovery means to desolder
> the flash chip.

The bootloader can easily modify the command line in the dt, but
things like device mac address should be modified in the ethernet
device node if possible.

> > 
> > That could be true, if there actually are other things which require
> > device-specific information about MTD partitions. In a way something
> > similar already exists in a reverse-fashion for in-flash WiFi EEPROMs,
> > eg.
> > fpi@10000000 {
> >         ...
> >         ath9k_eep {
> >                 compatible = "ath9k,eeprom";
> >                 ath,eep-flash = <&ath9k_cal 0x985>;
> >                 ath,eep-endian;
> >                 ath,eep-swap;
> >         };
> >         ...
> > };

This is a  bit of an ad-hoc binding, I wouldn't use that as
an example for how to do things elsewhere.

> >>>> Let's see what Rob and other DT maintainers think about that.
> >>>>
> >>>> Still, it seems to me that you're trying to solve a problem in the
> >>>> kernel when it should actually be solved in an upper layer.  
> >>>
> >>> It's definitely inside the grey-zone of early-userland... Doing things
> >>> which need to be done to mount the root filesystem are traditionally
> >>> the exceptions of things which are user-land and yet happen inside
> >>> the kernel before executing init.
> >>
> >> But I've never seen any DT properties specifying which FS should be
> >> used on a block device...

Right, that goes a bit too far. File system type etc should clearly
be detectable from either the partition table or the partition itself.

> > No, because that's not needed for filesystems. UBI sitting on top of
> > a specific MTD partition is kinda part of the general way a device is
> > supposed to be used, bootloaders may assume UBI to be present in a
> > certain area and if used by the stock firmware, the partition used
> > for UBI by a third party firmware should be within the same
> > boundaries. To me it looks like a device-specific convention, similar
> > to flash areas used for WiFi EEPROMs or bootloader environments.
> > (to detect the bootloader environment in user-space we are currently
> > appending the device-tree by having per-board defaults. That's also
> > not that nice, but it's not as problematic because usually uneeded
> > during normal runtime, see
> > https://git.lede-project.org/?p=source.git;a=blob;f=package/boot/uboot-envtools/files/lantiq
> > )
> 
> In the end I would like to be able to specify from where to mount the
> root filesystem in device tree. The partition layout directly on the
> flash chip is already defined in device tree.
> 
> The U-Boot from the Intel / Lantiq SDK currently loads the kernel from
> an UBI partition and then the kernel should also load the rootfs from an
> UBI partition. You can also flash the images from the boot loader the
> boot loader takes care of placing your image into the correct UBI
> partitions. In this case the boot loader is aware of the partition
> schema and also the UBI schema.

A few more thoughts on various things that came up in the discussion
so far (so I don't have to reply to each of them separately)

- The /chosen and /aliases nodes do configure the OS to some degree,
  and historically we have used them to specify the device names that
  show up in the kernel (e.g. on MacOS and AIX) as well as the rootfs
  itself

- The device tree should give us enough information to identify the
  root partition by a GUID from the kernel. This works on all block
  devices (at least with MBR and EFI partition tables, probably many
  of the lesser known ones as well) and it should really also work
  on UBI.

- MTD partitioning unfortunately does not seem to have a widely used
  method for identifying partitions from what's stored on the flash,
  unlike block devices, so whatever we normally have in the partition
  table has to be stored in DT. This really sucks, but I don't know
  what else to do about it.

- The UBI design was originally meant to cover the entire flash
  device and provide the partitioning information inside. I have not
  looked at UBI in a long time (actually not since before embedded
  PPC moved to DT), but I would hope that this case works without
  any DT magic.

	Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
