From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v11 2/4] tee: generic TEE subsystem
Date: Tue, 30 Aug 2016 14:29:45 -0500
Message-ID: <e08f821b-bf7c-be65-59a5-281aa3343cf4@ti.com>
References: <1471870856-18684-1-git-send-email-jens.wiklander@linaro.org>
 <1471870856-18684-3-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471870856-18684-3-git-send-email-jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/22/2016 08:00 AM, Jens Wiklander wrote:
> +/*
> + * Unprivileged devices in the in the lower half range and privileged

                                ^^ in the in the
[snip]

> +
> +	rc = alloc_chrdev_region(&tee_devt, 0, TEE_NUM_DEVICES, "tee");
> +	if (rc < 0) {

if (rc) ?

[snip]

> + * Memory allocated as global shared memory is automatically freed when the
> + * TEE file pointer is closed. The @flags field uses the bits defined by
> + * TEE_SHM_* above. TEE_SHM_MAPPED must currently always be set. If

             ^^^ not really above anymore, out of file now looks like

> + * TEE_SHM_DMA_BUF global shared memory will be allocated and associated
> + * with a dma-buf handle, else driver private memory.
> + *
> + * @returns a pointer to 'struct tee_shm'

Doesn't say anything, is this really needed?

[snip]

> +/**
> + * struct tee_shm_pool_mem_info - holds information needed to create a shared
> + * memory pool
> + * @vaddr:	Virtual address of start of pool
> + * @paddr:	Physical address of start of pool
> + * @size:	Size in bytes of the pool
> + */
> +struct tee_shm_pool_mem_info {
> +	unsigned long vaddr;
> +	unsigned long paddr;

phys_addr_t paddr; ?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
