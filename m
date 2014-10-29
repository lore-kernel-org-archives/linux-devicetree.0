From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 01/11] irqchip: Allow irq_reg_{readl,writel} to use
 __raw_{readl_writel}
Date: Wed, 29 Oct 2014 22:50:27 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1410292250020.5308@nanos>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <22478002.kqKBdeLAKz@wuerfel> <alpine.DEB.2.11.1410292226050.5308@nanos> <3403771.J3X9ZBogqZ@wuerfel>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3403771.J3X9ZBogqZ@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Maxime Bizon <mbizon@freebox.fr>, Jonas Gorski <jogo@openwrt.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On Wed, 29 Oct 2014, Arnd Bergmann wrote:
> Right. The option that I was explaining earlier basically combines #1 and
> #3: For all kernels on which we know the endianess of all generic-irqchip
> users at compile time, we hardcode that, and we use indirections of
> some sort for the cases where we build a kernel that needs both.

Works for me.

Thanks,

	tglx
