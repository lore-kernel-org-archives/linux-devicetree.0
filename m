From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/2] ARM: berlin: add SDHCI support
Date: Tue, 22 Apr 2014 10:27:26 +0200
Message-ID: <1398155248-1659-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds the Berlin BG2Q SDHCI nodes to support the 3 controlle=
rs
available. The Berlin BG2Q SDHCI controllers are compatible with the px=
av3
driver. This patches also enable the SD Card reader and the eMMC of the
BG2Q DMP.

This series applies on top of Alexandre's patches for the Berlin's pll:
https://patchwork.kernel.org/patch/3890341/
https://patchwork.kernel.org/patch/3876271/

Changes since v1:
	The v2 introduced a custom Berlin SDHCI driver. It turns out the
	available pxav3 driver was compatible with the BG2Q SDHCI controllers.
	- removed the unneeded custom driver
	- switched to the pxav3 driver
	- removed the board specific properties from the SoC device tree

Antoine T=C3=A9nart (2):
  ARM: dts: berlin: add the SDHCI nodes for the BG2Q
  ARM: dts: berlin: enable SD card reader and eMMC for the BG2Q DMP

 arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 11 ++++++++++
 arch/arm/boot/dts/berlin2q.dtsi            | 32 ++++++++++++++++++++++=
++++++++
 2 files changed, 43 insertions(+)

--=20
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
