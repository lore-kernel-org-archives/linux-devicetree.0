From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v2 0/3] arm64: allwinner: a64: Add initial support for Pinebook
Date: Tue,  5 Jun 2018 22:16:59 -0700
Message-ID: <20180606051702.6478-1-anarsoul@gmail.com>
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
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
List-Id: devicetree@vger.kernel.org

This series adds dts for Pinebook with few prerequisites - PWM and R_I2C
devices nodes.

v2: - add my signoff
    - add default pinmux option for PWM
    - add alternate pinmux option for R_I2C controller
    - add A64 compatible for R_I2C controller

Andre Przywara (1):
  arm64: dts: allwinner: a64: Add PWM controllers

Icenowy Zheng (2):
  arm64: dts: allwinner: a64: add R_I2C controller
  arm64: dts: allwinner: add support for Pinebook

 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a64-pinebook.dts     | 280 ++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  56 ++++
 3 files changed, 337 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts

-- 
2.17.1
