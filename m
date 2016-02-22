From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] irqchip: irq-mvebu-odmi: new driver
Date: Mon, 22 Feb 2016 09:10:55 +0100
Message-ID: <20160222091055.524c60a9@free-electrons.com>
References: <1455522162-16425-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<20160222025353.GD15973@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160222025353.GD15973@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello,

FWIW, you're replying to the v1 of this patch, while v2 and v3 have
already been posted, and v3 has already been merged by the irqchip
maintainers:

  http://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?id=c27f29bbbf02168c9b1e8ba0fe7a8cb917e5a50f

On Sun, 21 Feb 2016 20:53:53 -0600, Rob Herring wrote:

> > +- compatible	       : The value here should contain "marvell,odmi-controller".
> 
> SoC specific compatible too please.

I can add that in a follow-up patch.

> > +- marvell,spi-base     : List of GIC base SPI interrupts, one for each
> > +                         ODMI frame.
> 
> Why not "interrupts" property?

This has already been discussed with Arnd in a more recent iteration of
the patch:

  http://lists.infradead.org/pipermail/linux-arm-kernel/2016-February/409411.html
  http://lists.infradead.org/pipermail/linux-arm-kernel/2016-February/409415.html
  http://lists.infradead.org/pipermail/linux-arm-kernel/2016-February/409430.html

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
