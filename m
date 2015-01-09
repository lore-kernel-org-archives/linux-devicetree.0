From: Maxime COQUELIN <maxime.coquelin@st.com>
Subject: [PATCH 0/3] Add STiH418 SoC and reference board support
Date: Fri,  9 Jan 2015 16:11:43 +0100
Message-ID: <1420816306-11305-1-git-send-email-maxime.coquelin@st.com>
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
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org
List-Id: devicetree@vger.kernel.org

This series adds basic support to the STMicroelectronics STiH407 SoC and its
B2199 reference board. The STiH418 is a quad-core ARM Cortex-A9 CPU aimed at
UHD STB market.

Maxime Coquelin (3):
  ARM: STi: Add STiH418 SoC support
  ARM: dts: Add STiH418 SoC support
  ARM: dts: STiH418: Add B2199 board support

 Documentation/arm/sti/stih418-overview.txt    |  20 ++
 Documentation/devicetree/bindings/arm/sti.txt |   4 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/stih418-b2199.dts           |  78 ++++++
 arch/arm/boot/dts/stih418-clock.dtsi          | 348 ++++++++++++++++++++++++++
 arch/arm/boot/dts/stih418.dtsi                |  99 ++++++++
 arch/arm/mach-sti/board-dt.c                  |   1 +
 include/dt-bindings/clock/stih418-clks.h      |  34 +++
 8 files changed, 586 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/arm/sti/stih418-overview.txt
 create mode 100644 arch/arm/boot/dts/stih418-b2199.dts
 create mode 100644 arch/arm/boot/dts/stih418-clock.dtsi
 create mode 100644 arch/arm/boot/dts/stih418.dtsi
 create mode 100644 include/dt-bindings/clock/stih418-clks.h

-- 
1.9.1
