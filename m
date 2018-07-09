From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v5 0/6] media: rcar-vin: Brush endpoint properties
Date: Mon,  9 Jul 2018 16:19:15 +0200
Message-ID: <1531145962-1540-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com, horms@verge.net.au, geert@glider.be
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, hans.verkuil@cisco.com, sakari.ailus@linux.intel.com, Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,
   based on Niklas', Laurent's and Sakari's comments on v4, here it is a new
version of this series brushing R-Car VIN interface device tree bindings
description.

The interface supports the following configurable properties:
- hsync, vsync and data-enable signal polarities
- field signal polarity during even field
- parallel data bus widht and data shift.

As preferred by Niklas, I have listed the properties in the Gen2 section of the
bindings documentation, and referred to them in the Gen3 one.

The series, as v4 did, does introduce a new properties in 'video-interfaces.txt'
and for this reason the audiance is still a little larger than v3.

Thanks
   j

Jacopo Mondi (6):
  dt-bindings: media: rcar-vin: Align Gen2 and Gen3
  dt-bindings: media: rcar-vin: Describe optional ep properties
  dt-bindings: media: Document data-enable-active property
  media: v4l2-fwnode: parse 'data-enable-active' prop
  dt-bindings: media: rcar-vin: Add 'data-enable-active'
  media: rcar-vin: Handle data-enable polarity

 .../devicetree/bindings/media/rcar_vin.txt         | 29 +++++++++++++++++++---
 .../devicetree/bindings/media/video-interfaces.txt |  2 ++
 drivers/media/platform/rcar-vin/rcar-dma.c         |  5 ++++
 drivers/media/v4l2-core/v4l2-fwnode.c              |  4 +++
 include/media/v4l2-mediabus.h                      |  2 ++
 5 files changed, 38 insertions(+), 4 deletions(-)

--
2.7.4
