From: allen <allen.chen@ite.com.tw>
Subject: [PATCH 0/3] IT6505 cover letter
Date: Wed, 8 May 2019 17:31:55 +0800
Message-ID: <1557307985-21228-1-git-send-email-allen.chen@ite.com.tw>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: allen.chen@ite.com.tw
Cc: Pi-Hsun Shih <pihsun@chromium.org>, Amithash Prasad <amithash@fb.com>, Ben Whitten <ben.whitten@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Heiko Stuebner <heiko@sntech.de>, Johan Hovold <johan@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>, Nickey Yang <nickey.yang@rock-chips.com>, Rob
List-Id: devicetree@vger.kernel.org

The IT6505 is a high-performance DisplayPort 1.1a transmitter, fully compliant with DisplayPort 1.1a, HDCP 1.3 specifications. The IT6505 supports color depth of up to 36 bits (12 bits/color) and ensures robust transmission of high-quality uncompressed video content, along with uncompressed and compressed digital audio content.

This series contains document bindings, Kconfig to control the function enable or not.

Allen Chen (3):
  dt-bindings: Add binding for IT6505.
  drm/bridge: add it6505 driver
  drm/bridge: it6505 driver add char device feature.

 .../bindings/display/bridge/ite,it6505.txt         |   30 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 drivers/gpu/drm/bridge/Kconfig                     |   22 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/ite-it6505.c                | 2768 ++++++++++++++++++++
 5 files changed, 2822 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.txt
 create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c

-- 
1.9.1
