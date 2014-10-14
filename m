From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH v3 11/15] tpm/tpm_i2c_stm_st33: Replace
 wait_for_serirq_timeout by wait_for_tpm_stat
Date: Tue, 14 Oct 2014 12:09:14 -0600
Message-ID: <20141014180914.GE27232@obsidianresearch.com>
References: <1413231817-5174-1-git-send-email-christophe-h.ricard@st.com>
 <1413231817-5174-12-git-send-email-christophe-h.ricard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1413231817-5174-12-git-send-email-christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Ricard <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 13, 2014 at 10:23:33PM +0200, Christophe Ricard wrote:
> The tpm layer already provides a function to wait for a TIS event
> wait_for_tpm_stat. Exactly like wait_for_serirq_timeout, it can work in
> polling or interrupt mode.
> Instead of using a completion struct, we rely on the waitqueue read_queue
> and int_queue from chip->vendor field.


>  static int request_locality(struct tpm_chip *chip)
>  {
[..]

>  	if (chip->vendor.irq) {
> -		r = wait_for_serirq_timeout(chip, (check_locality
> -						       (chip) >= 0),
> -						      chip->vendor.timeout_a);
> +again:
> +		timeout = stop - jiffies;
> +		if ((long) timeout <= 0)
> +			return -1;

I don't see an enable_irq before this sleep:

> +		r = wait_event_interruptible_timeout(chip->vendor.read_queue,
> +					check_locality(chip) >= 0,
> +					timeout);

Can it use wait_for_stat?

>  static int wait_for_stat(struct tpm_chip *chip, u8 mask, unsigned long timeout,
> -			 wait_queue_head_t *queue)
> +			 wait_queue_head_t *queue, bool check_cancel)
>  {

So, I didn't audit the driver 100%, but this new version has the flow

- enable_irq
- wait for irq
- clear irq

Which is conceptually fine (and efficient), but it requires the rest
of the driver to guarentee that the interrupt is consistent after
every interation with the TPM. Which for this driver I think means one
of two states:
 - No interrupt asserted
 - Interrupt asserted, and the TPM is ready to accept a command
Other states will cause longer command execution times, but not
malfunction.

For instance, it looks to me like request_locality might not maintain
that invariant.

Clearing old pending bits before starting an interaction is certainly
safer, but costs that extra I2C sequence.

> +	tpm_dev = (struct tpm_stm_dev *)TPM_VPRIV(chip);
> +
> +	if (chip->vendor.irq)
> +		enable_irq(chip->vendor.irq);
> +
> +	r = wait_for_tpm_stat(chip, mask, timeout, queue, check_cancel);

This seqence is racy, the reason the nuvoton driver has the counter is
because wake_up_interruptible only wakes sleeping threads, so the
driver has to use the counter to close the race between the enable_irq
and the actual sleep:

		unsigned int cur_intrs = priv->intrs;
		enable_irq(chip->vendor.irq);
		rc = wait_event_interruptible_timeout(*queue,
						      cur_intrs != priv->intrs,
						      timeout);

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
