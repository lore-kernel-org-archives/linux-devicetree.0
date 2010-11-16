From: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 0/2] Adding DTB's to architecture independent vmlinux
Date: Mon, 15 Nov 2010 20:01:19 -0800
Message-ID: <cover.1289877715.git.dirk.brandewie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org
Cc: arjan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Dirk Brandewie <dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

This patch set adds support for linking an arbitrary number of device
tree blobs into the kernel image and allow passing the "compatible"
string for the platform on the kernel command line.

Patch 1/2:
modifies asm-generic/vmlinux.lds.h to add linking .dtb.init.rodata
sections into the .init.data section of the vmlinux image. modifies
scripts/Makefile.lib to add a kbuild command to compile DTS files to
device tree blobs and a rule to create objects to wrap the blobs for
linking into vmlinux. 

A DTB is linked in by adding the DTB object to the list of objects to
be linked into vmlinux in the archtecture specific Makefile using
   obj-y += dts/foo.dtb.o
   $(obj)/%.dtb: $(src)/%.dts
       $(call if_changed,dtc)
The location of the device tree DTS files is architecture specific.

Patch 2/2:
Adds a kernel command line option "dtb_compat=<string>" and functions
for architecture/platform specific code to retrieve the command line
string and locate the compatible DTB linked into the kernel
e.g.
    compat_string = of_get_dtb_compatible_string();
    compat_dtb = of_find_compatible_dtb(compat_string);

Changes from V4:
Patch to device tree compiler dropped, alignment done in DTB wrapper
object code.

Name of DTB section changed to .dtb.init.rodata from .dtb

Code cleanup in of_find_compatible_dtb() to remove redundant code and
improve readabiility.

Patch to arch/x86/kernel Makefile dropped from this set.
  

Dirk Brandewie (2):
  of: Add support for linking device tree blobs into vmlinux
  of/fdt: add kernel command line option for dtb_compat string

 Documentation/kernel-parameters.txt |    7 ++++
 drivers/of/fdt.c                    |   55 +++++++++++++++++++++++++++++++++++
 include/asm-generic/vmlinux.lds.h   |   19 +++++++++++-
 include/linux/of_fdt.h              |    5 +++
 scripts/Makefile.lib                |   17 +++++++++++
 5 files changed, 101 insertions(+), 2 deletions(-)

-- 
1.7.2.3
