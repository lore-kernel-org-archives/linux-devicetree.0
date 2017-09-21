From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779[56]: add USB3.0 peripheral
Date: Thu, 21 Sep 2017 14:31:24 +0900
Message-ID: <1505971886-14916-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set is based on the renesas-drivers.git /
renesas-drivers-2017-09-19-v4.14-rc1 tag.

For now, I will not enable this channel on [HM]3 Salvator-X/XS because
 - we need a special cable (USB type-A to A cross cable).
 - we can swap the role by renesas_usb3 driver even if we use a normal cable
   and after usb3.0 host is running, but I think it's a special use case.

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a7795: add USB3.0 peripheral device node
  arm64: dts: renesas: r8a7796: add USB3.0 peripheral device node

 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
