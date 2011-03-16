From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH v2 0/5] Refactor and enhance device tree platform registrations
Date: Wed, 16 Mar 2011 02:33:28 -0600
Message-ID: <20110316083046.1154.89723.stgit@localhost6.localdomain6>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Technically only the last two patches are v2 patches, the first three are
cleanups written when they were refactored, and this is a first
posting for them.

The most interesting part of this series is the addition of
of_platform_prepare() which is useful to allow DT and non-DT board
support to share the same initialization code for on-chip platform
devices.

---

Grant Likely (5):
      dt: Refactor of_platform_bus_probe()
      dt: protect against NULL matches passed to of_match_node()
      dt: eliminate OF_NO_DEEP_PROBE and test for NULL match table
      dt: add of_platform_populate() for creating device from the device tree
      dt: add of_platform_prepare() to match nodes with static platform_devices


 arch/arm/mach-versatile/core.c               |    1 
 arch/powerpc/platforms/52xx/mpc52xx_common.c |   10 -
 drivers/of/address.c                         |   14 +
 drivers/of/base.c                            |    3 
 drivers/of/platform.c                        |  347 ++++++++++++++++++++++----
 include/linux/of_address.h                   |    1 
 include/linux/of_platform.h                  |    8 -
 7 files changed, 326 insertions(+), 58 deletions(-)

-- 
Signature
