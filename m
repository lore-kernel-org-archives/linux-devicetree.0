From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 0/2] usb: host: ehci-platform: fix usb 1.1 device is not connected in system resume
Date: Mon, 20 Feb 2017 16:35:09 +0900
Message-ID: <1487576111-29287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

Since I'm not sure the helper functions can be in core/of.c,
I sent the patch set as RFC. I guess if these functions are not needed
to other codes, the functions should be into ehci-platform.c.

Yoshihiro Shimoda (2):
  usb: of: add functions to bind a companion controller
  usb: host: ehci-platform: fix usb 1.1 device is not connected in
    system resume

 Documentation/devicetree/bindings/usb/generic.txt |  1 +
 drivers/usb/core/of.c                             | 36 +++++++++++++++++++++++
 drivers/usb/host/ehci-platform.c                  |  8 +++++
 include/linux/usb/of.h                            | 10 +++++++
 4 files changed, 55 insertions(+)

-- 
1.9.1
