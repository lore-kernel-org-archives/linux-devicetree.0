From: Ludovic Barre <ludovic.Barre@st.com>
Subject: [PATCH  0/2] ARM: dts: stm32: qspi update for stm32mp157c-ev1
Date: Fri, 8 Mar 2019 16:10:21 +0100
Message-ID: <1552057823-10876-1-git-send-email-ludovic.Barre@st.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-kernel@vger.kernel.org, Ludovic Barre <ludovic.barre@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Ludovic Barre <ludovic.barre@st.com>

This patch series add sleep pins configuration needed to suspend support
and add jedec compatible for 2 nor flash of stm32mp157c-ev1.

Ludovic Barre (2):
  ARM: dts: stm32: add pinctrl sleep config for qspi on stm32mp157c-ev1
  ARM: dts: stm32: add jedec compatible for nor flash on stm32mp157c-ev1

 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts     |  5 ++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

-- 
2.7.4
