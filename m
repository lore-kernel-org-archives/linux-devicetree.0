From: Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 0/3] media: Add support for Cadence CSI2RX version 2.1
Date: Thu, 5 Sep 2019 11:55:58 +0100
Message-ID: <20190905105601.27034-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rafalc@cadence.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patchset adds support for Cadence CSI2RX controller version 2.1.
It currently limits maximum amount of data lanes to 4.
Existing compatibility with v1.3 is maintained.

Jan Kotas (3):
  media: dt-bindings: Update bindings for Cadence CSI2RX
  media: Add lane checks for Cadence CSI2RX
  media: Add support for Cadence CSI2RX 2.1

 .../devicetree/bindings/media/cdns,csi2rx.txt      |   5 +-
 drivers/media/platform/cadence/cdns-csi2rx.c       | 152 +++++++++++++++++----
 2 files changed, 131 insertions(+), 26 deletions(-)

-- 
2.15.0
