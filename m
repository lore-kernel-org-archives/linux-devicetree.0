From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
Subject: [PATCH] ARM: imx6: Fix PCIe reset gpio polarity on Toradex Apalis
Date: Fri,  1 Apr 2016 14:41:46 +0200
Message-ID: <1459514508-8557-1-git-send-email-ynezz@true.cz>
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
To: devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <festevam@gmail.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pci@vger.kernel.org, Tim Harvey <tharvey@gateworks.com>, Richard Zhu <Richard.Zhu@freescale.com>, stefan@agner.ch, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Bjorn Helgaas <bhelgaas@google.com>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

In commit 5c5fb40de8f14 "PCI: imx6: Add support for active-low reset GPIO"
I've made GPIO reset polarity aware, which made the PCIe working on Apalis SoM
(reset active-high), but it has broken PCIe on several other i.MX6 boards
(reset active-low) due to wrong logic level. It has made the default reset
logic active-high, but it was active-low since beginning due to the bug in the
reset code:

	gpio_set_value_cansleep(imx6_pcie->reset_gpio, 0);
	msleep(100);
	gpio_set_value_cansleep(imx6_pcie->reset_gpio, 1);

This breakage couldn't be fixed correctly by fixing the reset code snippet
mentioned above and fixing the broken DTBs, as we can't touch the DTBs, so the
5c5fb40de8f14 commit is going to be reverted, making PCIe reset broken on
Apalis modules again.

As suggested by Fabio, to fix this situation in backward compatible manner, we
should introduce new boolean DT property reset-gpio-active-high, which would
set PCIe reset GPIO polarity as needed. This patch series tries to do so.
