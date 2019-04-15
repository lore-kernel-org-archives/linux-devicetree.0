From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH v2 0/2] Add support for STM32MP1 power regulators
Date: Mon, 15 Apr 2019 09:17:37 +0000
Message-ID: <1555319855-2982-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

The POWER block of the STM32MP1 integrates 3 fixed regulators with a ready
status bit for each one. The goal of this patchset is to add support those
regulators.

Pascal Paillet (2):
changes in v2:
* add COMPILE_TEST switch
* do not test ready in is_enabled() callback
* remove of_regulator_match
* change author

  dt-bindings: regulator: Add stm32mp1 pwr regulators
  regulator: Add support for stm32 power regulators

 .../bindings/regulator/st,stm32mp1-pwr-reg.txt     |  43 +++++
 drivers/regulator/Kconfig                          |   7 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/stm32-pwr.c                      | 190 +++++++++++++++++=
++++
 4 files changed, 241 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/st,stm32mp1=
-pwr-reg.txt
 create mode 100644 drivers/regulator/stm32-pwr.c

--=20
1.9.1
