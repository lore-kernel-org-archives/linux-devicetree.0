From: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: [PATCH 0/2] ARM: dts: r8a7743: Timer node nodes out of bus
Date: Thu,  7 Dec 2017 11:19:21 +0100
Message-ID: <20171207101923.19846-1-horms+renesas@verge.net.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Move the timer node, which have no reg property, out of the root node.
The nodes that have been moved do not have any register properties and thus
shouldn't be placed on the bus.

In preparation for the above sort nodes in the root node alphabetically.

Based on renesas-devel-20171207-v4.15-rc2

Simon Horman (2):
  ARM: dts: r8a7743: sort root sub-nodes alphabetically
  ARM: dts: r8a7743: move timer node out of bus

 arch/arm/boot/dts/r8a7743.dtsi | 86 ++++++++++++++++++++++--------------------
 1 file changed, 45 insertions(+), 41 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
