From: Henry Chen <henryc.chen@mediatek.com>
Subject: Add support for regulator operation mode of mt6397
Date: Mon, 23 May 2016 15:13:28 +0800
Message-ID: <1463987611-32139-1-git-send-email-henryc.chen@mediatek.com>
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
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Some regulators support different operating modes, but there is no suitable
property that can pass the opeation mode constraints on runtime at present.

This series making the change to specify supported modes as a devicetree list.
Consumers can change or get the regulator operation mode by regulator_set_mode
/regulator_get_mode and define the support operating mode on devicetree.

There is a requirement from SVS driver. SVS calibartion requires that the
regulator be in its low-noise (pwm mode) state at boot, but at all other times
it can be normal mode for power saving.
http://www.spinics.net/lists/devicetree/msg111204.html

Changes in v2:
- Separate patch for binding document changes.
- Create a header to define operation mode on dt-bindings.
- Remove the property "regulator-supported-modes".

Henry Chen (3):
  regulator: DT: Add DT property for operation mode configuration
  regulator: of: Add support for parsing operation mode
  regulator: mt6397: Add buck change mode regulator interface for mt6397

 .../devicetree/bindings/regulator/regulator.txt    |  5 ++
 drivers/regulator/mt6397-regulator.c               | 89 +++++++++++++++++++---
 drivers/regulator/of_regulator.c                   | 15 +++-
 include/dt-bindings/regulator/regulator.h          | 14 ++++
 4 files changed, 113 insertions(+), 10 deletions(-)
 create mode 100644 include/dt-bindings/regulator/regulator.h

-- 
1.8.1.1.dirty
