Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 0/3] usb: renesas_usbhs: add reset_control and multiple clocks management
Date: Tue, 11 Sep 2018 17:47:02 +0900
Message-Id: <1536655625-10550-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch set is based on Felipe's usb.git / testing/next branch
(the commit id is 5b394b2ddf0347bef56e50c69a58773c94343ff3) with
the following patch:
  https://patchwork.kernel.org/patch/10574875/

Changes from v4:
 - Revise the dt-bindings to add how many clocks are required and expect
   for "renesas,rcar-gen3-usbhs".

Changes from v3:
 - Change the dt-bindings not to use clock-names in patch 2.
 - To achieve backward compatibility with old DT, the driver should get
   the first clock and the second clock is an optional.
 - Add "clk_put" calling in the remove function.

Changes from v2:
 - Use clk_bulk_enable_prepare() instead of two functions on patch 3/3.

Changes from v1:
 - Fix error path on patch 3/3.
 - Use clk_bulk_disable_unprepare() instead of two functions on patch 3/3.
 - Use staic array of struct clk_bulk_data instead of a pointer on patch 3/3.
 

Yoshihiro Shimoda (3):
  usb: renesas_usbhs: Add reset_control
  dt-bindings: usb: renesas_usbhs: add clock-names property
  usb: renesas_usbhs: Add multiple clocks management

 .../devicetree/bindings/usb/renesas_usbhs.txt      |   6 +-
 drivers/usb/renesas_usbhs/common.c                 | 100 +++++++++++++++++++++
 drivers/usb/renesas_usbhs/common.h                 |   4 +
 3 files changed, 109 insertions(+), 1 deletion(-)

-- 
1.9.1
