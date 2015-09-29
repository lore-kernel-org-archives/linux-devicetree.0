From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] usb: renesas_usbhs: Add support for R-Car H3
Date: Tue, 29 Sep 2015 18:21:17 +0900
Message-ID: <1443518479-2864-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-sh-owner@vger.kernel.org>
Sender: linux-sh-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, balbi@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-usb@vger.kernel.org, linux-sh@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

 This patch is based on the latest Felipe's usb.git / testing/next
branch (The commit id = f3a464c9f5be1bb93a4355bd5a433dbc2c0bf7fd).

Changes from v1:
 - Add a patch to fix build warning if 64-bit environment as patch 1/2
 - Add a comment in patch 2/2

Yoshihiro Shimoda (2):
  usb: renesas_usbhs: fix build warning if 64-bit architecture
  usb: renesas_usbhs: Add support for R-Car H3

 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 1 +
 drivers/usb/renesas_usbhs/common.c                      | 7 ++++++-
 include/linux/usb/renesas_usbhs.h                       | 2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

-- 
1.9.1

