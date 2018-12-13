From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 10/12] ARM64: dts: marvell: armada-3720-espressobin:
 declare PCIe reset GPIO
Date: Thu, 13 Dec 2018 15:36:19 +0100
Message-ID: <20181213153619.499aab66@windsurf>
References: <20181212102142.16053-1-miquel.raynal@bootlin.com>
        <20181212102142.16053-11-miquel.raynal@bootlin.com>
        <20181213153306.4fc3b511@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181213153306.4fc3b511@xps13>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, 13 Dec 2018 15:33:06 +0100, Miquel Raynal wrote:

> I will re-send a series without this patch. I think it does not hurt to
> keep the previous patch adding the pinmux setting in the
> Armada-37xx.dtsi file even without using it, so I will drop only this
> patch.

I tend to disagree here (but perhaps you'll have other arguments to
convince me otherwise): the GPIO used for PCIe reset is a completely
board-specific thing. You can chose whatever GPIO you want, and each
board can be different. Therefore, there is no reason to have such a
pinmux configuration at the SoC level (.dtsi), it should be within the
particular board that uses that pinmux configuration.

This is a rule that we have applied to mvebu platforms in general, and
which I believe is fairly common in many DTs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
