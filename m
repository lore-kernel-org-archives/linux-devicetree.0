From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH 0/2] drm/panel: add support for Foxlink FL500WVR00-A0T panel
Date: Thu,  5 Jun 2014 15:53:30 +0200
Message-ID: <1401976412-27436-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Boris BREZILLON <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hello,

This series adds a new entry in the vendor-prefixes.txt file for Foxlink
Group and defines Foxlink FL500WVR00-A0T panel specifications in the simple
panel driver.

Best Regards,

Boris


Boris BREZILLON (2):
  DT: add vendor prefix for Foxlink Group
  drm/panel: add support for Foxlink FL500WVR00-A0T panel

 .../bindings/panel/foxlink,fl500wvr00-a0t.txt      |  7 ++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 drivers/gpu/drm/panel/panel-simple.c               | 25 ++++++++++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/panel/foxlink,fl500wvr00-a0t.txt

-- 
1.8.3.2
