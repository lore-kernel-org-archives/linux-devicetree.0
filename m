From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 10/15] irqchip: bcm7120-l2: Make sure all register accesses use base+offset
Date: Thu, 30 Oct 2014 10:12:30 +0100
Message-ID: <2226258.WJYuvIUVPE@wuerfel>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <1414635488-14137-11-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1414635488-14137-11-git-send-email-cernekee@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Kevin Cernekee <cernekee@gmail.com>
Cc: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Wednesday 29 October 2014 19:18:03 Kevin Cernekee wrote:
> A couple of accesses to IRQEN (base+0x00) just used "base" directly, so
> they would break if IRQEN ever became nonzero.  Make sure that all
> reads/writes specify the register offset constant.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> 

Now you no longer convert them this driver to use irq_reg_{readl,writel}, which
breaks support for big-endian ARM.

	Arnd
