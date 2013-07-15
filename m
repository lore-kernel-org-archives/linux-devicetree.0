From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 00/10] Orion Watchdog fixes
Date: Mon, 15 Jul 2013 20:32:33 -0300
Message-ID: <1373931163-12670-1-git-send-email-ezequiel.garcia@free-electrons.com>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset introduces a bunch of fixes that removes the direct use of
the shared timer control register, and also removes the need to include
a mach-specific header.

With this changes the driver can be included in multiplatforms builds,
and in particular be used for the Armada 370/XP SoC.

I'm sending this early patchset mainly to discuss the possibility of
introducing this changes. As cleared stated in each patch, this series
breaks device-tree compatilibity by changing the meaning of the watchdog
node 'reg' property.

I'm aware of the implications of this, but I'm not sure how 'stable' the
Kirkwood DT is considered. So, given we're currently moving things around,
maybe there is still a chance to do this.

This patchset applies on top of Sebastian Hesselbarth's branch:

  git://github.com/shesselba/linux-dove.git orion-irqchip-for-v3.11_v4

Ezequiel Garcia (10):
  clocksource: orion: Add thread-safe API header
  watchdog: orion: Use thread-safe clocksource API
  watchdog: orion: Rename device-tree binding documentation
  watchdog: orion: Use the proper watchdog register
  watchdog: orion: Add a memory resource for RSTOUT register
  watchdog: orion: Update device-tree binding documentation
  watchdog: orion: Remove unneeded BRIDGE_CAUSE clear
  watchdog: orion: Remove mach-specific unneeded header
  watchdog: orion: Use BIT()
  ARM: kirkwood: Fix the device-tree watchdog's node reg property

 .../watchdog/{marvel.txt => orion-wdt.txt}         |  8 ++--
 arch/arm/boot/dts/kirkwood.dtsi                    |  3 +-
 arch/arm/mach-kirkwood/include/mach/bridge-regs.h  |  2 +
 arch/arm/mach-orion5x/include/mach/bridge-regs.h   |  2 +
 arch/arm/plat-orion/common.c                       | 10 +++--
 drivers/watchdog/orion_wdt.c                       | 46 +++++++++-------------
 include/linux/time-orion.h                         |  7 ++++
 7 files changed, 42 insertions(+), 36 deletions(-)
 rename Documentation/devicetree/bindings/watchdog/{marvel.txt => orion-wdt.txt} (58%)
 create mode 100644 include/linux/time-orion.h

-- 
1.8.1.5
