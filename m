From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 11/16] tpm/tpm_i2c_stm_st33: Remove useless
 i2c read on interrupt registers
Date: Wed, 8 Oct 2014 11:11:40 -0600
Message-ID: <20141008171140.GD4153@obsidianresearch.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-12-git-send-email-christophe-h.ricard@st.com>
 <20141007220917.GC10616@obsidianresearch.com>
 <5434CD44.9090606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5434CD44.9090606-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 08, 2014 at 07:36:04AM +0200, Christophe RICARD wrote:

> I believe this is completely 2 different things. The delay before the
> release locality is to make sure that the isr will be service before
> release_locality to guarantee
> that any pending interrupt are cleared while the locality is active.
> Here i just want to save 2 i2c transaction as only 1 write is enough
> to get the register change as effective.

I think I follow the interrupt changes a bit better now..

First of all, things are spread out too much, ie patch 10 makes the
actual ISR handler change but patch 13 corrects the locking bug
introduced in patch 10, and patch 7 switches to the threaded irq
required by patch 13 - this should all be in the same patch.

Second, I don't think switching to threaded IRQs and then using I2C
transactions in the handler is a great idea. I think you should follow
the pattern in the nuvoton driver:

The IRQ handler simply records the interrupt occured, triggers a WQ
and disables the IRQ:

static irqreturn_t i2c_nuvoton_int_handler(int dummy, void *dev_id)
{
	struct tpm_chip *chip = dev_id;
	struct priv_data *priv = chip->vendor.priv;

	priv->intrs++;
	wake_up(&chip->vendor.read_queue);
	disable_irq_nosync(chip->vendor.irq);
	return IRQ_HANDLED;
}

The ops explicitly enables the IRQ before sleeping waiting on the
output FIFO:

	if (chip->vendor.irq && queue) {
		s32 rc;
		struct priv_data *priv = chip->vendor.priv;
		unsigned int cur_intrs = priv->intrs;

		enable_irq(chip->vendor.irq);
		rc = wait_event_interruptible_timeout(*queue,
						      cur_intrs != priv->intrs,
						      timeout);
		if (rc > 0)
			return 0;

For your chip you might need to ack the IRQ before writing a new
command to the input FIFO.

1) This gets rid of the udelay, the IRQ doesn't do anything so any
   acks can be sequenced properly with the request_locality
2) This gets rid of the locking, the IRQ doesn't attempt to ack, and
   acks can be sequenced before any enable_irq

If your chip is sane like other TPMs the IRQ pin will only be asserted
while there is data pending in the out command FIFO, reading the FIFO
should naturally clear the IRQ and the acking process may be entirely
unnecessary and can be removed. If you have to ack via that weird
read/write sequence then it should always be done before submitting a
new command to the input fifo.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
