From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 0/8] STPMIC1 Fixes
Date: Tue, 19 Feb 2019 10:04:31 +0000
Message-ID: <1550570647-9555-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "axel.lin@ingics.com" <axel.lin@ingics.com>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

The goal of this patch-set is to improve the stpmic1 regulator driver:
with Fixes:
- Simplify regulator registration code
- Remove support of regulator pull-down
- Fix buck1 voltage range
- Fix binding documentation
with a new feature:
- Add support for active discharge

Pascal Paillet (8):
  regulator: stpmic1: Use regulator mode definition from bindings
  regulator: stpmic1: Simplify regulators registration
  dt-bindings: regulator: remove interrupt-parent description on stpmic1
  dt-bindings: regulator: remove regulator pull-down support for stpmic1
  regulator: stpmic1: Remove support for regulator pull down
  regulator: stpmic1: Change buck1 voltage range
  dt-bindings: regulator: Add active discharge support for stpmic1
  regulator: stpmic1: Add active discharge support

 .../bindings/regulator/st,stpmic1-regulator.txt    |   6 +-
 drivers/regulator/stpmic1_regulator.c              | 258 +++++++++------------
 2 files changed, 113 insertions(+), 151 deletions(-)

-- 
1.9.1
