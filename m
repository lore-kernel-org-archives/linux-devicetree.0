From: Christophe Henri RICARD <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Subject: RE: [tpmdd-devel] [PATCH 11/16] tpm/tpm_i2c_stm_st33: Remove
 useless i2c read on interrupt registers
Date: Thu, 9 Oct 2014 19:35:07 +0200
Message-ID: <0B9F1C5B86169C4EA9D042C251022E4938EC504B46@SAFEX1MAIL3.st.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-12-git-send-email-christophe-h.ricard@st.com>
 <20141007220917.GC10616@obsidianresearch.com> <5434CD44.9090606@gmail.com>
 <20141008171140.GD4153@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141008171140.GD4153-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "peterhuewe-Mmb7MZpHnFY@public.gmane.org" <peterhuewe-Mmb7MZpHnFY@public.gmane.org>, "ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org" <ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org>, "tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org" <tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Jean-Luc BLANC <jean-luc.blanc-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jason,

> If your chip is sane like other TPMs the IRQ pin will *only* be asserted while there is data pending in the out command FIFO, reading the FIFO *should naturally clear the IRQ *and the acking process may be entirely unnecessary and can be removed.
I believe this assessment is wrong according to existing specifications and current implementation and I will explain you why:

Our TPM is managing the TPM TIS registers Interrupt Enable and Interrupt Status.
The TPM register Interrupt Enable support globalIntEnable (bit 31), commandReadyEnable (bit 7), fifoAvailableEnable (bit 6), Wakeup ready enable (bit 5), loc4SoftRelease(bit 3), stsValidIntEnable(bit 1), dataAvailIntEnable(bit 0).
Except fifoAvailableEnable (bit 6), Wakeup ready enable (bit 5), loc4SoftRelease(bit 3) all of them are specified in the TCG TIS specification.

The TPM register Interrupt Status support commandReadyIntOccured(bit 7), fifoAvailableOccured(bit 6), WakeupReadyOccured(bit 5), loc4SoftRelease(bit 3), localityChangeIntOccured(bit 2), stsValidIntOccured(bit 1), dataAvailIntOccured(bit 0).
Except fifoAvailableOccured(bit 6), WakeupReadyOccured(bit 5), loc4SoftRelease(bit 3) all of them are specified in the TCG TIS specification.

When any enabled interrupt is getting active, the serirq line will get active (high state reversed from lpc implementation) but it will not tell which one. It could be any of the interrupt status register.
Still according to the TCG_PCClientTPMInterfaceSpecification_TIS, the only when to clear a pending interrupt is to write a 1 to the corresponding bit in the TPM_INT_STATUS register.

According to which one is triggered, the wait queue to wake up is different it could be chip->vendor.read_queue or chip->vendor.int_queue.
According to other driver implementation:
- chip->vendor.read_queue is used to signal data availability.
- chip->vendor.int_queue is used to signal any other interrupt sts_valid_int, cmd_read_int, locality_change_int.

As a possible clean up, I can see:
- the locality_change_int in the handler may not be manage in my isr as it is not supposed to happen in the OS.
- the interrupt TPM_INTF_LOCALITY_CHANGE_INT, TPM_INTF_FIFO_AVAILABLE_INT, TPM_INTF_WAKE_UP_READY_INT does not need to be activated.

The udelay before the release_locality has be chosen small in order to reduce the impact in case the driver is used in polling mode.

I would point out as well the int_queue initialization in the i2c_nuvoton_probe which is never used in the tpm_i2c_nuvoton.c nor in any tpm core file.

The only point that could be raised is that there is no TPM 1.2 protocol specification for I2C. During our chip implementation, we tried to fit best to existing documentation. 
Therefore I believe claiming this I2C TPM implementation or this one should be taken as reference is not appropriate as per previous statement.

As a conclusion to this, I believe I can add the clean-up pointed out previously and I will try to respin and rework patch 10, 13 and 7.

However, I am not in favor to change to non-threaded irq unless I have a clear and convincing argument to do so.

I will submit a v2 patchset including as much as possible fix/clean according to your feedback soon.

Thank you for your feedback.

Best Regards
Christophe

-----Original Message-----
From: Jason Gunthorpe [mailto:jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org] 
Sent: mercredi 8 octobre 2014 19:12
To: Christophe RICARD
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org; ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org; tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org; Christophe Henri RICARD; Jean-Luc BLANC
Subject: Re: [tpmdd-devel] [PATCH 11/16] tpm/tpm_i2c_stm_st33: Remove useless i2c read on interrupt registers

On Wed, Oct 08, 2014 at 07:36:04AM +0200, Christophe RICARD wrote:

> I believe this is completely 2 different things. The delay before the 
> release locality is to make sure that the isr will be service before 
> release_locality to guarantee that any pending interrupt are cleared 
> while the locality is active.
> Here i just want to save 2 i2c transaction as only 1 write is enough 
> to get the register change as effective.

I think I follow the interrupt changes a bit better now..

First of all, things are spread out too much, ie patch 10 makes the actual ISR handler change but patch 13 corrects the locking bug introduced in patch 10, and patch 7 switches to the threaded irq required by patch 13 - this should all be in the same patch.

Second, I don't think switching to threaded IRQs and then using I2C transactions in the handler is a great idea. I think you should follow the pattern in the nuvoton driver:

The IRQ handler simply records the interrupt occured, triggers a WQ and disables the IRQ:

static irqreturn_t i2c_nuvoton_int_handler(int dummy, void *dev_id) {
	struct tpm_chip *chip = dev_id;
	struct priv_data *priv = chip->vendor.priv;

	priv->intrs++;
	wake_up(&chip->vendor.read_queue);
	disable_irq_nosync(chip->vendor.irq);
	return IRQ_HANDLED;
}

The ops explicitly enables the IRQ before sleeping waiting on the output FIFO:

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

For your chip you might need to ack the IRQ before writing a new command to the input FIFO.

1) This gets rid of the udelay, the IRQ doesn't do anything so any
   acks can be sequenced properly with the request_locality
2) This gets rid of the locking, the IRQ doesn't attempt to ack, and
   acks can be sequenced before any enable_irq

If your chip is sane like other TPMs the IRQ pin will only be asserted while there is data pending in the out command FIFO, reading the FIFO should naturally clear the IRQ and the acking process may be entirely unnecessary and can be removed. If you have to ack via that weird read/write sequence then it should always be done before submitting a new command to the input fifo.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
