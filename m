From: ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH 0/2] of: Allow scripts/dtc/libfdt to be used from kernel code
 and more...
Date: Thu, 10 Nov 2011 17:11:27 -0800
Message-ID: <1320973889-30079-1-git-send-email-ddaney.cavm@gmail.com>
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
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

My next patch set for OCTEON device tree support relies on these two
patches.  I split these out as they are architecture independent.

I iterated on these several times under the guise of an RFC, this is
their first appearance as a request to be merged.

Thanks,

David Daney (2):
  of/lib: Allow scripts/dtc/libfdt to be used from kernel code
  of: Make of_find_node_by_path() traverse /aliases for relative paths.

 drivers/of/base.c          |   65 +++++++++++++++++++++++++++++++++++++++++--
 include/linux/libfdt.h     |    8 +++++
 include/linux/libfdt_env.h |   13 +++++++++
 lib/Kconfig                |    6 ++++
 lib/Makefile               |    5 +++
 lib/fdt.c                  |    2 +
 lib/fdt_ro.c               |    2 +
 lib/fdt_rw.c               |    2 +
 lib/fdt_strerror.c         |    2 +
 lib/fdt_sw.c               |    2 +
 lib/fdt_wip.c              |    2 +
 11 files changed, 106 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/libfdt.h
 create mode 100644 include/linux/libfdt_env.h
 create mode 100644 lib/fdt.c
 create mode 100644 lib/fdt_ro.c
 create mode 100644 lib/fdt_rw.c
 create mode 100644 lib/fdt_strerror.c
 create mode 100644 lib/fdt_sw.c
 create mode 100644 lib/fdt_wip.c

-- 
1.7.2.3
