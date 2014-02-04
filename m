From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: Re: [PATCH v4 1/3] clocksource: timer-keystone: introduce clocksource
 driver for Keystone
Date: Tue, 4 Feb 2014 18:54:52 +0200
Message-ID: <52F11B5C.40407@ti.com>
References: <1391513453-21140-1-git-send-email-ivan.khoronzhuk@ti.com> <1391513453-21140-2-git-send-email-ivan.khoronzhuk@ti.com> <alpine.DEB.2.02.1402041715220.24986@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1402041715220.24986@ionos.tec.linutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: santosh.shilimkar@ti.com, rob@landley.net, linux@arm.linux.org.uk, galak@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com
List-Id: devicetree@vger.kernel.org

It was so in v1. But it was decided to use explicit memory barriers,
because we're always sure the memory barriers are there and that
they're properly documented. Also in this case I don't need to add
keystone readl/writel relaxed function variants and to use mixed calls of
writel/writel_relaxed functions.

See:
http://www.spinics.net/lists/arm-kernel/msg294941.html

On 02/04/2014 06:24 PM, Thomas Gleixner wrote:
> On Tue, 4 Feb 2014, Ivan Khoronzhuk wrote:
>> +	keystone_timer_writel(off, TCR);
>> +	/* here we have to be sure the timer has been disabled */
>> +	wmb();
> We have explicit writew_relaxed and writew. Why open coding the
> barriers?
>
> Thanks,
>
> 	tglx

-- 
Regards,
Ivan Khoronzhuk

