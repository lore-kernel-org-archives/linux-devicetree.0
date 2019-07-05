From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 0/2] Add Sharp panel option for Lenovo Miix 630
Date: Fri,  5 Jul 2019 09:54:50 -0700
Message-ID: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

The Lenovo Miix 630 laptop can be found with one of two panels - a BOE
or Sharp option.  This likely provides options during manufacturing.

These panels connect via eDP, however they sit behind a DSI to eDP
bridge on the laptop, so they can easily be handled by the existing
simple panel code.

This series adds support for the Sharp option.

Jeffrey Hugo (2):
  dt-bindings: panel: Add Sharp LD-D5116Z01B
  drm/panel: simple: Add support for Sharp LD-D5116Z01B panel

 .../display/panel/sharp,ld-d5116z01b.txt      | 27 +++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 26 ++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt

-- 
2.17.1
