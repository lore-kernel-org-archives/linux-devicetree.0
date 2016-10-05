From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/3] reset: Add support for OX820 SoC
Date: Wed,  5 Oct 2016 17:23:33 +0200
Message-ID: <20161005152336.467-1-narmstrong@baylibre.com>
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
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-oxnas@lists.tuxfamily.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

This patchset adds support for the reset controller in the Oxford
Semiconductor OX820 SoC, big brother of the OX810SE.

Since this driver uses a regmap access, it's important to tag each
compatible SoC since the regmap offset could differ in later SoCs.

This patchet also moves the reset indices to a clean DT include file.

Changes since v1 at: http://lkml.kernel.org/r/20160909131955.27334-1-narmstrong@baylibre.com
 - Reformat bindings
 - Add reference to include files in bindings

Neil Armstrong (3):
  reset: oxnas: Add OX820 support
  dt-bindings: reset: oxnas: Add include file with reset indexes
  dt-bindings: reset: oxnas: Update for OX820

 .../devicetree/bindings/reset/oxnas,reset.txt      | 39 ++--------------
 drivers/reset/reset-oxnas.c                        |  1 +
 include/dt-bindings/reset/oxsemi,ox810se.h         | 53 ++++++++++++++++++++++
 include/dt-bindings/reset/oxsemi,ox820.h           | 53 ++++++++++++++++++++++
 4 files changed, 110 insertions(+), 36 deletions(-)
 create mode 100644 include/dt-bindings/reset/oxsemi,ox810se.h
 create mode 100644 include/dt-bindings/reset/oxsemi,ox820.h

-- 
2.7.0
