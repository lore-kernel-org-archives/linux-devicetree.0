From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: [PATCH 0/3] Finish Armada DRM DT support
Date: Tue, 10 Jul 2018 11:23:44 +0100
Message-ID: <20180710102344.GH17271@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, David Airlie <airlied@linux.ie>, Gregory Clement <gregory.clement@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Finish Armada DRM support for DT, finally allowing mainline kernels to
use this driver unimpeded.

 arch/arm/boot/dts/dove-cubox.dts     | 43 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/armada/Makefile      |  3 +++
 drivers/gpu/drm/armada/armada_drv.c  | 29 ++++++++++++++++++---
 drivers/gpu/drm/armada/armada_rmem.c | 49 ++++++++++++++++++++++++++++++++++++
 4 files changed, 121 insertions(+), 3 deletions(-)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 13.8Mbps down 630kbps up
According to speedtest.net: 13Mbps down 490kbps up
