From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 0/2] ARM: mvebu: Use Hardware BCH ECC for RN104 and RN2120
Date: Sat, 06 Sep 2014 22:48:44 +0200
Message-ID: <cover.1410035142.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Following Ben's report and fix for RN102, I did some tests
on RN104 and RN2120 (they have the same Hynix H27U1G8F2BTR
flash and setup) and came up w/ the exact same fixes for
their respective .dts files. With those patches, it is now
possible to update kernel from userland and u-boot will
happily load and boot it on those devices.

Both patches should be candidates for stable, I guess.

Cheers,

a+

Arnaud Ebalard (2):
  ARM: mvebu: Netgear RN104: Use Hardware BCH ECC
  ARM: mvebu: Netgear RN2120: Use Hardware BCH ECC

 arch/arm/boot/dts/armada-370-netgear-rn104.dts | 4 ++++
 arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
