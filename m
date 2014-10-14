From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3 11/15] tpm/tpm_i2c_stm_st33: Replace
 wait_for_serirq_timeout by wait_for_tpm_stat
Date: Tue, 14 Oct 2014 15:15:53 -0600
Message-ID: <20141014211553.GA30570@obsidianresearch.com>
References: <1413231817-5174-1-git-send-email-christophe-h.ricard@st.com>
 <1413231817-5174-12-git-send-email-christophe-h.ricard@st.com>
 <20141014180914.GE27232@obsidianresearch.com>
 <20141014224425.45b5de03@toffy-MacBookPro>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141014224425.45b5de03@toffy-MacBookPro>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 14, 2014 at 10:44:25PM +0200, Christophe RICARD wrote:

> > > +		r =
> > > wait_event_interruptible_timeout(chip->vendor.read_queue,
> > > +					check_locality(chip) >= 0,
> > > +					timeout);
> > 
> > Can it use wait_for_stat?
> It actually cannot use wait_for_stat because wait_for_stat is waiting
> for a mask condition on the status register. Here we are addressing the
> TPM_ACCESS register.

It would be cleaner if wait_for_stat handled all sleep-for-irq
actions.

> > This seqence is racy, the reason the nuvoton driver has the counter is
> > because wake_up_interruptible only wakes sleeping threads, so the
> > driver has to use the counter to close the race between the enable_irq
> > and the actual sleep:
> > 
> > 		unsigned int cur_intrs = priv->intrs;
> > 		enable_irq(chip->vendor.irq);
> > 		rc = wait_event_interruptible_timeout(*queue,
> > 						      cur_intrs !=
> > priv->intrs, timeout);
> If my understanding is correct the counter prevent the case where the
> irq is raised before entering into the wait_event_interruptible_timeout.
> wait_for_tpm_stat will check before going into sleep the status
> register in order to make sure the condition is not already satisfied
> and should fulfill this requirement.

Yes, your analysis is correct - removing the extra I2C polling would
be the goal of using the counter rather than an I2C read.

> As i could get different kind of interruption i think i cannot avoid an
> i2c check here. The other solution would be to activate only the right
> interruption in the INT_ENABLE tis register but still with an i2c
> transaction.

But there is a problem with the wrong interruption no matter what, the
wait_event_ loop does not ever re-enable_irq() - any generated IRQ
must already be exactly the IRQ that is being waited for. Basically,
the driver must remain synchronized with the chip and it must know
what IRQs can be generated at any point.

When I read the driver I assumed this was already happening, and the
auditing was going to be done to make sure it is the case, hence my
comments on the idle state.

The advantage is clearly that many I2C transactions can be eliminated
by relying on the IRQ line to signal progress.

The alternative is to have the wait_event loops clear the pending bits
and re-enable the IRQ every time they go around, but this is more
transactions.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
