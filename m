From: Niklas Cassel <niklas.cassel@axis.com>
Subject: [PATCH v2 0/8] ARTPEC-6 ARM SoC device tree updates
Date: Wed, 21 Feb 2018 09:59:52 +0100
Message-ID: <20180221090000.18091-1-niklas.cassel@axis.com>
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
To: arm@kernel.org, linux-arm-kernel@axis.com, devicetree@vger.kernel.org
Cc: Niklas Cassel <niklass@axis.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

Here comes some ARTPEC-6 ARM SoC device tree updates.

Regards,
Niklas

Niklas Cassel (8):
  ARM: dts: artpec: disable Accelerator Coherency Port
  ARM: dts: artpec: use 1 GiB RAM
  ARM: dts: artpec: remove 0x prefix from clkctrl unit address
  ARM: dts: artpec: migrate ethernet to stmmac binding
  ARM: dts: artpec: add and utilize artpec6 pin controller
  ARM: dts: artpec: add and utilize nbpfaxi DMA controllers
  ARM: dts: artpec: add disabled node for PCIe endpoint mode
  ARM: dts: artpec: add node for hardware crypto accelerator

 arch/arm/boot/dts/artpec6-devboard.dts |   3 +-
 arch/arm/boot/dts/artpec6.dtsi         | 163 +++++++++++++++++++++++++++++++--
 2 files changed, 155 insertions(+), 11 deletions(-)

-- 
2.14.2
