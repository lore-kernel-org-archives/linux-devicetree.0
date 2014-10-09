From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 11/16] tpm/tpm_i2c_stm_st33: Remove useless
 i2c read on interrupt registers
Date: Thu, 9 Oct 2014 12:20:29 -0600
Message-ID: <20141009182029.GB26675@obsidianresearch.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com>
 <1412712189-1234-12-git-send-email-christophe-h.ricard@st.com>
 <20141007220917.GC10616@obsidianresearch.com>
 <5434CD44.9090606@gmail.com>
 <20141008171140.GD4153@obsidianresearch.com>
 <0B9F1C5B86169C4EA9D042C251022E4938EC504B46@SAFEX1MAIL3.st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0B9F1C5B86169C4EA9D042C251022E4938EC504B46-+EwDPpWUVoSRc5Omjj0epdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christophe Henri RICARD <christophe-h.ricard-qxv4g6HH51o@public.gmane.org>
Cc: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "peterhuewe-Mmb7MZpHnFY@public.gmane.org" <peterhuewe-Mmb7MZpHnFY@public.gmane.org>, "ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org" <ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org>, "tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org" <tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Jean-Luc BLANC <jean-luc.blanc-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 09, 2014 at 07:35:07PM +0200, Christophe Henri RICARD wrote:
> Hi Jason,
> 
> > If your chip is sane like other TPMs the IRQ pin will *only* be
> > asserted while there is data pending in the out command FIFO,
> > reading the FIFO *should naturally clear the IRQ *and the acking
> > process may be entirely unnecessary and can be removed.

> I believe this assessment is wrong according to existing
> specifications and current implementation and I will explain you
> why:

It does sound like it is not how the ST33 chip operates.

> Our TPM is managing the TPM TIS registers Interrupt Enable and
> Interrupt Status.

The TIS register mapping was intended for environments where register
access is not expensive, and can be done from an ISR. I2C is not such
an environment, which is why other vendors are not using such a strict
mapping of the TIS registers.

That doesn't really change anything, it just means the driver has to
do more I2C transactions to manage this extra chip state.

> According to which one is triggered, the wait queue to wake up is
> different it could be chip->vendor.read_queue or
> chip->vendor.int_queue.

These different queues are not needed, the driver knows what it is
waiting for when it enables the interrupt handler, and can manipulate
the interrupt mask if necessary for special cases. Multiple queues
make more sense when the ISR can cheaply read the status register,
which is not true for I2C.

> I would point out as well the int_queue initialization in the
> i2c_nuvoton_probe which is never used in the tpm_i2c_nuvoton.c nor
> in any tpm core file.

Chip structure members that are not used in the core code are hold
overs from the ancient core design. Drivers ideally should not use
them, favoring their own structures in their driver private
allocation. Someday that will get cleaned up.

Don't get confused that int_queue and read_queue are in the global
chip, they have no special meaning, modern drivers should not use
them at all.

> However, I am not in favor to change to non-threaded irq unless I
> have a clear and convincing argument to do so.

The need for the udelay should be all the convincing required. The
reason for the udelay clearly shows the driver has a synchronization
problem - and sleeping to solve synchronization problem is rarely
correct.

This is especially true since I've already explained how to design so
everything is synchronous and solve the issue.

Again:

In TPM the interrupt is not delivering an asynchronous notification,
everything is synchronous to the driver state, ISRs happen only to
indicate completion of driver initiated actions.

This is why the synchronous flow I suggested is much safer and better,
the driver just can't get the situation where the IRQ cannot safely
run because the main driver thread has changed the TPM state.

To summarize, the flow for an interrupt wait becomes very
simple, ie to wait for command ready:

 - Do write to clear all interrupts
 - do read on command ready
 - if not ready then write to enable only the command ready occured interrupt
 - enable_irq
 - wait for irq w/ timer
 - do read on command ready
 - if not ready and no timeout, do write to clear all interrupts,
   enable_irq, loop.
 - if not ready and timeout, disable irq, return error

All sleepables follow the same synchronous pattern. This makes the
driver compeltely single threaded so no analysis for thread problems
is need. No locking primitives are needed. The inter-locking problem
with request_locality goes away.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
