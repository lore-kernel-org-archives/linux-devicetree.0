From: Bernd Edlinger <bernd.edlinger-PkbjNfxxIASELgA04lAiVw@public.gmane.org>
Subject: [PATCHv4 0/2] GPIO driver and bindings for Altera FPGA Manager I/O
Date: Thu, 19 Oct 2017 16:28:56 +0000
Message-ID: <AM5PR0701MB2657BA2192907CBBBD42A22FE4420@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Part 1 (bindings) addresses review comments.
- removes driver name from the change log
- removes documentation of "status"

Part 2 (driver) is unchanged.

Bernd Edlinger (2):
  Add device tree bindings for Altera FPGA Manager GPIO
  Add a GPIO driver for Altera FPGA Manager Fabric I/O

 .../bindings/gpio/gpio-altera-fpgamgr.txt          |  43 ++++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-altera-fpgamgr.c                 | 219 +++++++++++++++++++++
 4 files changed, 269 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
 create mode 100644 drivers/gpio/gpio-altera-fpgamgr.c

-- 
1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
