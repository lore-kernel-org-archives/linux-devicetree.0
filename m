From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 0/2] syslinux: Add device tree support
Date: Thu, 31 May 2012 17:41:34 +0200
Message-ID: <1338478896-11417-1-git-send-email-thierry.reding@avionic-design.de>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: syslinux-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch series adds support for passing a Flattened Device Tree (FDT)
blob to the Linux kernel. Currently, only the linux.c32 module can do so
and some additional checking should be done to only pass the blob if the
kernel supports boot protocol 2.09 or later.

Thierry

Thierry Reding (2):
  com32: Add device tree support
  linux.c32: Add initrd= parameter

 com32/gfxboot/gfxboot.c         |    2 +-
 com32/include/syslinux/linux.h  |   25 +++++++++++++++++++++++-
 com32/lib/Makefile              |    4 +++-
 com32/lib/syslinux/fdt.c        |   28 ++++++++++++++++++++++++++
 com32/lib/syslinux/load_linux.c |   41 ++++++++++++++++++++++++++++++++++++++-
 com32/lua/src/syslinux.c        |    4 ++--
 com32/modules/linux.c           |   20 ++++++++++++++++++-
 7 files changed, 117 insertions(+), 7 deletions(-)
 create mode 100644 com32/lib/syslinux/fdt.c

-- 
1.7.10.2
