From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 0/6] ARM device tree support improvements
Date: Mon, 28 Mar 2011 13:58:25 -0600
Message-ID: <20110328195231.10235.36716.stgit@ponder>
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
To: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, John Rigby <john.rigby-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, wd-ynQEQJNshbs@public.gmane.org, vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jerry & Wolfgang,

The following series fixes a bug in the device tree code and
eliminates the CONFIG_OF_LIBFDT dependency on CONFIG_SYS_BOOTMAPSZ.
It also adds parsing of the reserved mem regions so that U-Boot
doesn't decide to use a regions set aside for another purpose.

Finally, the last patch adds CONFIG_OF_LIBFDT to a bunch of boards.
I'm not expecting the last patch to be picked up in mainline (yet),
but it will be picked up into the Linaro tree for the 11.05 release.

John, this same series applies cleanly on the linaro-stable u-boot
tree.  Can you pick them up please?  Or would you prefer me to send
you a pull request?

g.

---

Grant Likely (6):
      Stop passing around bootmem_base value.
      Default to bootm_size() when CONFIG_SYS_BOOTMAPSZ is not defined
      Remove device tree booting dependency on CONFIG_SYS_BOOTMAPSZ
      Fix off-by-one error in passing initrd end address via device tree
      Respect memreserve regions specified in the device tree
      Add CONFIG_OF_LIBFDT to more boards.


 README                          |   16 ++++++++-
 arch/arm/lib/bootm.c            |    5 ++-
 arch/m68k/lib/bootm.c           |    7 +---
 arch/powerpc/lib/bootm.c        |   19 +++++-----
 common/cmd_bootm.c              |    7 ++--
 common/fdt_support.c            |    2 +
 common/image.c                  |   72 +++++++++++++++++++++++++++++----------
 include/configs/ca9x4_ct_vxp.h  |    2 +
 include/configs/devkit8000.h    |    2 +
 include/configs/efikamx.h       |    2 +
 include/configs/igep0020.h      |    2 +
 include/configs/igep0030.h      |    2 +
 include/configs/mx51evk.h       |    2 +
 include/configs/mx53evk.h       |    2 +
 include/configs/omap3_beagle.h  |    7 ----
 include/configs/omap3_overo.h   |    2 +
 include/configs/omap3_pandora.h |    2 +
 include/configs/omap3_sdp3430.h |    2 +
 include/configs/omap3_zoom1.h   |    2 +
 include/configs/omap3_zoom2.h   |    2 +
 include/configs/omap4_panda.h   |    2 +
 include/configs/omap4_sdp4430.h |    2 +
 include/configs/tegra2-common.h |    1 +
 include/image.h                 |   10 +++--
 24 files changed, 122 insertions(+), 52 deletions(-)

-- 
Signature
