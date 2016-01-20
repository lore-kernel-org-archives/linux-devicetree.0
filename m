From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Subject: ARM: dts: imx6ul: add more functionality to i.MX6UL
Date: Wed, 20 Jan 2016 11:08:53 +0100
Message-ID: <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <b20788@freescale.com>, Bai Ping <b51503@freescale.com>, Frank Li <Frank.Li@freescale.com>, Fugang Duan <B38611@freescale.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patchset adds more functionality to the i.MX6UL machines.

The first three patches are cleanup patches with no functional changes
intended.
The other patches make various subsystems functional.

ARM: dts: imx6ul: whitespace cleanup; no functional
ARM: dts: imx6ul: move tsc node to appropriate place
ARM: dts: imx6ul: move dt-bindings/input/input.h
ARM: dts: imx6ul: specify proper clocks for GPT node
ARM: dts: imx6ul: specify proper clocks for the PWM
ARM: dts: imx6ul: disable PWMs by default
ARM: dts: imx6ul: add pwm[1-4] nodes
ARM: dts: imx6ul: add sdma support
ARM: dts: imx6ul: add flexcan support
ARM: dts: imx6ul: add sai support
ARM: dts: imx6ul: add lcdif support
ARM: dts: imx6ul: add gpmi support
clk: imx: whitespace cleanup; no functional change
clk: imx: add kpp clock for i.MX6UL
ARM: dts: imx6ul: add kpp support
ARM: dts: imx6ul: add support for Ka-Ro electronics TX6UL module

Changes vs. v1:
- added patch to implement KPP clock for i.MX6UL to prevent conflicts
  when this patch would go via a different tree.
- added board support for Ka-Ro electronics TX6UL module for the same
  reason
- added imx6ul specific compatibles as requested by Lucas Stach
