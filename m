From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 1/3] clocksource: timer-keystone: introduce clocksource
 driver for Keystone
Date: Tue, 4 Feb 2014 21:17:28 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1402042113270.24986@ionos.tec.linutronix.de>
References: <1391513453-21140-1-git-send-email-ivan.khoronzhuk@ti.com> <1391513453-21140-2-git-send-email-ivan.khoronzhuk@ti.com> <alpine.DEB.2.02.1402041715220.24986@ionos.tec.linutronix.de> <52F11B5C.40407@ti.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <52F11B5C.40407@ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: santosh.shilimkar@ti.com, rob@landley.net, linux@arm.linux.org.uk, galak@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, grygorii.strashko@ti.com
List-Id: devicetree@vger.kernel.org

On Tue, 4 Feb 2014, Ivan Khoronzhuk wrote:

Please do not top post.

> It was so in v1. But it was decided to use explicit memory barriers,
> because we're always sure the memory barriers are there and that
> they're properly documented. Also in this case I don't need to add
> keystone readl/writel relaxed function variants and to use mixed calls of
> writel/writel_relaxed functions.
> 
> See:
> http://www.spinics.net/lists/arm-kernel/msg294941.html

Fair enough, but we want a proper explanation for explicit barriers in
the code and not in some random discussion of patch version X on some
random mailing list.

Aside of that it should be iowmb(), but I might miss something ...

Thanks,

	tglx

