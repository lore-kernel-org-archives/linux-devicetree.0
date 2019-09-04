Return-Path: <SRS0=Klmi=W7=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH RESEND v7 0/3] Add USB3.0 and TI HD3SS3220 driver support
Date: Wed,  4 Sep 2019 09:15:38 +0100
Message-Id: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This series adds USB 3.0 support for the CAT874 platform, including a
new driver for the TI HD3SS3220 USB Type-C DRP port controller.

Patch4-7 on the v7 series been accepted and is in linux-rc tree.
Resending patch 1-3 of v7 series, since the dependency patches [1], [2],[3],[4]
is accpted for usb-next.

This patchset is based on usb-next tree.

[1] commit 451d15a1731c7db9d4868 ("dt-binding: usb: add usb-role-switch property")
[2] commit 977607653cdd06a2c4d1d ("usb: roles: Introduce stubs for the exiting functions in role.h")
[3] commit 44493062abc38e5895e0c ("device connection: Add fwnode_connection_find_match()")
[4] commit a31f01777bc54a0a9d576 ("usb: roles: Add fwnode_usb_role_switch_get() function")

V7-->V7 RESEND
  * No change
    (https://patchwork.kernel.org/patch/10969911/)
V6-->V7
  * Rebased on the below patch series
    (https://patchwork.kernel.org/project/linux-usb/list/?series=124223)
  * Updted the hd3ss3220 binding documentation
    -> Removed Rob's reviewed by tag, since there is a rework.
    -> Incorporated Sergie and Shimoda-San's review comment.
     (https://patchwork.kernel.org/patch/10944629/)
  * Rebased hd3ss3220 driver based on the new API
    --> Removed Heikki's review comment, since there is a rework
    (https://patchwork.kernel.org/patch/10942499/)
  * Incorporated shimoda-san's review comments for renesas usb3 binding
    (https://patchwork.kernel.org/patch/10944631/)
  * Incorporated shimoda-san's review comments for renesas usb3 driver
    (https://patchwork.kernel.org/patch/10944643/)
V5-->V6
  * Updated bindings patch by using usb-role-switch property
  * Used graph api's to get role switch supported by the usb-c-connector
V4-->V5
  * Incorporated Heikki's review comment.
    (https://patchwork.kernel.org/patch/10902531/)
  * Patch 1 is a dependency patch to make the compilation successful.
    (https://patchwork.kernel.org/patch/10909971/)
  * Patch 2 is also dependency patch to make the compilation successful.
    Rebased on top of Patch1 and fixed Heikki's review comments
    (https://patchwork.kernel.org/patch/10882555/)
  * Incorporated Shimoda-San's review comment.
    (https://patchwork.kernel.org/patch/10902535/)
V3-->V4
  * Incorporated Chunfeng Yun's review comment
    (https://patchwork.kernel.org/project/linux-usb/list/?submitter=133171)
  * Used fwnode API's to get roleswitch handle

V2-->V3
  * Used the new API to usb_role_switch by node to find the remote endpoint
    (https://patchwork.kernel.org/patch/10882555/)
  * Added renesas,usb-role-switch property
  * Incorporated shimoda-san's review comment
    (https://patchwork.kernel.org/patch/10852507/)

V1-->V2
  * Use USB role class instead of extcon to receive connect and disconnect
    events and also for the dual role switch.
  * Dropped patch 6
  * Squashed patch 8 and patch 9
  * https://patchwork.kernel.org/cover/10840641/


Biju Das (3):
  dt-bindings: usb: hd3ss3220 device tree binding document
  usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller
  dt-bindings: usb: renesas_usb3: Document usb role switch support

 .../devicetree/bindings/usb/renesas,usb3-peri.txt  |  23 ++
 .../devicetree/bindings/usb/ti,hd3ss3220.txt       |  38 +++
 drivers/usb/typec/Kconfig                          |  10 +
 drivers/usb/typec/Makefile                         |   1 +
 drivers/usb/typec/hd3ss3220.c                      | 259 +++++++++++++++++++++
 5 files changed, 331 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
 create mode 100644 drivers/usb/typec/hd3ss3220.c

-- 
2.7.4
