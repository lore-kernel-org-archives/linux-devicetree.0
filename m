From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 2/3] ARM: dts: imx6: extend PCIe interrupt list for MSI
Date: Thu, 27 Feb 2014 17:44:37 +0100
Message-ID: <6495086.OFxrshKaiu@wuerfel>
References: <1393519305-15128-1-git-send-email-l.stach@pengutronix.de> <1393519305-15128-2-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <1393519305-15128-2-git-send-email-l.stach@pengutronix.de>
Sender: linux-pci-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Richard Zhu <r65037@freescale.com>, Bjorn Helgaas <bhelgaas@google.com>, Shawn Guo <shawn.guo@linaro.org>, Mark Rutland <mark.rutland@arm.com>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Thursday 27 February 2014 17:41:44 Lucas Stach wrote:
>                         num-lanes = <1>;
> -                       interrupts = <0 123 0x04>;
> +                       interrupt-names = "inta", "intb", "intc", "intd/msi";
> +                       interrupts = <0 123 0x04>, <0 122 0x04>, <0 121 0x04>, <0 120 0x04>;
>                         clocks = <&clks 189>, <&clks 187>, <&clks 206>, <&clks 144>;
> 

The standard PCI interrupts should not be listed here, you need to
put them into the "interrupt-map" property so the of_irq_parse_and_map_pci()
function can translate them.

	Arnd
