From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 0/4] ARM64: mvebu: Armada 3700/7K/8K DT cleanups
Date: Wed, 23 Mar 2016 23:24:17 +0100
Message-ID: <1458771861-12392-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This series cleans up some minor DT nits spotted in next-20160323.

It's structured so that non-functional changes come before functional c=
hanges
for each SoC family.

Regards,
Andreas

Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Andreas F=C3=A4rber (4):
  arm64: dts: marvell: Clean up armada-3720-db
  arm64: dts: marvell: Rename armada-37xx USB node
  arm64: dts: marvell: Clean up armada-7040-db
  arm64: dts: marvell: Rename armada-ap806 XOR nodes

 arch/arm64/boot/dts/marvell/armada-3720-db.dts     | 35 +++++++-------=
-
 arch/arm64/boot/dts/marvell/armada-372x.dtsi       |  1 -
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |  4 +-
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     | 52 ++++++++++----=
--------
 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi |  1 -
 arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi |  2 -
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi      | 15 +++----
 7 files changed, 47 insertions(+), 63 deletions(-)

--=20
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
