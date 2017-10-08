From: Bernd Edlinger <bernd.edlinger-PkbjNfxxIASELgA04lAiVw@public.gmane.org>
Subject: [PATCHv3 0/2] GPIO driver and bindings for Altera FPGA Manager I/O
Date: Sun, 8 Oct 2017 11:30:18 +0000
Message-ID: <AM5PR0701MB26574C348D239938F2E02482E4770@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As requested I re-send the GPIO driver and bindings as a patch series.
FAOD I incremented the patch version to v3, although nothing has changed.
First part is the bindings and second part is the driver.
Sorry for the confusion.

Bernd Edlinger (2):
  Add device tree bindings for Altera FPGA Manager GPIO
  Add a GPIO driver for Altera FPGA Manager Fabric I/O

 .../bindings/gpio/gpio-altera-fpgamgr.txt          |  45 +++++
 drivers/gpio/Kconfig                               |   6 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-altera-fpgamgr.c                 | 219 +++++++++++++++++++++
 4 files changed, 271 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-altera-fpgamgr.txt
 create mode 100644 drivers/gpio/gpio-altera-fpgamgr.c

-- 
1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
