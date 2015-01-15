From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v4 0/5] Add a new RTC driver for recent mvebu SoCs
Date: Thu, 15 Jan 2015 18:23:16 +0100
Message-ID: <1421342601-20384-1-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

The Marvell Armada 38x SoCs contains an RTC which differs from the RTC
used in the other mvebu SoCs until now. This forth version of the
patch set adds support for this new IP and enable it in the Device
Tree of the Armada 38x SoC.

Thanks,

Gr=C3=A9gory

Changelog

v3 -> v4:

- Formatted the device tree binding documentation in a better way
- Renamed the soc-int regmap to rtc-soc because this group of register
  was not only about the interrupt.
- Fixed the rtc_delayed_write function. I found the exact description
  of the WA to use, and the wait should really be after the write.

v2 -> v3:

- Fixed the reg-names description in the dt binding documentation
- Used the delayed version of the writel in everyplace.

v1 -> v2:

- Used reg-names to identify the registers in the device tree
- Changed the space into tab in the MAINTAINERS file
- Emphasized that the 5s wait was only needed between two consecutive
  writes
- Reduced the wait in the set_time function, 100ms were enough
- If no interrupt was available, then disable the alarm related
  functions
- Fixed the critical sections
- Updated the mvebu_v7_defconfig by enabling the new RTC support


Gregory CLEMENT (5):
  rtc: armada38x: Add the device tree binding documentation
  drivers/rtc/rtc-armada38x: Add a new RTC driver for recent mvebu SoCs
  MAINTAINERS: Add the RTC driver for the Armada38x
  ARM: mvebu: add Device Tree description of RTC on Armada 38x
  ARM: mvebu: enable Armada 38x RTC driver in mvebu_v7_defconfig

 .../devicetree/bindings/rtc/armada-380-rtc.txt     |  22 ++
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/armada-38x.dtsi                  |   7 +
 arch/arm/configs/mvebu_v7_defconfig                |   1 +
 drivers/rtc/Kconfig                                |  10 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-armada38x.c                        | 320 +++++++++++++=
++++++++
 7 files changed, 362 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/armada-380-rt=
c.txt
 create mode 100644 drivers/rtc/rtc-armada38x.c

--=20
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
