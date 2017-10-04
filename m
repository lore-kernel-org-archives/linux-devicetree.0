From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: [PATCH 0/2] ARM: dts: iwg20d-q7: New DT architecture
Date: Wed,  4 Oct 2017 10:18:31 +0100
Message-ID: <1507108713-10686-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some of the serial interfaces are exposed on the camera daughter board.
The camera daughter board can be connected to the carrier board
by means of expansion connectors 1, 2 and 3. The carrier board may host
an RZ/G1M or an RZ/G1N based SoM.
While adding support for the serial interfaces on the camera daughter
board we faced the dilemma of how to properly describe all of the
possible HW configurations and how to maximize code reuse.
The best option would be to use device tree overlays, however there is
still some work to be done on that front before actually using them,
therefore for the time being we decided to provide .dtsi files to
describe the carrier board and the camera daughter board, and provide
.dts files to describe the HW configurations we need to support.

Best regards,

Fabrizio Castro (2):
  ARM: dts: iwg20d-q7: Rework DT architecture
  ARM: dts: iwg20d-q7-dbcm-ca: Add device trees for camera DB

 arch/arm/boot/dts/Makefile                      |   1 +
 arch/arm/boot/dts/iwg20d-q7-common.dtsi         | 147 ++++++++++++++++++++++++
 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi        |  44 +++++++
 arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts |  19 +++
 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts         | 139 +---------------------
 5 files changed, 213 insertions(+), 137 deletions(-)
 create mode 100644 arch/arm/boot/dts/iwg20d-q7-common.dtsi
 create mode 100644 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
 create mode 100644 arch/arm/boot/dts/r8a7743-iwg20d-q7-dbcm-ca.dts

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
