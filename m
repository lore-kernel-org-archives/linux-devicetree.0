From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH 0/3] Add support for STPMIC1
Date: Wed, 3 Apr 2019 13:40:54 +0000
Message-ID: <1554298852-9955-1-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "biju.das@bp.renesas.com" <biju.das@bp.renesas.com>, Yannick FERTRE <yannick.fertre@st.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.i>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

Add support for STPMIC1 on:
- stm32mp157c ed1 board
- stm32mp157a dk1 board
- arm multi_v7_defconfig

Pascal Paillet (3):
  ARM: dts: stm32: add stpmic1 support on stm32mp157c ed1 board
  ARM: dts: stm32: add stpmic1 support on stm32mp157a dk1 board
  ARM: multi_v7_defconfig: Enable support for STPMIC1

 arch/arm/boot/dts/stm32mp157a-dk1.dts | 157 ++++++++++++++++++++++++++++++++--
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 155 +++++++++++++++++++++++++++++----
 arch/arm/configs/multi_v7_defconfig   |   4 +
 3 files changed, 292 insertions(+), 24 deletions(-)

-- 
1.9.1
