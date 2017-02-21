From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] usb: host: ehci-platform: fix usb 1.1 device is not connected in system resume
Date: Tue, 21 Feb 2017 19:59:46 +0900
Message-ID: <1487674788-12599-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: stern@rowland.harvard.edu, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

This patch set is based on Greg's usb.git / usb-next branch
(the commit id = 0df8a3dbacb585bb9c8b2e55de43c6aac9d86488).

This patch set is related to the following email threads:
 http://marc.info/?t=148653514200001&r=1&w=2
 http://marc.info/?t=148712534300005&r=1&w=2

Changes from v1 as RFC:
 - Remove usb_of_has_companion() API.

Yoshihiro Shimoda (2):
  usb: of: add functions to bind a companion controller
  usb: host: ehci-platform: fix usb 1.1 device is not connected in
    system resume

 Documentation/devicetree/bindings/usb/generic.txt |  1 +
 drivers/usb/core/of.c                             | 23 +++++++++++++++++++++++
 drivers/usb/host/ehci-platform.c                  |  7 +++++++
 include/linux/usb/of.h                            |  5 +++++
 4 files changed, 36 insertions(+)

-- 
1.9.1
