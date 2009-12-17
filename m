From: Rob Landley <rob@landley.net>
Subject: CELF Project Proposal - Device tree support for QEMU
	system emulation.
Date: Wed, 16 Dec 2009 22:46:41 -0600
Message-ID: <200912162246.42366.rob@landley.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/pipermail/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
Errors-To: qemu-devel-bounces+gceq-qemu-devel=gmane.org@nongnu.org
To: CE Linux Developers List <celinux-dev@tree.celinuxforum.org>
Cc: devicetree-discuss@lists.ozlabs.org, qemu-devel@nongnu.org
List-Id: devicetree@vger.kernel.org

For background of CELF project proposals, see:

  http://elinux.org/CELF_Open_Project_Proposal_2010

Summary:

Integrate a flattened device tree parser into the emulator QEMU, so QEMU can 
create board emulations on the fly (at runtime) from the same data files the 
Linux kernel uses to attach drivers to hardware.

Proposer:

Rob Landley

Description:

Currently, the QEMU is emulating system boards via hardwired .c files, which 
explicitly set up the resources for each emulation in a separate C function.  
In theory, QEMU could parse the same device tree data format the Linux kernel 
uses to set up its hardware resources,  and then pass hardware resources along 
to kernels it invokes through its built-in bootloader (I.E. with the -kernel 
option).  This could allow new boards to be added to qemu simply by supplying 
device tree files at runtime (assuming emulations for the appropriate 
peripherals had already been implemented in QEMU).

The Device Tree format is a reasonably generic data file describing hardware 
layout.  It is documented in the linux kernel source at:

  Documentation/powerpc/booting-without-of.txt

It started as the data structure Open Firmware used to describe supported 
hardware to operating systems, and was picked up by bootloaders such as u-
boot.  It allows the Linux kernel to parse a generic data structure at boot 
time to configure itself for the current hardware layout, instead of hardwiring 
board support in individual .c files.

Device trees are created using an ascii format to describe a board layout, 
which is converted into a flattened binary representation by dtc (the "device 
tree compiler", included in current linux kernel sources in scripts/dtc).  A 
bootloader supporting device trees loads the flattened device tree into memory 
as a binary blob, and passes the linux kernel a pointer to this blob in a 
register.  The kernel then uses a built-in device tree parser to understand 
the board's hardware layout and initialize itself.  (Depending on kernel 
.config, this information may also be queried from userspace via a /proc 
interface.)

At the device tree BOF at OLS in 2008, a number of developers expressed 
interest in extending device tree support to other architectures (such as arm, 
mips, and sh4).  As a result, device tree development was moved off of the 
PowerPC mailing list to its own list, for the purpose of genericizing it to 
more architectures:

  https://lists.ozlabs.org/listinfo/devicetree-discuss

The Linux MAINTAINERS entry for device tree support is:

  OPEN FIRMWARE AND FLATTENED DEVICE TREE
  M:      Grant Likely <grant.likely@secretlab.ca>
  L:      devicetree-discuss@lists.ozlabs.org
  W:      http://fdt.secretlab.ca
  S:      Maintained
  F:      drivers/of
  F:      include/linux/of*.h
  K:      of_get_property

In theory, at some future date the kernel will no longer need hardwired .c 
files describing the layout of boards for any of these architectures.  Instead 
it can have a device tree for each board, which can be statically linked into 
the kernel binary if necessary.

If the kenrnel doesn't need board support hardwared in .c files, there's no 
reason QEMU needs it either.

Rob
-- 
Latency is more important than throughput. It's that simple. - Linus Torvalds
