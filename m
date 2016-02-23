From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/5] Add USB2.0 host support for R-Car H3
Date: Tue, 23 Feb 2016 21:28:31 +0900
Message-ID: <1456230516-5112-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on renesas.git / renesas-devel-20160223-v4.5-rc5 tag.
(commit id = d0475e2b81af0f6a4e7a9785662173b5a995a164)

This patch set needs the following patches to use the usb 2.0 host:
http://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=testing/next&id=cff0fef33d77bd7e98463029e5d0a4191d9bbb95
http://git.kernel.org/cgit/linux/kernel/git/kishon/linux-phy.git/commit/?h=next&id=c7af45e64087a4bebef955f0d005723c35f28176
http://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git/commit/?h=sh-pfc-for-v4.6&id=76250a6c89673f63e37c59772e97cc72f4c8097b

Yesterday, I sent the following patch set as RFC.
http://thread.gmane.org/gmane.linux.kernel.renesas-soc/1087

Today's patch set is related to the yesterday's patches. But, today's
patch set is:
 - not included about HSUSB node and USB 2.0 host channel 0 enabling because
   these are under construction for now.
 - included about defconfig for phy-rcar-gen3-usb2 driver.

Yoshihiro Shimoda (5):
  arm64: dts: r8a7795: add usb2_phy device nodes
  arm64: dts: r8a7795: add USB2.0 Host (EHCI/OHCI) device nodes
  arm64: dts: salvator-x: enable usb2_phy of channel 1 and 2
  arm64: dts: salvator-x: enable USB 2.0 Host of channel 1 and 2
  arm64: defconfig: Add Renesas R-Car Gen3 USB 2.0 phy driver support

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 40 +++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 94 ++++++++++++++++++++++
 arch/arm64/configs/defconfig                       |  1 +
 3 files changed, 135 insertions(+)

-- 
1.9.1
