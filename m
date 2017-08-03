From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] arm64: dts: r8a7796: add USB-DMAC and HSUSB device nodes
Date: Thu,  3 Aug 2017 21:29:15 +0900
Message-ID: <1501763357-26075-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch is based on the renesas.git / renesas-devel-20170731v2-v4.13-rc3 tag.

For usb-dmac, we should wait for the following patch (even if we don't apply
the patch, the usb-dmac driver can be probed correctly though.)
 https://patchwork.kernel.org/patch/9876639/

For hsusb, we need the "arm64: dts: r8a7796: add usb host device nodes" patch
set for using usb2_phy0.

Yoshihiro Shimoda (2):
  arm64: dts: r8a7796: Add USB-DMAC device nodes
  arm64: dts: r8a7796: Add HSUSB device node

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 43 +++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
