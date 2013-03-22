From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 03/11] ARM: timer-sp: convert to use CLKSRC_OF init
Date: Fri, 22 Mar 2013 11:49:43 +0000
Message-ID: <20130322114943.GC4977@n2100.arm.linux.org.uk>
References: <1363820051-24428-1-git-send-email-robherring2@gmail.com> <1363820051-24428-4-git-send-email-robherring2@gmail.com> <20130321193549.GS4977@n2100.arm.linux.org.uk> <514BC265.7080204@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <514BC265.7080204@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, linus.walleij@linaro.org, haojian.zhuang@linaro.org, pawel.moll@arm.com, john.stultz@linaro.org, tglx@linutronix.de, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 21, 2013 at 09:31:01PM -0500, Rob Herring wrote:
> Perhaps re-writing it like this would be more clear:
> 
> if (irq_num == 2){
> 	__sp804_clockevents_init(base + TIMER_2_BASE, irq, clk1, name);
> 	__sp804_clocksource_and_sched_clock_init(base, name, clk0, 1);
> } else {
> 	__sp804_clockevents_init(base, irq, clk0, name);
> 	__sp804_clocksource_and_sched_clock_init(base + TIMER_2_BASE,
> 						name, clk1, 1);
> }

Yes, that is definitely much clearer than the original patch.
