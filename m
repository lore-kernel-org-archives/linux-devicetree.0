From: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/2] Add ethernet support for Meson-AXG SoC
Date: Fri, 15 Dec 2017 10:10:12 +0800
Message-ID: <20171215021014.231308-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series try to add support for the ethernet MAC controller
found in Meson-AXG SoC, and also enable it in the S400 board.

Changes in v3 since [4]:
 - put clock DT info in soc.dtsi
 - separate DT for 'add support for the controller' vs 'enable in board'

Changes in v2 since [1]:
 - rebase to kevin's v4.16/dt64 branch
 - add Neil's Reviewed-by
 - move clock info to board.dts instead of in soc.dtsi
 - drop "meson-axg-dwmac" compatible string, since we didn't use this
   we could re-add it later when we really need.
 - note: to make ethernet work properly,it depend on clock & pinctrl[2],
   to compile the DTS, the patch [3] is required.
   the code part will be taken via clock & pinctrl subsystem tree.

[1]
http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005301.html

[4]
http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005768.html

[2]
http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005735.html
http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005694.html

[3]
http://lists.infradead.org/pipermail/linux-amlogic/2017-December/005738.html

Yixun Lan (2):
  ARM64: dts: meson-axg: add ethernet mac controller
  ARM64: dts: meson-axg: enable ethernet for A113D S400 board

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts |  7 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 54 ++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
