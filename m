From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH V2 15/15] irqchip: bcm7120-l2: Enable big endian register accesses on BE kernels
Date: Thu, 30 Oct 2014 10:03:16 +0100
Message-ID: <2482894.SCbMWLltbW@wuerfel>
References: <1414635488-14137-1-git-send-email-cernekee@gmail.com> <1414635488-14137-16-git-send-email-cernekee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414635488-14137-16-git-send-email-cernekee@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Cernekee <cernekee@gmail.com>
Cc: f.fainelli@gmail.com, tglx@linutronix.de, jason@lakedaemon.net, ralf@linux-mips.org, lethal@linux-sh.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mbizon@freebox.fr, jogo@openwrt.org, linux-mips@linux-mips.org
List-Id: devicetree@vger.kernel.org

On Wednesday 29 October 2014 19:18:08 Kevin Cernekee wrote:
> 
> +       flags = IRQ_GC_INIT_MASK_CACHE;
> +       if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
> +               flags |= IRQ_GC_BE_IO;
> +
> 

As I said before, I think you should take this from a DT property instead
of making it dependent on the CPU endianess. Otherwise things go horribly
wrong e.g. when someone runs a big-endian kernel on one of the ARM
based chips.

	Arnd
