From: <linux-kernel-dev@beckhoff.com>
Subject: [PATCH v2 0/2] Add CX9020 device tree
Date: Thu, 13 Jul 2017 13:04:11 +0200
Message-ID: <20170713110413.12721-1-linux-kernel-dev@beckhoff.com>
References: <20170712090408.12212-1-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170712090408.12212-1-linux-kernel-dev@beckhoff.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Patrick Bruenn <p.bruenn@beckhoff.com>, David Airlie <airlied@linux.ie>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

From: Patrick Bruenn <p.bruenn@beckhoff.com>

Add device tree for Beckhoff CX9020 Embedded PC.

The CX9020 differs from i.MX53 Quick Start Board by:
- use uart2 instead of uart1
- DVI-D connector instead of VGA
- no audio
- CCAT FPGA connected to emi
- enable rtc

Patrick Bruenn (2):
  ARM: dts: imx: add CX9020 Embedded PC device tree
  drm/panel: simple: Add support for ddc-only panel

 arch/arm/boot/dts/Makefile           |   1 +
 arch/arm/boot/dts/imx53-cx9020.dts   | 370 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c |   6 +
 3 files changed, 377 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx53-cx9020.dts

-- 
2.11.0
