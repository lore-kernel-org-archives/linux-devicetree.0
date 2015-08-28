From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 4/4] remoteproc: debugfs: Add ability to boot remote
 processor using debugfs
Date: Fri, 28 Aug 2015 10:17:28 -0700
Message-ID: <55E097A8.4080305@gmail.com>
References: <1440757911-9120-1-git-send-email-lee.jones@linaro.org> <1440757911-9120-5-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440757911-9120-5-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 28/08/15 03:31, Lee Jones wrote:
> This functionality is especially useful during the testing phase.  When
> used in conjunction with Mailbox's Test Framework we can trivially conduct
> end-to-end testing i.e. boot co-processor, send and receive messages to
> the co-processor, then shut it down again (repeat as required).

This does not strike me as a particularly well defined nor suitable
interface for controlling a remote processor's state. I know you are
just extending the existing debugfs interface here, but someone ought to
remove that piece of code and make it a proper character device or
netlink or whatever that allows someone to get proper signaling of
what's going on with the remote processor state by polling or listening
to a socket.

What's the intended use case behind debugfs for this after all? Is your
application expected to keep reading the state file in a loop until it
is happy and reads "running", how is that not racy by nature?

> 
> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index 9d30809..464470d 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -88,8 +88,37 @@ static ssize_t rproc_state_read(struct file *filp, char __user *userbuf,
>  	return simple_read_from_buffer(userbuf, count, ppos, buf, i);
>  }
>  
> +static ssize_t rproc_state_write(struct file *filp, const char __user *userbuf,
> +				 size_t count, loff_t *ppos)
> +{
> +	struct rproc *rproc = filp->private_data;
> +	char buf[2];
> +	int ret;
> +
> +	ret = copy_from_user(buf, userbuf, 1);
> +	if (ret)
> +		return -EFAULT;
> +
> +	switch (buf[0]) {
> +	case '0':
> +		rproc_shutdown(rproc);
> +		break;
> +	case '1':
> +		ret = rproc_boot(rproc);
> +		if (ret)
> +			dev_warn(&rproc->dev, "Boot failed: %d\n", ret);
> +		break;
> +	default:
> +		dev_err(&rproc->dev, "Unrecognised option: %x\n", buf[1]);
> +		return -EINVAL;
> +	}
> +
> +	return count;
> +}
> +
>  static const struct file_operations rproc_state_ops = {
>  	.read = rproc_state_read,
> +	.write = rproc_state_write,
>  	.open = simple_open,
>  	.llseek	= generic_file_llseek,
>  };
> 


-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
