From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 0/5] ARM: dts: lpc32xx: minor fixes and clean-ups
Date: Fri, 19 Apr 2019 23:54:42 +0300
Message-ID: <20190419205447.6357-1-vz@mleia.com>
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
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>
List-Id: devicetree@vger.kernel.org

The changeset continues a series of clean-ups in NXP LPC32xx platform code:
* disabled I2S and MAC controllers by default,
* set default #address-cells = <1> / #size-cells = <0> for SPI slaves,
* fix notation of hexadecimal values,
* switched lpc32xx.dtsi to SPDX license identifier.

Vladimir Zapolskiy (5):
  ARM: dts: lpc32xx: change hexadecimal values to lower case
  ARM: dts: lpc32xx: disable I2S controllers by default
  ARM: dts: lpc32xx: disable MAC controller by default
  ARM: dts: lpc32xx: add address and size cell values to SPI controller nodes
  ARM: dts: lpc32xx: use SPDX license identifier

 arch/arm/boot/dts/lpc3250-ea3250.dts  |  1 +
 arch/arm/boot/dts/lpc3250-phy3250.dts |  3 +--
 arch/arm/boot/dts/lpc32xx.dtsi        | 38 ++++++++++++++++-----------
 3 files changed, 24 insertions(+), 18 deletions(-)

-- 
2.20.1
