From: allen <allen.chen@ite.com.tw>
Subject: [PATCH v3 0/2] IT6505 cover letter
Date: Thu, 12 Sep 2019 11:32:27 +0800
Message-ID: <1568259199-5827-1-git-send-email-allen.chen@ite.com.tw>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Allen Chen <allen.chen@ite.com.tw>, Pi-Hsun Shih <pihsun@chromium.org>, Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, Heiko Stuebner <heiko@sntech.de>, Icenowy Zheng <icenowy@aosc.io>, Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Maxime Ripard <mripard@kernel.org>
List-Id: devicetree@vger.kernel.org

The IT6505 is a high-performance DisplayPort 1.1a transmitter, fully compliant with DisplayPort 1.1a, HDCP 1.3 specifications. The IT6505 supports color depth of up to 36 bits (12 bits/color) and ensures robust transmission of high-quality uncompressed video content, along with uncompressed and compressed digital audio content.

This series contains document bindings, Kconfig to control the function enable or not.

Allen Chen (2):
  WIP: dt-bindings: Add binding for IT6505.
  WIP: drm/bridge: add it6505 driver

 .../bindings/display/bridge/ite,it6505.txt         |   28 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 drivers/gpu/drm/bridge/Kconfig                     |    7 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/ite-it6505.c                | 2531 ++++++++++++++++++++
 5 files changed, 2569 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.txt
 create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c

-- 
1.9.1
