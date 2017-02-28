From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 0/4] ARM: dts: da850-evm: vpif DT changes
Date: Tue, 28 Feb 2017 17:15:12 +0100
Message-ID: <1488298516-14363-1-git-send-email-bgolaszewski@baylibre.com>
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
To: Sekhar Nori <nsekhar@ti.com>, David Lechner <david@lechnology.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Patrick Titiano <ptitiano@baylibre.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

This series adds necessary changes to make vpif work on the da850-evm
board.

The first patch only contains whitespace error fixes.

The second patch add a pinctrl node for vpif display pins.

The third adds the UI expander node that is needed to select the video
capture functionality.

The last patch extends the vpif node with an output port.

v1 -> v2:
- used enable-gpios property instead of gpio hogs
- renamed the UI expander
- corrected the commit message in patch 2/4

v2 -> v3:
- removed the enable-gpios property - it may take some more time to
  determine the correct solution for enable-gpios, so I decided to
  respin the series without it and send it later as a follow-up

Bartosz Golaszewski (4):
  ARM: dts: da850-evm: fix whitespace errors
  ARM: dts: da850: add vpif video display pins
  ARM: dts: da850-evm: add the UI expander node
  ARM: dts: da850-evm: add the output port to the vpif node

 arch/arm/boot/dts/da850-evm.dts | 31 +++++++++++++++++++++----------
 arch/arm/boot/dts/da850.dtsi    | 25 ++++++++++++++++++++++---
 2 files changed, 43 insertions(+), 13 deletions(-)

-- 
2.9.3
