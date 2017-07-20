From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/4] dts: rskrza1: Add pin configurations
Date: Thu, 20 Jul 2017 13:20:15 -0500
Message-ID: <20170720182019.85075-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Now that the RZ/A1 pin control driver has appeared in 4.13-rc1, it
is safe to now add pin configurations for RZ/A1 boards.


Chris Brandt (4):
  arm: dts: rskrza1: Add SCIF2 pin group
  arm: dts: rskrza1: Add Ethernet pin group
  arm: dts: rskrza1: Add SDHI1 pin group
  arm: dts: rskrza1: Add LED0 pin support

 arch/arm/boot/dts/r7s72100-rskrza1.dts | 61 ++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

-- 
2.13.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
