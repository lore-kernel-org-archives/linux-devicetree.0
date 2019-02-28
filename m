From: Hugues Fruchet <hugues.fruchet@st.com>
Subject: [PATCH 0/4] Enable stm32mp1 camera support
Date: Thu, 28 Feb 2019 15:25:41 +0100
Message-ID: <1551363945-19497-1-git-send-email-hugues.fruchet@st.com>
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
To: Alexandre Torgue <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

This patchset serie enables camera of stm32mp157c evaluation board.
To do so, both stm32mp157c DCMI camera interface driver and OV5640 camera
module driver are enabled in devicetree.

DCMI camera interface driver is enabled by default in multi_v7 configuration
but OV5640 driver remains to be selected at kernel configuration time.

This patchset depends on STMicroelectronics Multi-Function eXpander
(STMFX) support [1].

[1] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1944108.html

Hugues Fruchet (4):
  ARM: dts: stm32: add 2v8 fixed regulator for stm32mp157c-ed1 board
  ARM: dts: stm32: add DCMI camera interface support on stm32mp157c
  ARM: dts: stm32: add DCMI pins to stm32mp157c
  ARM: dts: stm32: enable OV5640 camera on stm32mp157c-ev1 board

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 41 ++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts     |  8 +++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     | 56 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c.dtsi        | 12 +++++++
 4 files changed, 117 insertions(+)

-- 
2.7.4
