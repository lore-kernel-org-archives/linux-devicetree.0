From: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 00/10] arm64: dts: hi3660: add more device nodes
Date: Mon, 14 Aug 2017 17:50:39 +0800
Message-ID: <20170814095049.27701-1-guodong.xu@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds more device nodes for hi3660 and hikey960, including:
 - cpu idle states
 - L2 cache
 - PMU
 - OP-TEE
 - reboot
 - pstore
 - DMA
 - watchdog

Patch 7 fixes an issue in mmc nodes, by adding 'reset'
Patch 8 change bluetooth uart max-speed to 3Mbps

HiKey960 is one of 96boards. For details information about it, please
refer to [1].

===
Major changes in v3:
 - update commit message of patch 1, as suggested by Daniel Lezcano
 - add patch 10 for watchdog bindings

Major changes in v2:
 - add patch 8 to change bluetooth uart max-speed to 3Mbps
 - add patch 9 for DMA node.

[1] https://github.com/96boards/documentation/tree/master/ConsumerEdition/HiKey960

Guodong Xu (4):
  arm64: dts: hikey960: Add support for syscon-reboot-mode
  arm64: dts: hikey960: Add pstore support
  arm64: dts: hi3660: Reset the mmc hosts
  arm64: dts: hikey960: change bluetooth uart max-speed to 3mbps

Leo Yan (3):
  arm64: dts: hi3660: enable idle states
  arm64: dts: hi3660: add L2 cache topology
  arm64: dts: hi3660: enable watchdog

Victor Chong (1):
  arm64: dts: hikey960: Add optee node

Wang Ruyi (1):
  arm64: dts: hi3660: add bindings for DMA

YiPing Xu (1):
  arm64: dts: hi3660: add pmu dt node for hi3660

 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts |  37 +++++-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi         | 130 ++++++++++++++++++++++
 2 files changed, 166 insertions(+), 1 deletion(-)

-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
