From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Subject: [PATCH 0/5] Usb gadget devicetree bindings
Date: Tue, 26 Jun 2012 11:27:08 -0300
Message-ID: <1340720833-781-1-git-send-email-aletes.xgr@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Li Yang <leoli@freescale.com>, Alexandre Pereira da Silva <aletes.xgr@gmail.com>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Roland Stigge <stigge@antcom.de>
List-Id: devicetree@vger.kernel.org

This patch series adds support to set basic usb gadget properties via
devicetree.

I takes into account the sugestions from Rob Herring and Mitch Bradley.

This was only tested on ARM LPC32XX SOC. I'm including patches to other soc's as
an reference.

Alexandre Pereira da Silva (5):
  usb: gadget: lpc32xx_udc: Propagate devicetree to gadget drivers
  usb: gadget: s3c-hsotg: Propagate devicetree to gadget drivers
  usb: gadget: fsl_udc: Propagate devicetree to gadget drivers
  usb: gadget: at91_udc: Propagate devicetree to gadget drivers
  usb: gadget: composite: parse dt overrides

 Documentation/devicetree/bindings/usb/gadget.txt |   20 +++++++++++
 drivers/usb/gadget/at91_udc.c                    |    1 +
 drivers/usb/gadget/composite.c                   |   39 ++++++++++++++++++++++
 drivers/usb/gadget/fsl_udc_core.c                |    1 +
 drivers/usb/gadget/lpc32xx_udc.c                 |    1 +
 drivers/usb/gadget/s3c-hsotg.c                   |    1 +
 6 files changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/gadget.txt

-- 
1.7.10

