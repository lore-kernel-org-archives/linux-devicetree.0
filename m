From: Peter Rosin <peda@axentia.se>
Subject: [PATCH v4 0/2] drm/panel: simple: add support for Sharp LQ150X1LG11 panels
Date: Tue, 4 Oct 2016 17:29:19 +0200
Message-ID: <1475594961-5713-1-git-send-email-peda@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi!

New attempt to get this upstreamed. v4 addresses review comments
from Rob (lvds -> sellvds and a couple of typos).

Cheers,
Peter

Gustaf Lindström (1):
  drm/panel: simple: add support for Sharp LQ150X1LG11 panels

Peter Rosin (1):
  dt-bindings: display: Add Sharp LQ150X1LG11 panel binding

 .../bindings/display/panel/sharp,lq150x1lg11.txt   | 36 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq150x1lg11.txt

-- 
2.1.4
