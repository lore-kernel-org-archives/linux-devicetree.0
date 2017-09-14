From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] arm64: dts: renesas: r8a77995 and draak: add USB2.0 Host
Date: Thu, 14 Sep 2017 19:30:39 +0900
Message-ID: <1505385043-1554-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set is based on the renesas-drivers.git /
renesas-drivers-2017-09-05-v4.13 tag.

The R-Car D3 USB2.0 PHY binding patch is not merged yet. But, this driver
can be probed and work by using fallback compatible value.

This patch set needs the following pinctrl patch:
 "[PATCH v2] pinctrl: sh-pfc: r8a77995: Add USB2.0 host support"

Otherwise, USB2.0 PHY driver cannot be probed.


Yoshihiro Shimoda (4):
  arm64: dts: renesas: r8a77995: Add USB2.0 PHY device node
  arm64: dts: renesas: r8a77995: add USB2.0 Host (EHCI/OHCI) device node
  arm64: dts: renesas: r8a77995: draak: enable USB2.0 PHY
  arm64: dts: renesas: r8a77995: draak: enable USB2.0 Host (EHCI/OHCI)

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 19 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi      | 37 ++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
