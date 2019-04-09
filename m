From: Pascal PAILLET-LME <p.paillet@st.com>
Subject: [PATCH v2 0/3] Add support for STPMIC1
Date: Tue, 9 Apr 2019 09:07:02 +0000
Message-ID: <1554800820-5412-1-git-send-email-p.paillet@st.com>
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
To: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "horms+renesas@verge.net.au" <horms+renesas@verge.net.au>, "olof@lixom.net" <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "biju.das@bp.renesas.com" <biju.das@bp.renesas.com>, Yannick FERTRE <yannick.fertre@st.com>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Pascal PAILLET-LME <p.paillet@st.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
List-Id: devicetree@vger.kernel.org

Add support for STPMIC1 on:
- stm32mp157c ed1 board
- stm32mp157a dk1 board
- arm multi_v7_defconfig

Pascal Paillet (3):

changes in v2:
* Describe why we disable the DMAs for PMIC

  ARM: dts: stm32: add stpmic1 support on stm32mp157c ed1 board
  ARM: dts: stm32: add stpmic1 support on stm32mp157a dk1 board
  ARM: multi_v7_defconfig: Enable support for STPMIC1

 arch/arm/boot/dts/stm32mp157a-dk1.dts | 158 ++++++++++++++++++++++++++++++++--
 arch/arm/boot/dts/stm32mp157c-ed1.dts | 156 +++++++++++++++++++++++++++++----
 arch/arm/configs/multi_v7_defconfig   |   4 +
 3 files changed, 294 insertions(+), 24 deletions(-)

-- 
1.9.1
