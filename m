From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] drm/omap: panel-tpo-td028ttec1: add backlight support
Date: Sat, 19 Jan 2019 19:21:29 +0100
Message-ID: <20190119182131.9341-1-andreas@kemnade.info>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tomi.valkeinen@ti.com, airlied@linux.ie, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, sre@kernel.org, dri-devel@lists.freedesktop.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

This panel has a backlight, so add a property describing that and
add the code to use that.
This makes things like xset dpms force off
also turn off the backlight, so we do not need to rely on additional
userspace programs to do that.

Andreas Kemnade (2):
  drm/omap: panel-tpo-td028ttec1: add backlight support
  dt-bindings: panel: td028ttec1: add backlight property

 .../bindings/display/panel/tpo,td028ttec1.txt          |  2 ++
 .../gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c    | 18 +++++++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

-- 
2.11.0
