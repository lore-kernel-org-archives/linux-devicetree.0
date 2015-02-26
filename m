From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] hwrng: iproc-rng200 - Add Broadcom IPROC RNG driver
Date: Thu, 26 Feb 2015 21:15:49 +0100
Message-ID: <4488852.TuVxKbAYde@wuerfel>
References: <1424888184-22180-3-git-send-email-sbranden@broadcom.com> <3062825.7b1oYP4yuL@wuerfel> <54EF75F0.7000901@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54EF75F0.7000901@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Grant Likely <grant.likely@linaro.org>, Ray Jui <rjui@broadcom.com>, Jonathan Richardson <jonathar@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazao <anatol@google.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 26 February 2015 11:37:20 Scott Branden wrote:
> Response inline.
> 
> On 15-02-25 11:17 AM, Arnd Bergmann wrote:
> > On Wednesday 25 February 2015 10:16:24 Scott Branden wrote:
> >> This adds a driver for random number generator present on Broadcom
> >> IPROC devices.
> >>
> >> Reviewed-by: Ray Jui <rjui@broadcom.com>
> >> Signed-off-by: Scott Branden <sbranden@broadcom.com>
> >
> > The driver looks reasonable overall, I have just one question about
> > something that sticks out:
> >
> >> +    while ((num_remaining > 0) && time_before(jiffies, idle_endtime)) {
> > ...
> >> +
> >> +            /* Are there any random numbers available? */
> >> +            if ((ioread32(rng_base + RNG_FIFO_COUNT_OFFSET) &
> >> +                            RNG_FIFO_COUNT_RNG_FIFO_COUNT_MASK) > 0) {
> > ...
> >> +            } else {
> >> +                    if (!wait)
> >> +                            /* Cannot wait, return immediately */
> >> +                            return max - num_remaining;
> >> +
> >> +                    /* Can wait, give others chance to run */
> >> +                    cpu_relax();
> >> +            }
> >> +    }
> >> +
> >
> > It looks like you do a busy-loop around cpu_relax here if asked to wait.
> > Is this intentional? I would normally expect either cond_resched() or
> > some msleep() instead.
> 
> This code was following examples of other open source drivers - bcm2835 
> and exynos both use cpu_relax.  I'll have to look into this more to 
> understand.
> 

The majority of the driver apparently use udelay(10) to wait, which is
not much better but at least consistent. The cpu_relax() call probably
gives better throughput.

I don't understand why none of the drivers actually attempts to
msleep(), but that may be because the delay is much too long.

Can you find out what the expected latency is for new data to
become available on your hardware?

	Arnd
