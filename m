From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/5] arm64: dts: r8a7795: Add HSUSB device node and enable channel 0 of USB2.0
Date: Thu, 21 Jul 2016 19:46:56 +0900
Message-ID: <1469098021-7692-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch is based on the renesas.git / renesas-devel-20160718-v4.7-rc7 tag.

Changes from v2:
 - rebase on renesas.git / renesas-devel-20160718-v4.7-rc7.
  - maybe the panic issue disappears on the tree. but, if still happens,
    please try the following patch:
    https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=c14f8a4032efa73d9c4e155add47c19252b3bdf4
 - remove the redundant instruction in patch 4.
 - add a new patch that enables HSUSB driver as kernel module on the defconfig.

Changes from v1:
 - fix compatible string of hsusb in patch 1.
 - fix patch 2 for "make dtbs W=1" warning.

Yoshihiro Shimoda (5):
  arm64: dts: r8a7795: Add HSUSB device node
  arm64: dts: salvator-x: enable usb2_phy of channel 0
  arm64: dts: salvator-x: enable USB 2.0 Host channel 0
  arm64: dts: salvator-x: enable HSUSB
  arm64: defconfig: Add Renesas R-Car HSUSB driver support as module

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 36 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 17 ++++++++++
 arch/arm64/configs/defconfig                       |  2 ++
 3 files changed, 55 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
