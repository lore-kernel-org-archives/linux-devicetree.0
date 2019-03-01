From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH 0/3]  ARM: dts: stm32: IPCC mailbox support on STM32MP157c
Date: Fri, 1 Mar 2019 10:18:36 +0100
Message-ID: <1551431919-23410-1-git-send-email-fabien.dessenne@st.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Cc: Fabien Dessenne <fabien.dessenne@st.com>
List-Id: devicetree@vger.kernel.org

Support IPCC mailbox on STM32MP157c-ed1 and STM32MP157a-dk1 boards.

Fabien Dessenne (3):
  ARM: dts: stm32: add IPCC mailbox support on STM32MP157c
  ARM: dts: stm32: enable IPCC mailbox support on STM32MP157c-ed1
  ARM: dts: stm32: enable IPCC mailbox support on STM32MP157a-dk1

 arch/arm/boot/dts/stm32mp157a-dk1.dts |  4 ++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts |  4 ++++
 arch/arm/boot/dts/stm32mp157c.dtsi    | 15 +++++++++++++++
 3 files changed, 23 insertions(+)

-- 
2.7.4
