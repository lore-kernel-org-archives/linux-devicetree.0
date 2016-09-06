From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 00/10] ARM: dts: berlin: fix dtc warnings
Date: Tue, 6 Sep 2016 16:40:03 +0800
Message-ID: <20160906084013.2887-1-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a clean up series to fix berlin arm platforms dtc warnings.
Firstly we remove skeleton.dtsi inclusion. Then add missing unit name
of /soc node and /memory node. Lastly, we fix regulators' name

Jisheng Zhang (10):
  ARM: dts: berlin2q: Remove skeleton.dtsi inclusion
  ARM: dts: berlin2cd: Remove skeleton.dtsi inclusion
  ARM: dts: berlin2: Remove skeleton.dtsi inclusion
  ARM: dts: berlin2q: Add missing unit name to /soc node
  ARM: dts: berlin2cd: Add missing unit name to /soc node
  ARM: dts: berlin2: Add missing unit name to /soc node
  ARM: dts: berlin2q-marvell-dmp: add missing unit name to /memory node
  ARM: dts: chromecast: add missing unit name to /memory node
  ARM: dts: sony-nsz-gs7: add missing unit name to /memory node
  ARM: dts: berlin2q-marvell-dmp: fix regulators' name

 arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts        |  2 +-
 arch/arm/boot/dts/berlin2.dtsi                    |  5 +++--
 arch/arm/boot/dts/berlin2cd-google-chromecast.dts |  2 +-
 arch/arm/boot/dts/berlin2cd.dtsi                  |  5 +++--
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts        | 12 ++++++------
 arch/arm/boot/dts/berlin2q.dtsi                   |  6 +++---
 6 files changed, 17 insertions(+), 15 deletions(-)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
