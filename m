From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 0/3] Fixes for dt-bindings verification
Date: Mon, 7 Oct 2019 12:25:49 +0200
Message-ID: <20191007102552.19808-1-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, Alexandru Ardelean <alexaundru.ardelean@analog.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-media@vger.kernel.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Using "make dt_binding_check" on top v5.4-rc1 some errors are 
reported in several schemas. Those 3 patches allow to execute
"make dt_binding_check" without issues. Most probably those patches
have alread been sent.

regards
Alexandre


Alexandre Torgue (3):
  dt-bindings: media: Fix id path for sun4i-a10-csi
  dt-bindings: net: adi: Fix yaml verification issue
  dt-bindings: regulator: Fix yaml verification for fixed-regulator
    schema

 .../bindings/media/allwinner,sun4i-a10-csi.yaml        |  2 +-
 Documentation/devicetree/bindings/net/adi,adin.yaml    |  6 ++++++
 .../devicetree/bindings/regulator/fixed-regulator.yaml | 10 +++++++---
 3 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.17.1
