From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/7] Add device tree based discovery support for drm-fimd
Date: Mon, 16 Jul 2012 17:41:19 +0530
Message-ID: <1342440686-21860-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Leela Krishna <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

The patches are created against "for-next" branch of Kukjin Kim's tree at:
 git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

This patch set adds Backlight, LCD support and device tree based discovery 
support for drm-fimd

Leela Krishna (3):
  ARM: EXYNOS5: add device tree based discovery support for FIMD
  ARM: EXYNOS5: Add the bus clock for FIMD
  ARM: EXYNOS5: Set parent clock to fimd

Leela Krishna Amudala (4):
  ARM: SAMSUNG: add additional registers and SFR definitions for
    writeback
  ARM: EXYNOS5: add machine specific support for backlight
  ARM: EXYNOS5: add machine specific support for LCD
  ARM: EXYNOS: Adding DRM platform device

 arch/arm/boot/dts/exynos5250-smdk5250.dts       |   16 +++
 arch/arm/boot/dts/exynos5250.dtsi               |    7 ++
 arch/arm/mach-exynos/Kconfig                    |    1 +
 arch/arm/mach-exynos/clock-exynos5.c            |   30 ++++--
 arch/arm/mach-exynos/include/mach/map.h         |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c          |  125 +++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/clock.h      |    2 +
 arch/arm/plat-samsung/include/plat/regs-fb-v4.h |   10 ++
 arch/arm/plat-samsung/include/plat/regs-fb.h    |   51 +++++++++
 drivers/video/Kconfig                           |    6 +
 10 files changed, 239 insertions(+), 10 deletions(-)
