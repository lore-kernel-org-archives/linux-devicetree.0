From: <gabriel.fernandez@st.com>
Subject: [PATCH 0/2] Introduce STM32MP1 Reset driver
Date: Tue, 13 Mar 2018 17:34:17 +0100
Message-ID: <1520958859-27911-1-git-send-email-gabriel.fernandez@st.com>
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
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Cc: devicetree@vger.kernel.org, benjamin GAIGNARD <benjamin.gaignard@st.com>, Loic PALLARDY <loic.pallardy@st.com>, sboyd@kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, gabriel.fernandez.st@gmail.com, Gabriel Fernandez <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Gabriel Fernandez <gabriel.fernandez@st.com>

This patch-set enables the reset of STM32MP1.
It uses the reset simple driver by introducing the clear register offset
parameter.
STM32MP1 reset IP has a register to assert by writing '1' and another
register to de-assert by writing '1'.
The offset between this two registers is '0x4'.

The patch 'dt-bindings: reset: add STM32MP1 resets' could be squashed
with the patch:
'dt-bindings: Document STM32MP1 Reset Clock Controller (RCC) bindings'
commit 3830681d354f

Gabriel Fernandez (2):
  dt-bindings: reset: add STM32MP1 resets
  reset: simple: Enable stm32mp1 reset driver

 drivers/reset/reset-simple.c                |  27 +++++--
 drivers/reset/reset-simple.h                |   1 +
 include/dt-bindings/reset/stm32mp1-resets.h | 108 ++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/reset/stm32mp1-resets.h

-- 
1.9.1
