From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] arm64: dts: renesas: r8a779[56] and salvator-common: add usb3_phy and enable usb3_peri0
Date: Thu,  7 Dec 2017 18:55:38 +0900
Message-ID: <1512640542-10380-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set is based on the renesas.git / renesas-devel-20171205-v4.15-rc2
tag.

Yoshihiro Shimoda (4):
  arm64: dts: renesas: r8a7795: add usb3_phy node
  arm64: dts: renesas: r8a7796: add usb3_phy node
  arm64: dts: renesas: salvator-common: enable usb3_phy0 node
  arm64: dts: renesas: salvator-common: enable usb3_peri0

 arch/arm64/boot/dts/renesas/r8a7795.dtsi         | 26 ++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi         | 26 ++++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 19 +++++++++++++++++
 3 files changed, 71 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
