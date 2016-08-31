From: Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [PATCH v11 2/4] tee: generic TEE subsystem
Date: Wed, 31 Aug 2016 14:47:45 +0200
Message-ID: <20160831124744.GA25472@ermac>
References: <1471870856-18684-1-git-send-email-jens.wiklander@linaro.org>
 <1471870856-18684-3-git-send-email-jens.wiklander@linaro.org>
 <e08f821b-bf7c-be65-59a5-281aa3343cf4@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e08f821b-bf7c-be65-59a5-281aa3343cf4@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@ZenIV.linux.org.uk>, valentin.manea@huawei.com, jean-michel.delorme@st.com, emmanuel.michel@st.com, javier@javigon.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Mark Rutland <mark.rutland@arm.com>, Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>, Nishanth Menon <nm@ti.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2016 at 02:29:45PM -0500, Andrew F. Davis wrote:
> On 08/22/2016 08:00 AM, Jens Wiklander wrote:
> > +/*
> > + * Unprivileged devices in the in the lower half range and privileged
> 
>                                 ^^ in the in the
> [snip]
> 
> > +
> > +	rc = alloc_chrdev_region(&tee_devt, 0, TEE_NUM_DEVICES, "tee");
> > +	if (rc < 0) {
> 
> if (rc) ?
> 
> [snip]
> 
> > + * Memory allocated as global shared memory is automatically freed when the
> > + * TEE file pointer is closed. The @flags field uses the bits defined by
> > + * TEE_SHM_* above. TEE_SHM_MAPPED must currently always be set. If
> 
>              ^^^ not really above anymore, out of file now looks like
> 
> > + * TEE_SHM_DMA_BUF global shared memory will be allocated and associated
> > + * with a dma-buf handle, else driver private memory.
> > + *
> > + * @returns a pointer to 'struct tee_shm'
> 
> Doesn't say anything, is this really needed?
> 
> [snip]
> 
> > +/**
> > + * struct tee_shm_pool_mem_info - holds information needed to create a shared
> > + * memory pool
> > + * @vaddr:	Virtual address of start of pool
> > + * @paddr:	Physical address of start of pool
> > + * @size:	Size in bytes of the pool
> > + */
> > +struct tee_shm_pool_mem_info {
> > +	unsigned long vaddr;
> > +	unsigned long paddr;
> 
> phys_addr_t paddr; ?

Thanks for taking the time to review this. I'll address all your
comments here in the next version of the patch set.

--
Jens
