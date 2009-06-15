From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Mon, 15 Jun 2009 09:44:49 +0100
Message-ID: <20090615094449.04b029f0@lxorguk.ukuu.org.uk>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
	<1244765062-14144-3-git-send-email-w.sang@pengutronix.de>
	<20090614122136.GD3639@local>
	<20090615001207.1829e7b5@lxorguk.ukuu.org.uk>
	<20090614234546.GJ3639@local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20090614234546.GJ3639@local>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@lists.ozlabs.org
Cc: devicetree-discuss@ozlabs.org, "Hans J. Koch" <hjk@linutronix.de>, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Greg KH <gregkh@suse.de>
List-Id: devicetree@vger.kernel.org

> I did it that way because I saw IRQ 0 in /proc/interrupts on every PC...
> 
> > 
> > It is the job of the platform to map a physical IRQ 0 to some other
> > representation if it exists outside of arch specific code.
> 
> Funny.
> 
> > This was
> > decided some years ago and a large part of the kernel simply doesn't
> > support any notion of a real IRQ 0.
> 
> Can you tell me the reason for that decision or point me to some ml archive?

The natural C way to write "No xxx" is if (!xxx) hence

	if (!dev->irq) {
		polling_start();
		return 0;
	}

The PC "IRQ 0" is the timer - which only appears in the arch code.

Alan
