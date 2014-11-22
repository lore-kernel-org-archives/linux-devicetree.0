From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv0 0/2] arm: mvebu: fixes for previous DS213j/DS414 series
Date: Sat, 22 Nov 2014 17:19:21 +0100
Message-ID: <cover.1416670812.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

This series contains two patches. I spent some time reading the patches
of my previous series you had to manually apply. I only noticed the error
Ben reported on v6 (i.e. some pinctrl entries still using pmx_ instead
of _pins) which patch 1 corrects.

Regarding the second patch, having forgotten to enable MACH_ARMADA_XP in
my kernel config, I missed a renaming of ge0/1 pinctrl entries in
armada-xp.dtsi, which resulted in a non-compiling .dts file for DS414.
To fix my mistake, you did a s/ge[01]_rgmii_pins/pmx_ge[01]_rgmii/,
reintroducing some of the pmx_ naming that should have been removed in
the process. So, the second patch in that series finishes the work to
normalize pinctrl entries in Armada SoCs DT files.

The patches do apply on your mvebu/dt branch. They do pass a whole
compilation (including 'make dtbs') and I can boot a resulting kernel on
my DS213j. I do not have a DS414 at hand but will test on this device
early next week.

I hope eveyhting is now back in order w/ those. Feedback appreciated.

Cheers,

a+

Arnaud Ebalard (2):
  arm: mvebu: fix wrongly named DS414 pinctrl entries
  arm: mvebu: normalize pinctrl entries for Armada SoCs

 arch/arm/boot/dts/armada-xp-axpwifiap.dts       | 12 ++++++------
 arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts |  4 ++--
 arch/arm/boot/dts/armada-xp-synology-ds414.dts  | 10 +++++-----
 arch/arm/boot/dts/armada-xp.dtsi                |  6 +++---
 4 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.1.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
