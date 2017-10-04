From: Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 0/2] pinctrl: rza1: add support for RZ/A1L
Date: Wed,  4 Oct 2017 16:07:22 -0500
Message-ID: <20171004210724.59797-1-chris.brandt@renesas.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, Chris Brandt <chris.brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The RZ/A series has 3 main device: RZ/A1L, RZ/A1M, RZ/A1H.

In terms of pinctrl, RZ/A1H and RZ/A1M are exactly the same.

Aspects like the number of ports and the location where peripherals are
brought out differ between the RZ/A1H and RZ/A1L.

Basically this series adds a new set of tables for RZ/A1L and a new
compatible "renesas,r7s72102-ports"

This was tested on a Renesas Stream it board which contains an RZ/A1L and
external SDRAM.

v3:
 * rewored DT documentation
 * Added Reviewed-by for renesas,rza1-pinctrl.txt
v2:
 * Added RZ/A1M to DT documentation
 * Added Reviewed-by for pinctrl-rza1.c

Chris Brandt (2):
  pinctrl: rza1: add support for RZ/A1L
  dt-bindings: pinctrl: add support for RZ/A1M and RZ/A1L

 .../bindings/pinctrl/renesas,rza1-pinctrl.txt      |   6 +-
 drivers/pinctrl/pinctrl-rza1.c                     | 134 +++++++++++++++++++++
 2 files changed, 138 insertions(+), 2 deletions(-)

-- 
2.14.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
