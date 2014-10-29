From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 01/11] irqchip: Allow irq_reg_{readl,writel} to use
 __raw_{readl_writel}
Date: Wed, 29 Oct 2014 22:31:06 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1410292226050.5308@nanos>
References: <1414555138-6500-1-git-send-email-cernekee@gmail.com> <5338153.4SY4TFtus9@wuerfel> <CAJiQ=7C7SzT2ngQzP=dQqdQz=+ShJ_Jf0z4kwFgvUKg1G3vrAw@mail.gmail.com> <22478002.kqKBdeLAKz@wuerfel>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <22478002.kqKBdeLAKz@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kevin Cernekee <cernekee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Ralf Baechle <ralf@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Maxime Bizon <mbizon@freebox.fr>, Jonas Gorski <jogo@openwrt.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>
List-Id: devicetree@vger.kernel.org

On Wed, 29 Oct 2014, Arnd Bergmann wrote:
> On Wednesday 29 October 2014 13:09:47 Kevin Cernekee wrote:
> > generic-chip.c already has a fair amount of indirection, with pointers
> > to saved masks, user-specified register offsets, and such.  Is there a
> > concern that introducing, say, a pair of readl/writel function
> > pointers, would cause an unacceptable performance drop?
> 
> I don't know. Thomas' reply suggests that it isn't. Doing byteswap
> in software at a register access is usually free in terms of CPU
> cycles, but an indirect function call can be noticeable if we do
> that a lot.

I did not say that it is free. I merily said that I prefer to have
this solved at the core level rather than at the driver level. So you
have several options to do so:

1) Indirections

2) Different functions for the different access modes

3) Alternatives

#1 Is the simplest solution, but imposes the overhead of an indirect
   function call for something trivial

#2 The most efficient and flexible way if you have to provide
   different access modes for different drivers. But it comes with the
   price of increasing the text foot print.

#3 Smart and efficient, but requires that on a particular system all
   drivers use the same access mode.

Thanks,

	tglx



  
