From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v2 0/9] Add support for USB2.0 host/peripheral on R-Car H3
Date: Mon, 22 Feb 2016 18:57:59 +0900
Message-ID: <1456135088-7976-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on the renesas-drivers.git /
renesas-drivers-2016-02-16-v4.5-rc4 tag
(commit id = a633abe6e6393c60417bd8cb0cf82f3297740198),
and the following patches:

[ renesas_usbhs driver ]
http://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=testing/next&id=cff0fef33d77bd7e98463029e5d0a4191d9bbb95

[ generic phy driver for R-Car H3 ]
http://thread.gmane.org/gmane.linux.kernel/2120685

This patch set contains patches that are related to generic phy driver.
As I wrote a comment in patch 7, to handle VBUS on/off for USB2.0 host
channel 0, I use a regulator driver instead of extcon/max3355 driver.
This is a reason that I marked this patch set is a RFC because I'm not
sure that this way is acceptable or not.

Also patch 5 should resolve checkpatch.pl warnings, and patch 6 should
have dmas property to use USB-DMAC later.

Changes from v1:
 - Remove PFC for usb2.0 host patch because it contains the renesas-drivers.
 - Change the patch order of the phy driver. (clean up code is in first.)
 - Change the property of "phy-supply" to "vbus-supply".

Yoshihiro Shimoda (9):
  phy: rcar-gen3-usb2: remove unnecesary struct rcar_gen3_data
  phy: rcar-gen3-usb2: Add vbus-supply to handle VBUS on/off
  phy: rcar-gen3-usb2: add extcon support
  arm64: dts: r8a7795: add usb2_phy device nodes
  arm64: dts: r8a7795: add USB2.0 Host (EHCI/OHCI) device nodes
  arm64: dts: r8a7795: add HS-USB device node
  arm64: dts: salvator-x: enable usb2_phy
  arm64: dts: salvator-x: enable USB 2.0 Host channels
  arm64: dts: salvator-x: enable HS-USB

 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |   2 +
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  73 +++++++++++++-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 107 +++++++++++++++++++++
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/phy-rcar-gen3-usb2.c                   |  87 +++++++++++++----
 5 files changed, 250 insertions(+), 20 deletions(-)

-- 
1.9.1
