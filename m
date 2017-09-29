From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] usb: gadget: udc: renesas_usb3: add suspend/resume and generic phy
Date: Fri, 29 Sep 2017 20:44:58 +0900
Message-ID: <1506685501-24988-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on the latest Felipe's usb.git / testing/next branch
(commit id = af846d7ab55c846af6d6f150e9af96295101e068)

Kazuya Mizuguchi (1):
  usb: gadget: udc: renesas_usb3: move pm_runtime_{en,dis}able()

Yoshihiro Shimoda (2):
  usb: gadget: udc: renesas_usb3: Add suspend/resume functions
  usb: gadget: udc: renesas_usb3: add support for generic phy

 .../devicetree/bindings/usb/renesas_usb3.txt       |  4 ++
 drivers/usb/gadget/udc/renesas_usb3.c              | 64 ++++++++++++++++++++--
 2 files changed, 64 insertions(+), 4 deletions(-)

-- 
1.9.1
