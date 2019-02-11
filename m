From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v3 0/7] sunxi: Add DT representation for the MBUS controller
Date: Mon, 11 Feb 2019 16:02:48 +0100
Message-ID: <cover.f2e5fbb4d21384168973fa32377a33d627768146.1549897336.git-series.maxime.ripard@bootlin.com>
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
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@bootlin.com>
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org, Georgi Djakov <georgi.djakov@linaro.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Yong Deng <yong.deng@magewell.com>, Robin Murphy <robin.murphy@arm.com>, Dave Martin <dave.martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

We've had for quite some time to hack around in our drivers to take into
account the fact that our DMA accesses are not done through the parent
node, but through another bus with a different mapping than the CPU for the
RAM (0 instead of 0x40000000 for most SoCs).

After some discussion after the submission of a camera device suffering of
the same hacks, I've decided to put together a serie that introduce a
special interconnect name called "dma" that that allows to express the DMA
relationship between a master and its bus, even if they are not direct
parents in the DT.

Let me know what you think,
Maxime

Changes from v2:
  - Rewrite commit logs still mentionning dma-parent
  - Removed dma-parent-cells left over in the binding example
  - Removed dma-parent still being mentionned in comments

Changes from v1:
  - Change to use the now merged interconnect bindings
  - Move the DMA parent retrieval logic to its own function
  - Rebase on top of 5.0

Maxime Ripard (7):
  dt-bindings: interconnect: Add a dma interconnect name
  dt-bindings: bus: Add binding for the Allwinner MBUS controller
  of: address: Add parent pointer to the __of_translate_address args
  of: address: Add support for the parent DMA bus
  drm/sun4i: Rely on dma interconnect for our RAM offset
  clk: sunxi-ng: sun5i: Export the MBUS clock
  ARM: dts: sun5i: Add the MBUS controller

 Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt      | 36 +++++-
 Documentation/devicetree/bindings/interconnect/interconnect.txt |  3 +-
 arch/arm/boot/dts/sun5i.dtsi                                    | 13 ++-
 drivers/clk/sunxi-ng/ccu-sun5i.h                                |  4 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c                           | 28 +++-
 drivers/of/address.c                                            | 49 +++++--
 include/dt-bindings/clock/sun5i-ccu.h                           |  2 +-
 7 files changed, 114 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/sunxi/sunxi-mbus.txt

base-commit: 87e87c7b0eeb3c9e08cdfe28fd540247bdf31ef5
-- 
git-series 0.9.1
