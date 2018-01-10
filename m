From: <patrice.chotard@st.com>
Subject: [PATCH 0/7] ARM: dts: STi: Fix DT dtc warnings
Date: Wed, 10 Jan 2018 09:21:00 +0100
Message-ID: <1515572469-19276-1-git-send-email-patrice.chotard@st.com>
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
To: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: patrice.chotard@st.com
List-Id: devicetree@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

This series fixes all dtc warnings related to STi platforms dt files.
It has been triggered by Rob Herring [1]

[1] https://www.spinics.net/lists/devicetree/msg206209.html

For most of implicated node, a simple move outside the soc node
solves the warnings.

Patrice Chotard (7):
  ARM: dts: STi: fix bindings notation
  ARM: dts: STi: Add gpio polarity for "hdmi,hpd-gpio" property
  ARM: dts: STi: Move clocks without reg outside soc
  ARM: dts: STi: Move leds node outside soc node
  ARM: dts: STi: Move usb2_picophyX nodes without reg out of soc
  ARM: dts: STi: Move sound related nodes without reg out of soc
  ARM: dts: STi: Add fake reg property for sti-display-subsystem

 arch/arm/boot/dts/stih407-b2120.dts    |   2 +-
 arch/arm/boot/dts/stih407-clock.dtsi   | 108 ++++++++++++++--------------
 arch/arm/boot/dts/stih407-family.dtsi  |  22 +++---
 arch/arm/boot/dts/stih407-pinctrl.dtsi |  10 +--
 arch/arm/boot/dts/stih407.dtsi         |   7 +-
 arch/arm/boot/dts/stih410-b2120.dts    |  20 +++---
 arch/arm/boot/dts/stih410-b2260.dts    | 101 +++++++++++++-------------
 arch/arm/boot/dts/stih410-clock.dtsi   | 105 +++++++++++++--------------
 arch/arm/boot/dts/stih410-pinctrl.dtsi |   2 +-
 arch/arm/boot/dts/stih410.dtsi         |  46 ++++++------
 arch/arm/boot/dts/stih418-b2199.dts    |  30 ++++----
 arch/arm/boot/dts/stih418-clock.dtsi   | 109 ++++++++++++++--------------
 arch/arm/boot/dts/stih418.dtsi         |  34 ++++-----
 arch/arm/boot/dts/stihxxx-b2120.dtsi   | 128 ++++++++++++++++-----------------
 14 files changed, 362 insertions(+), 362 deletions(-)

-- 
1.9.1
