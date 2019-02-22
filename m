From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v2 0/4] drm/panel: Support for OSD101T2045-53TS and OSD101T2587-53TS
Date: Fri, 22 Feb 2019 15:16:14 +0200
Message-ID: <20190222131618.20520-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tomi.valkeinen@ti.com, sam@ravnborg.org
List-Id: devicetree@vger.kernel.org

Hi,

Changes since v1 (only panel-osd-osd101t2587-53ts changed):
- Removed unused members from struct osd101t2587_panel
- Use backlight_enable/backlight_disable
- Use devm_of_find_backlight()
- osd101t2587_of_match table standardized 
- osd101t2587_panel_unprepare() added to shutdown and remove callbacks to turn
  power off
- Fix probe in case mipi_dsi_attach() would fail

Add support for OSD101T2045-53TS and OSD101T2587-53TS from One Stop Displays.

The two panel is similar with one big difference: OSD101T2587-53TS requires the
MIPI_DSI_TURN_ON_PERIPHERAL message, thus can not be handled by panel-simple.

Regards,
Peter
---
Peter Ujfalusi (4):
  dt-bindings: display: Add bindings for OSD101T2045-53TS
  drm/panel: simple: Add support for OSD101T2045-53TS
  dt-bindings: display: Add bindings for OSD101T2587-53TS panel
  drm/panel: Add OSD101T2587-53TS driver

 .../display/panel/osd,osd101t2045-53ts.txt    |  11 +
 .../display/panel/osd,osd101t2587-53ts.txt    |  14 +
 drivers/gpu/drm/panel/Kconfig                 |   6 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../drm/panel/panel-osd-osd101t2587-53ts.c    | 254 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  34 +++
 6 files changed, 320 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/osd,osd101t2045-53ts.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/osd,osd101t2587-53ts.txt
 create mode 100644 drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
