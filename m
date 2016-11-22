From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/4] [media] davinci: VPIF: add DT support
Date: Mon, 21 Nov 2016 17:44:04 -0800
Message-ID: <20161122014408.22388-1-khilman@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, =?UTF-8?q?Bartosz=20Go=C5=82aszewski?= <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT support, including getting subdevs from DT ports/endpoints.

Changes since v1:
- more specific compatible strings, based on SoC: ti,da850-vpif*
- fix locking bug when unlocking over subdev s_stream

Kevin Hilman (4):
  [media] davinci: add support for DT init
  [media] davinci: vpif_capture: don't lock over s_stream
  [media] davinci: vpif_capture: get subdevs from DT
  [media] dt-bindings: add TI VPIF documentation

 .../bindings/media/ti,da850-vpif-capture.txt       |  65 +++++++++
 .../devicetree/bindings/media/ti,da850-vpif.txt    |   8 ++
 drivers/media/platform/davinci/vpif.c              |   9 ++
 drivers/media/platform/davinci/vpif_capture.c      | 147 ++++++++++++++++++++-
 include/media/davinci/vpif_types.h                 |   9 +-
 5 files changed, 232 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/ti,da850-vpif-capture.txt
 create mode 100644 Documentation/devicetree/bindings/media/ti,da850-vpif.txt

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
