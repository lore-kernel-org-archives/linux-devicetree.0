From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/3] arm64: dts: berlin4ct: add GPIO support
Date: Fri, 18 Sep 2015 21:47:36 +0800
Message-ID: <1442584059-7319-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Marvell berlin4ct SoC has 6 GPIO ports powered by snps,dw-apb-gpio. patch1
enables ARCH_REQUIRE_GPIOLIB for ARCH_BERLIN. patch2 add GPIO nodes in the
SoC dtsi. The last patch add board dts file for STB reference board.

Jisheng Zhang (3):
  arm64: berlin: enable ARCH_REQUIRE_GPIOLIB
  arm64: dts: berlin4ct: add GPIO nodes
  arm64: dts: add dts file for Marvell Berlin4CT STB board

 arch/arm64/Kconfig.platforms                  |   1 +
 arch/arm64/boot/dts/marvell/berlin4ct-stb.dts |  66 ++++++++++++++
 arch/arm64/boot/dts/marvell/berlin4ct.dtsi    | 120 ++++++++++++++++++++++++++
 3 files changed, 187 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/berlin4ct-stb.dts

-- 
2.5.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
