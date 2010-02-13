From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 0/9] Random OF cleanups and merges
Date: Sat, 13 Feb 2010 09:02:25 -0700
Message-ID: <20100213154838.4767.83881.stgit__42414.0868861743$1266077017$gmane$org@angua>
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
To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, microblaze-uclinux-rVRm/Wmeqae7NGdpmJTKYQ@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, sparclinu
List-Id: devicetree@vger.kernel.org

Here's another batch of cleanup patches from my test-devicetree branch.
A number of cleanups, corrections and minor merges of common code.
Also a patch from Jeremy to make the flat tree work on architectures
without LMB (arm).

Once I've collected acks on these, I'll move them over to my
next-devicetree branch on git://git.secretlab.ca/git/linux-2.6

Cheers,
g.

---

Grant Likely (6):
      of: remove undefined request_OF_resource & release_OF_resource
      of/sparc: Remove sparc-local declaration of allnodes and devtree_lock
      of: move definition of of_chosen into common code.
      of: remove unused extern reference to devtree_lock
      of: put default string compare and #a/s-cell values into common header
      of: Remove old and misplaced function declarations

Jeremy Kerr (3):
      of/flattree: Don't assume HAVE_LMB
      of: protect linux/of.h with CONFIG_OF
      proc_devtree: fix THIS_MODULE without module.h


 arch/microblaze/include/asm/prom.h |   15 ---------------
 arch/microblaze/kernel/prom.c      |    8 +++++---
 arch/powerpc/include/asm/prom.h    |   14 --------------
 arch/powerpc/kernel/prom.c         |   10 +++++-----
 arch/sparc/kernel/prom.h           |    3 ---
 drivers/of/base.c                  |    1 +
 drivers/of/fdt.c                   |    9 ++++++---
 fs/proc/proc_devtree.c             |    1 +
 include/linux/of.h                 |   27 +++++++++++++++++++++++++++
 include/linux/of_fdt.h             |   11 +----------
 10 files changed, 46 insertions(+), 53 deletions(-)
