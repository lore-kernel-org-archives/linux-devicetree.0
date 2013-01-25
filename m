From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/5] arm: mvebu: add support for local timer for Armada
 370/XP
Date: Fri, 25 Jan 2013 18:32:40 +0100
Message-ID: <1359135165-32108-1-git-send-email-gregory.clement@free-electrons.com>
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
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ike Pan <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, David Marlin <dmarlin-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jani Monoses <jani.monoses-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Dan Frazier <dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Eran Ben-Avi <benavi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leif Lindholm <leif.lindholm-5wv7dgnIgG8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chris Van Hoof <vanhoof-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

The Armada XP SoCs comes with private timers. This allows us to use
local timers through CONFIG_LOCAL_TIMERS and as stated in the kconfig
help, it prevents a "thundering herd" at every timer tick.

Armada 370 also have these private timers, and even if it comes only
with a single CPU, the feature is also enabled for this SoC to keep
the code generic.

In order to be able to use the local timer, I also had to add the
support for the per-CPU interrupts.

There are not many changes since the first version (see the changelog
below), I hope it means that everybody is happy with this patch
set. If it is, so please could you give your acked-by. I especially
expect the acked-by from John Stultz then I will feel more comfortable
to ask Jason to pull it.

This patch set is based on 3.8-rc4 and is obviously 3.9 material. The
git branch called local_timer is available at:
https://github.com/MISL-EBU-System-SW/mainline-public.git.

Thanks,

Changelog:
V1->V2:
 - Fixed unneeded empty line and wrong indentation.
 - Made percpu_armada_370_xp_evt a static variable
 - Removed the patch "arm: kconfig: don't select TWD with local timer
   for Armada 370/XP" from the series. There is still some improvement
   possible in this area, but this patch set not depends on it.

Gregory CLEMENT (5):
  arm: mvebu: Add support for local interrupt
  clocksource: time-armada-370-xp: add local timer support
  arm: mvebu: update defconfig with local timer support
  arm: mvebu: update DT to support local timers
  clocksource: update and move armada-370-xp-timer documentation to
    timer directory

 .../bindings/arm/armada-370-xp-timer.txt           |   12 --
 .../bindings/timer/marvell,armada-370-xp-timer.txt |   15 ++
 arch/arm/boot/dts/armada-370-xp.dtsi               |    5 +-
 arch/arm/configs/mvebu_defconfig                   |    1 -
 arch/arm/mach-mvebu/irq-armada-370-xp.c            |   15 +-
 drivers/clocksource/time-armada-370-xp.c           |  150 +++++++++++++++-----
 6 files changed, 141 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/armada-370-xp-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt

-- 
1.7.9.5
