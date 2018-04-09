From: Peter Rosin <peda@axentia.se>
Subject: [PATCH 0/5] Add tda998x (HDMI) support to atmel-hlcdc
Date: Mon,  9 Apr 2018 12:59:13 +0200
Message-ID: <20180409105918.20792-1-peda@axentia.se>
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
To: linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Peter Rosin <peda@axentia.se>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi!

I naively thought that since there was support for both nxp,tda19988 (in
the tda998x driver) and the atmel-hlcdc, things would be a smooth ride.
But it wasn't, so I started looking around, and found some missing
pieces in the tilcdc driver. A "stole" some things and made it work
for my use case.

During this, I found that the tda998x driver never sets the format in
the connector display_info. Thus, the atmel-hlcdc driver fails to select
output format. Since I had similar problems with ds90c185 lvds encoder
I added patches to override the atmel-hlcdc output format via a DT
property and things start to play together.

Since this series superseeds the bridge series, I have included the
leftover bindings patch for the ti,ds90c185 here. I also noticed that
the driver date for atmel-hlcdc is bonkers, and added a patch for that.

However, I don't know if the tilcdc driver is interfacing with the
tda998x driver in a sane and modern way, and I don't know if I have
missed any subtle point when I "stole" the code and componentized the
atmel-hlcdc driver. I also have not tested how this behaves if I run
with the components as modules (not targeting that).

Anyway, this series solves some real issues for my HW.

Cheers,
Peter

Peter Rosin (5):
  dt-bindings: display: bridge: lvds-transmitter: add ti,ds90c185
  dt-bindings: display: atmel: add optional output-mode property
  drm/atmel-hlcdc: allow overriding the output mode
  drm/atmel-hlcdc: add support for connecting to tda998x HDMI encoder
  drm/atmel-hlcdc: fix broken release date

 .../devicetree/bindings/display/atmel/hlcdc-dc.txt |   4 +
 .../bindings/display/bridge/lvds-transmitter.txt   |   8 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c     |  12 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c       | 104 +++++++++++++++--
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.h       |  23 ++++
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   | 130 +++++++++++++++++++++
 6 files changed, 266 insertions(+), 15 deletions(-)

-- 
2.11.0
