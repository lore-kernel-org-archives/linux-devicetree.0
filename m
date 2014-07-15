From: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCHv6 0/2] add DT endianness binding support for regmap
Date: Tue, 15 Jul 2014 12:23:01 +0800
Message-ID: <1405398183-31345-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Changes in V6:
- there is some mistake for V5 patch series, resend it.

Changes in V5:
- remove the register's dt endianness support for it will always be BE
  for now.
- only support the register values buffers dt endianness support.



Xiubo Li (2):
  regmap: add DT endianness binding support.
  dt/bindings: Add the DT binding documentation for endianness

 .../devicetree/bindings/regmap/regmap.txt          |  48 +++++++++
 drivers/base/regmap/regmap-i2c.c                   |   2 +
 drivers/base/regmap/regmap-spi.c                   |   2 +
 drivers/base/regmap/regmap.c                       | 117 +++++++++++++++++++--
 4 files changed, 158 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regmap/regmap.txt

-- 
1.8.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
