From: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Subject: [PATCH v3 0/8] phy: miphy28lp: Introduce support for MiPHY28lp
Date: Fri, 26 Sep 2014 10:54:09 +0200
Message-ID: <1411721657-9924-1-git-send-email-gabriel.fernandez@linaro.org>
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
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Grant Likely <grant.likely@linaro.org>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, Gabriel Fernandez <gabriel.fernandez@linaro.org>
List-Id: devicetree@vger.kernel.org

Changes in v3:
 - split into separate smaller functions and can be resued 
   for sata / pcie and usb
 - uses macros for registers and values
 - cosmetic correction

from Kishon
 - create a common file for phy
 - cosmetic correction in phy-miphy28lp.txt file
 - change initialization of the registers
from Srinivas
 - rename and simplify a procedure
 - Add Tx impedance and SSC support for SATA and PCI

Hi Kishon,

The goal of this series is to add the support of MiPHY28lp Generic PHY.
I tried to be as close as possible to the MiPHY365x Lee Jones proposal.

Best Regards
Gabriel.

Gabriel Fernandez (8):
  phy: miphy28lp: Add Device Tree bindings for the MiPHY28lp
  phy: miphy28lp: Add MiPHY28lp header file for DT x Driver defines
  phy: miphy28lp: Provide support for the MiPHY28lp Generic PHY
  ARM: DT: STi: STiH407: Add DT node for MiPHY28lp
  phy: miphy28lp: Add SSC support for SATA
  phy: miphy28lp: Add SSC support for PCIE
  phy: miphy28lp: Tune tx impedance across Soc cuts
  ARM: multi_v7_defconfig: Enable MiPHY28lp - ST's Generic (SATA, PCIe &
    USB3) PHY

 .../devicetree/bindings/phy/phy-miphy28lp.txt      |  128 ++
 arch/arm/boot/dts/stih407-b2120.dts                |   11 +
 arch/arm/boot/dts/stih407.dtsi                     |   65 +
 arch/arm/configs/multi_v7_defconfig                |    1 +
 drivers/phy/Kconfig                                |    8 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/phy-miphy28lp.c                        | 1246 ++++++++++++++++++++
 include/dt-bindings/phy/phy-miphy.h                |   12 +
 8 files changed, 1472 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-miphy28lp.txt
 create mode 100644 drivers/phy/phy-miphy28lp.c
 create mode 100644 include/dt-bindings/phy/phy-miphy.h

-- 
1.9.1
