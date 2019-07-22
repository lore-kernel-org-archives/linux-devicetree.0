From: Jan Kotas <jank@cadence.com>
Subject: [PATCH v2 0/4] media: Add support for Cadence CSI2TX version 2.1
Date: Mon, 22 Jul 2019 09:22:19 +0100
Message-ID: <20190722082223.18693-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rafalc@cadence.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patchset adds support for Cadence CSI2TX controller version 2.1.
Existing compatibility with v1.3 is updated and maintained. 

Jan Kotas (4):
  media: dt-bindings: Update bindings for Cadence CSI2TX version 2.1
  media: Add lane checks for Cadence CSI2TX
  media: Fix Lane mapping in Cadence CSI2TX
  media: Add support for Cadence CSI2TX 2.1

 .../devicetree/bindings/media/cdns,csi2tx.txt      |   3 +-
 drivers/media/platform/cadence/cdns-csi2tx.c       | 155 ++++++++++++++++-----
 2 files changed, 125 insertions(+), 33 deletions(-)

-- 
2.15.0
