From: dirk.brandewie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [RFC] [PATCH V3 0/2] Adding DTB to architecture independent vmlinux
Date: Wed, 10 Nov 2010 10:52:36 -0800
Message-ID: <cover.1289411770.git.dirk.brandewie@gmail.com>
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

These patches add support for linking device tree blob(s) into
vmlinux.

The changes since V2:
patch has been split into architecture independent and x86 specific
parts.

The DTB's have been moved into the .init.data section.

The DTB's linked into vmlinux is controlled by kernel config
variables. Specifying the DTB on the make command line is gone.

Linking multiple DTB's into image is supported. (suggested by David
VomLehn and refined with the help of HPA and Grant Likely)

Specific issues I would like feed back on:
Is the padding added on the dtc invocation needed since the paltform
code will have to copy the tree out of the init section?

Setting $(dtstree) in the arch specific makefile is required is there
a better write the cmd_dtc in Makefile.lib?

Things on the TODO list:
[generic]
Pass DTB name/compatible string on the kernel command line.
Add funciton to find "compatible" root node in the set of DTB's linked
in.
[x86]
Add function to relocate DTB whose address is passed in via setup_data
ala init_rd.

Comments/Suggestions?

Dirk Brandewie (2):
  of: Add support for linking device tree blobs into vmlinux
  x86/of:  Support building device tree blob(s) into image.

 arch/x86/Kconfig                  |    6 +++++-
 arch/x86/boot/dts/Kconfig         |    8 ++++++++
 arch/x86/kernel/Makefile          |   11 +++++++++++
 include/asm-generic/vmlinux.lds.h |   12 ++++++++++++
 init/Kconfig                      |    7 +++++++
 scripts/Makefile.lib              |   14 ++++++++++++++
 6 files changed, 57 insertions(+), 1 deletions(-)
 create mode 100644 arch/x86/boot/dts/Kconfig

-- 
1.7.2.3
