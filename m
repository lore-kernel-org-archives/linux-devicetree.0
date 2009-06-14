From: "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Mon, 15 Jun 2009 01:01:36 +0200
Message-ID: <20090614230135.GI3639@local>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
	<1244765062-14144-3-git-send-email-w.sang@pengutronix.de>
	<20090614122136.GD3639@local>
	<20090614171406.GA1010@pengutronix.de>
	<20090614183357.GE3639@local>
	<20090614190533.GA7387@pengutronix.de>
	<20090614192359.GG3639@local> <4A355155.4020500@grandegger.com>
	<20090614203444.GH3639@local>
	<20090614220022.GB24323@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20090614220022.GB24323-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, "Hans J. Koch" <hjk-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 15, 2009 at 12:00:22AM +0200, Wolfram Sang wrote:
> > > For x86 it's not defined at all. But as this code is for the PowerPC,
> > 
> > No, it isn't. What makes you say that? The Kconfig entry doesn't depend
> > on PowerPC. I compiled it on x86...
> 
> It depends on OF. You could compile on x86? Have to check that...

Ooops, forget it. It cannot be selected on x86. I was a bit distracted when
I wrote that, sorry.

> 
> > > where using NO_IRQ seems still to be OK.
> > 
> > No. uio_pdrv_genirq can be used on all platforms, and not all platforms have
> > NO_IRQ. NO_IRQ can be used in platform specific code only.
> 
> Well, the wrapper uses irq_of_parse_and_map(). So far, it returns NO_IRQ if an
> IRQ was not specified (or not found). I could check if there was an
> interrupt-property at all, so I can distinguish between 'not specified' and
> 'not found'. Then, UIO_IRQ_NONE would only be used, if there was none
> specified. Otherwise it will always be the result from irq_of_parse_and_map(),
> whatever that is (even NO_IRQ). Is this what you have in mind?

I would find it better if probe() failed if no irq is specified, printing a
message that tells the user to setup his data correctly before loading the
driver. A user _has_ to setup irq, if there is none, he still has to set
irq=UIO_IRQ_NONE. For that matter, 'not specified' and 'not found' is both
the same bad thing.

Thanks,
Hans

> 
> Regards,
> 
>    Wolfram
> 
> -- 
> Pengutronix e.K.                           | Wolfram Sang                |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
