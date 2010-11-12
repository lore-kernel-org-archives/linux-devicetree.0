From: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 0/4] [RFC V4] Adding DTB to architecture independent vmlinux
Date: Thu, 11 Nov 2010 16:03:46 -0800
Message-ID: <cover.1289520079.git.dirk.brandewie@gmail.com>
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

The following series implements the ability to link device tree
blob(s) into the kernel image.

Changes since V3:
Added kernel command line option to pass a "compatible" string to
select the DTB for the platform.

Added function to find the compatible DTB in the kernel image if any

Added code to dtc to force the DTB to be modulo 32 bytes in size

Changed the alignment of the .dtb section


Dirk Brandewie (4):
  x86/of:  Support building device tree blob(s) into image.
  of: Add support for linking device tree blobs into vmlinux
  of/dtc: force dtb size to modulo 32 bytes
  of/fdt: add kernel command line option for dtb_compat string

 arch/x86/Kconfig                  |    6 +++-
 arch/x86/boot/dts/Kconfig         |    8 +++++
 arch/x86/kernel/Makefile          |   11 ++++++++
 drivers/of/fdt.c                  |   52 +++++++++++++++++++++++++++++++++++++
 include/asm-generic/vmlinux.lds.h |   13 ++++++++-
 include/linux/of_fdt.h            |    9 ++++++
 init/Kconfig                      |    7 +++++
 scripts/Makefile.lib              |   14 ++++++++++
 scripts/dtc/flattree.c            |    6 +++-
 9 files changed, 123 insertions(+), 3 deletions(-)
 create mode 100644 arch/x86/boot/dts/Kconfig

-- 
1.7.2.3
