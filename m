From: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH 1/2] ubi: mount partitions specified in device tree
Date: Sun, 19 Jun 2016 01:20:55 +0200
Message-ID: <20160618232054.GB29476@makrotopia.org>
References: <1466277476-14853-1-git-send-email-hauke@hauke-m.de>
 <5765A14F.6020201@nod.at>
 <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <48242f26-7812-6957-6bf5-c12989b875b4@hauke-m.de>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, dedekind1@gmail.com, Richard Weinberger <richard@nod.at>, robh+dt@kernel.org, linux-mtd@lists.infradead.org, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

Hi!

On Sat, Jun 18, 2016 at 09:35:42PM +0200, Hauke Mehrtens wrote:
> On 06/18/2016 09:30 PM, Richard Weinberger wrote:
> > Am 18.06.2016 um 21:17 schrieb Hauke Mehrtens:
> >> This makes it possible to open a ubi layer in device tree, this is
> >> helpful when the rootfs is on a ubi layer. It loops though all mtd
> >> partitions and mounts the partition which is compatible with
> >> "ubi,volume". The same was only possible with kernel command line
> >> arguments before.
> >>
> >> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> >> ---
> >>  Documentation/devicetree/bindings/mtd/ubi.txt | 33 ++++++++++++++
> >>  drivers/mtd/ubi/block.c                       | 63 +++++++++++++++++++++++++++
> >>  2 files changed, 96 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/mtd/ubi.txt
> > 
> > Some time ago I thought about an UBI DT binding too, but
> > I have been told that device tree is only for describing the hardware
> > and nothing else.
> > So I fear this will be rejected by DT folks.
> 
> There are some devices on the market that are storing the root file
> system in an ubi layer.
> To make this work there are currently two options.
> 1. patch the kernel to specify which partitions to open in the code.
> 2. provide some kernel command line parameter which specifies what to open.
> 
> I would like to specify this in device tree.

In MBR there used to be an 'active' flag stored for each partition.
Maybe it'd be nice to introduce something similar to mark UBI volumes
to be the default rootfs.
Currently we solve this issue by convention: If a volume is named
'rootfs' it is automatically mounted during boot. Depending on the
filesystem in use a ubiblock device has to be created as well.
This is mostly just the continuation of the existing naming convention
of mtd partitions, a patch OpenWrt is carrying around for a long
while already.
To support the same on UBI, another set of patches was made.

I agree that there should be a way to pass this through the of_node
of the mtd partition which is defined in the device tree.
Selecting to-be-ubi-attached mtd partitions in device-tree would
replace patch:

https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/490-ubi-auto-attach-mtd-device-named-ubi-or-data-on-boot.patch

To auto-select the rootfs, we currently carry another bunch of patches

https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/491-ubi-auto-create-ubiblock-device-for-rootfs.patch

https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/492-try-auto-mounting-ubi0-rootfs-in-init-do_mounts.c.patch

https://git.lede-project.org/?p=source.git;a=blob;f=target/linux/generic/patches-4.4/493-ubi-set-ROOT_DEV-to-ubiblock-rootfs-if-unset.patch

This is more or less filesystem-agnostic and works fine as long as
there is only one volume called 'rootfs' and this volume is always
used as rootfs.

Dual-boot setups will need some way to pass the active rootfs volume to
the kernel. While I agree that this is possible by appending or
prepending to the cmdline string passed to the kernel, this either
limits the users' ability to manually specify the rootfs using the
cmdline or becomes a more complex task to only append/prepend the
cmdline in case the user-defined string doesn't already contain
relevant parameters...
Thus it'd be nicer to flag the default rootfs volume via the device-
tree.

However, I realize that other than mtd partitions, ubi volumes are
obviously dynamic and thus don't occur in the device-tree...
Modifying the volume on every boot to select whether it is active
also doesn't seem to be the right way. A non-standard cmdline
parameter is the most common solution implemented by many vendors,
that's also far from beautiful.


Just my 2 cents...


Cheers


Daniel



> 
> Hauke
> 

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
