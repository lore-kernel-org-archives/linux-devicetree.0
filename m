From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 0/2] Improve generic DT binding documentation for media devices
Date: Fri, 29 Sep 2017 11:23:39 +0300
Message-ID: <1506673421-6085-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, robh@kernel.org
List-Id: devicetree@vger.kernel.org

Hi folks,

This set improves the DT binding documentation for media devices where
device specific documentation is lacking and also documents that explicit
documentation of all properties supported by the device is required.

- Port and endpoint numbering
- lane numbering for the data-lanes property

since v2:

- Refer to Documentation/devicetree/bindings/graph.txt

- State that port and endpoint nodes need to be documented, but do not say
  that the numbering (unit-address and reg-property) is mandatory. This is
  in line with Device tree spec as well as graph.txt .

Sakari Ailus (2):
  dt: bindings: media: Document practices for DT bindings, ports,
    endpoints
  dt: bindings: media: Document data lane numbering without lane
    reordering

 .../devicetree/bindings/media/video-interfaces.txt         | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
2.7.4
