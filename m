From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 0/3] Various ARM64 Armada DT warning fixup
Date: Mon,  7 Nov 2016 22:41:25 +0100
Message-ID: <20161107214128.18401-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Following the series sent for Armada 370/XP, this patchset fixes up
various warning from the DT compiler when using the flag W=1 with
make.

Being a fresh new port, the arm64 we did a better job for dt than for
the arm32 so there is only a few patches needed.

Gregory

Gregory CLEMENT (3):
  arm64: dts: marvell: Fixup internal-regs DT warning for Armada 37xx
  arm64: dts: marvell: Fixup config-space DT warning For Armada 7K/8K
  ARM64: dts: marvell: Fixup memory DT warning for Armada 37xx

 arch/arm64/boot/dts/marvell/armada-3720-db.dts          | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi            | 2 +-
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi           | 2 +-
 arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi    | 2 +-
 arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi     | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
