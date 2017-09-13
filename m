From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a77995 and draak: add support EthernetAVB
Date: Wed, 13 Sep 2017 21:18:37 +0900
Message-ID: <1505305119-4257-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch is based on the renesas-drivers.git /
renesas-drivers-2017-09-05-v4.13 tag.

Yoshihiro Shimoda (2):
  arm64: dts: renesas: r8a77995: Add EthernetAVB device node
  arm64: dts: renesas: r8a77995: draak: enable EthernetAVB

 arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 25 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi      | 45 ++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
