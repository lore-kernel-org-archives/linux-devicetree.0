From: Al Viro <viro-3bDd1+5oDREiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
Subject: Re: [PATCH v8 2/4] tee: generic TEE subsystem
Date: Fri, 12 Feb 2016 04:51:59 +0000
Message-ID: <20160212045159.GQ17997@ZenIV.linux.org.uk>
References: <1455210877-15748-1-git-send-email-jens.wiklander@linaro.org>
 <1455210877-15748-3-git-send-email-jens.wiklander@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455210877-15748-3-git-send-email-jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jens Wiklander <jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, valentin.manea-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, jean-michel.delorme-qxv4g6HH51o@public.gmane.org, emmanuel.michel-qxv4g6HH51o@public.gmane.org, javier-5MUHepqpBA1BDgjK7y7TUQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 11, 2016 at 06:14:35PM +0100, Jens Wiklander wrote:

> +static int tee_ioctl_shm_alloc(struct tee_context *ctx,
> +		struct tee_ioctl_shm_alloc_data __user *udata)
> +{
> +	long ret;
> +	struct tee_ioctl_shm_alloc_data data;
> +	struct tee_shm *shm;
> +
> +	if (copy_from_user(&data, udata, sizeof(data)))
> +		return -EFAULT;
> +
> +	/* Currently no input flags are supported */
> +	if (data.flags)
> +		return -EINVAL;
> +
> +	data.fd = -1;
> +
> +	shm = tee_shm_alloc(ctx->teedev, data.size,
> +			    TEE_SHM_MAPPED | TEE_SHM_DMA_BUF);
> +	if (IS_ERR(shm))
> +		return PTR_ERR(shm);
> +
> +	data.flags = shm->flags;
> +	data.size = shm->size;
> +	data.fd = tee_shm_get_fd(shm);
> +	if (data.fd < 0) {
> +		ret = data.fd;
> +		goto err;
> +	}
> +
> +	if (copy_to_user(udata, &data, sizeof(data))) {
> +		ret = -EFAULT;
> +		goto err;
> +	}
> +	/*
> +	 * When user space closes the file descriptor the shared memory
> +	 * should be freed
> +	 */
> +	tee_shm_put(shm);
> +	return 0;
> +err:
> +	if (data.fd >= 0)
> +		tee_shm_put_fd(data.fd);

This is completely broken.  Don't ever use that pattern.  Once something
is in descriptor table, that's _it_.  You are already past the point of
no return and there is no way to clean up.

In ABIs like that (and struct containing descriptor *is* a bad ABI design)
solution is
	* allocate a descriptor
	* do everything that might fail, including copy_to_user()/put_user(),
etc.
	* if failed, release unused descriptor and do fput(), if you already
have a struct file reference that needs to be released.
	* FINALLY, when nothing no failures are possible, fd_install() the
sucker in place.

And yes, dma_buf_fd() encourages that kind of braindamage.  It's tolerable
only in one case - when we are about to return descriptor number directly
as return value of syscall and really can't fail anymore.  Not the case
here.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
