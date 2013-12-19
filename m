From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv1 0/3] Enable ISL12057 RTC chip in ReadyNAS .dts files
Date: Thu, 19 Dec 2013 23:01:56 +0100
Message-ID: <cover.1387490258.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

Now that support for ISL12057 RTC chip is on track for in v3.14, the
three patches in this series simply reference the chip in NETGEAR
ReadyNAS 102, 104 and 2120 .dts files so that the device stop booting
in the 70's. 

Jason, can you queue those for v3.14? The patches are based on your
mvebu/dt branch to simplify your work.

Arnaud Ebalard (3):
  ARM: mvebu: Enable ISL12057 RTC chip in ReadyNAS 102 .dts file
  ARM: mvebu: Enable ISL12057 RTC chip in ReadyNAS 104 .dts file
  ARM: mvebu: Enable ISL12057 RTC chip in ReadyNAS 2120 .dts file

 arch/arm/boot/dts/armada-370-netgear-rn102.dts | 5 +++++
 arch/arm/boot/dts/armada-370-netgear-rn104.dts | 5 +++++
 arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 5 +++++
 3 files changed, 15 insertions(+)

-- 
1.8.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
