From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 0/2] media: dt-bindings: extend the vpif bindings
Date: Tue, 28 Feb 2017 17:08:52 +0100
Message-ID: <1488298134-6200-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sekhar Nori <nsekhar@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

This series adds pdata quirks and other changes required to make vpif
work on the da850-evm board.

v1 -> v2:
- added patch 3/3
- specified the purpose of port@0 and port@1 nodes

v2 -> v3:
- removed patch 3/3 - it may take some more time to determine the
  correct solution for enable-gpios, so I decided to respin the
  series without it and send it later as a follow-up
- added Rob Herring's acks

Bartosz Golaszewski (2):
  media: dt-bindings: vpif: fix whitespace errors
  media: dt-bindings: vpif: extend the example with an output port

 .../devicetree/bindings/media/ti,da850-vpif.txt    | 50 ++++++++++++++++------
 1 file changed, 37 insertions(+), 13 deletions(-)

-- 
2.9.3
