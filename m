From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 0/2] Add support for STM32MP1 power regulators
Date: Mon, 8 Apr 2019 15:24:07 +0000
Message-ID: <1554737044-9460-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

The POWER block of the STM32MP1 integrates 3 fixed regulators with a ready
status bit for each one. The goal of this patchset is to add support those
regulators.

Pascal Paillet (2):
  dt-bindings: regulator: Add stm32mp1 pwr regulators
  regulator: Add support for stm32 power regulators

 .../bindings/regulator/st,stm32mp1-pwr-reg.txt     |  43 +++++
 drivers/regulator/Kconfig                          |   7 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/stm32-pwr.c                      | 193 +++++++++++++++++++++
 4 files changed, 244 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.txt
 create mode 100644 drivers/regulator/stm32-pwr.c

-- 
1.9.1
