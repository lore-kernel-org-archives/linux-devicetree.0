From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 10/11] irqchip: bcm7120-l2: Extend driver to support 64+ bit controllers
Date: Thu, 30 Oct 2014 10:10:03 +0100
Message-ID: <1819614.RKinL4RR5c@wuerfel>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <7518897.LmfE2WsusV@wuerfel> <CAJiQ=7D+QhFjg7mR49KE2Lu1SC72djBLhbv4sC37tSTga+BVCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJiQ=7D+QhFjg7mR49KE2Lu1SC72djBLhbv4sC37tSTga+BVCQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Maxime Bizon <mbizon@freebox.fr>, Jonas Gorski <jogo@openwrt.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 29 October 2014 16:22:31 Kevin Cernekee wrote:
> 
> This uses one domain per bcm7120-l2 DT node.  If the DT node defines
> multiple enable/status pairs (i.e. >=64 IRQs) then the driver will
> create a single IRQ domain with 2+ generic chips.
> 
> Multiple generic chips are required because the generic-chip code can
> only handle one enable/status register pair per instance.
> 

Makes sense. Just make sure you have that explanation in the patch
description.

	Arnd
