From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: [RESEND Patch 0/2] DT vendor/soc updates
Date: Wed,  5 Mar 2014 22:21:12 +0100
Message-ID: <1394054474-4310-1-git-send-email-andrew@lunn.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a resend because i've been told they did not make it to the
list properly.

Andrew Lunn (2):
  DT: Vendor: Add prefixes used by Kirkwood devices
  DT: bindings: add missing Marvell Kirkwood SoC documentation

 .../devicetree/bindings/arm/marvell,kirkwood.txt   | 97 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.txt        | 13 +++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell,kirkwood.txt

-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
