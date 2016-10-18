From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] clocksource: Add clockevent support to NPS400 driver
Date: Tue, 18 Oct 2016 08:57:22 -0500
Message-ID: <20161018135722.oflcjm5hfy6eugiy@rob-hp-laptop>
References: <1476370350-3853-1-git-send-email-noamca@mellanox.com>
 <1476370350-3853-4-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476370350-3853-4-git-send-email-noamca@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Noam Camus <noamca@mellanox.com>
Cc: mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 13, 2016 at 05:52:30PM +0300, Noam Camus wrote:
> From: Noam Camus <noamca@mellanox.com>
> 
> Till now we used clockevent from generic ARC driver.
> This was enough as long as we worked with simple multicore SoC.
> When we are working with multithread SoC each HW thread can be
> scheduled to receive timer interrupt using timer mask register
> (TSI1).
> 
> This patch will provide a way to control clock events per
> HW thread.
> 
> Driver can be used from device tree by:
> compatible = "ezchip,nps400-timer0" <-- for clocksource
> compatible = "ezchip,nps400-timer1" <-- for clockevent

You're letting Linux details define the binding. Are these blocks 
different (the block itself, not connections to the block like 
interrupts)?

If you need a particular timer instance to be used, then describe 
whatever is the difference in the h/w.  For example, the clockevent 
timer has to be the timer with an interrupt.

Rob
