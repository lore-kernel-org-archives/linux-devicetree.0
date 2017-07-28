From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] usb: gadget: udc: renesas_usb3: add support for some R-Car Gen3 SoCs
Date: Fri, 28 Jul 2017 21:16:56 +0900
Message-ID: <1501244219-11840-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on the latest Felipe's usb.git / testing/next branch
(the commit id = 5771a8c08880cdca3bfb4a3fc6d309d6bba20877)

Yoshihiro Shimoda (3):
  usb: gadget: udc: renesas_usb3: add debugfs to set the b-device mode
  usb: gadget: udc: renesas_usb3: add support for R-Car H3 ES2.0
  usb: gadget: udc: renesas_usb3: add support for R-Car M3-W

 .../devicetree/bindings/usb/renesas_usb3.txt       |  16 ++-
 drivers/usb/gadget/udc/renesas_usb3.c              | 113 ++++++++++++++++++++-
 2 files changed, 121 insertions(+), 8 deletions(-)

-- 
1.9.1
