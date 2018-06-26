From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 0/2] Fixup STM32MP157 device tree
Date: Tue, 26 Jun 2018 18:18:59 +0200
Message-ID: <1530029941-26089-1-git-send-email-alexandre.torgue@st.com>
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
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: ludovic.barre@st.com, devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This series:
 -remove gpio aliases as there are not used.
 -reorder nodes in stm32mp157c-ed1 file.

Regards
Alex

Alexandre Torgue (2):
  ARM: dts: stm32: remove gpio aliases for stm32mp157c
  ARM: dts: stm32: Reorder nodes in stm32mp157c-ed1

 arch/arm/boot/dts/stm32mp157c-ed1.dts | 22 +++++++++++-----------
 arch/arm/boot/dts/stm32mp157c.dtsi    | 14 --------------
 2 files changed, 11 insertions(+), 25 deletions(-)

-- 
2.7.4
