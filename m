From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH V4 01/14] sh: Eliminate unused irq_reg_{readl,writel}
 accessors
Date: Fri, 14 Nov 2014 17:38:44 +0100
Message-ID: <20141114163843.GH29662@linux-mips.org>
References: <1415342669-30640-1-git-send-email-cernekee@gmail.com>
 <1415342669-30640-2-git-send-email-cernekee@gmail.com>
 <CAMuHMdW+L8YbE8Z8jrtnm8xWk63sRGaFdM7TPM6MmrDg9XwHuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Received: from localhost.localdomain ([127.0.0.1]:34867 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27013725AbaKNQiuQ1Fns (ORCPT <rfc822;devicetree@vger.kernel.org>
        + 2 others); Fri, 14 Nov 2014 17:38:50 +0100
Content-Disposition: inline
In-Reply-To: <CAMuHMdW+L8YbE8Z8jrtnm8xWk63sRGaFdM7TPM6MmrDg9XwHuQ@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kevin Cernekee <cernekee@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Linux-sh list <linux-sh@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Florian Fainelli <f.fainelli@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Maxime Bizon <mbizon@freebox.fr>, Jonas Gorski <jogo@openwrt.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 10, 2014 at 09:13:49AM +0100, Geert Uytterhoeven wrote:

> On Fri, Nov 7, 2014 at 7:44 AM, Kevin Cernekee <cernekee@gmail.com> wrote:
> > Defining these macros way down in arch/sh/.../irq.c doesn't cause
> > kernel/irq/generic-chip.c to use them.  As far as I can tell this code
> > has no effect.
> >
> > Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> 
> Compared preprocessor and asm output before and after, no difference
> except for line numbers, so
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

I noticed the remainder of of this series is now in Jason Cooper's irqchip
tree.  Is anybody still taking care of SH?  If not I can funnel it
through the MIPS tree.

  Ralf
