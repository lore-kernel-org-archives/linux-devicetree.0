From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 0/2] MSM8998 MTP Display
Date: Fri, 14 Jun 2019 11:55:47 -0700
Message-ID: <20190614185547.34518-1-jeffrey.l.hugo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, sam@ravnborg.org, bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
List-Id: devicetree@vger.kernel.org

Since we are trying to get the GPU and display hardware in the SoC
supported, it would be nice to be able to put the output on the
integrated panel for the reference platform.  To do so, we need support
in the Truly driver to support the specific panel variant for the
MSM8998 MTP.  This series adds taht support.

Jeffrey Hugo (2):
  dt-bindings: display: truly: Add MSM8998 MTP panel
  drm/panel: truly: Add MSM8998 MTP support

 .../bindings/display/truly,nt35597.txt        |   7 +-
 drivers/gpu/drm/panel/panel-truly-nt35597.c   | 149 +++++++++++++-----
 2 files changed, 116 insertions(+), 40 deletions(-)

-- 
2.17.1
