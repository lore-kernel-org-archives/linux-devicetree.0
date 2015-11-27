From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [RESEND v4 2/6] remoteproc: debugfs: Add ability to boot remote
 processor using debugfs
Date: Fri, 27 Nov 2015 09:00:46 -0800
Message-ID: <CAJAp7Og2MPapOQmCSB9o4qwQHsA8_iyAWPhjHYPw6J=xCK2xew@mail.gmail.com>
References: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
	<1448370862-19120-3-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448370862-19120-3-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ludovic.barre-qxv4g6HH51o@public.gmane.org, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 24, 2015 at 5:14 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> This functionality is especially useful during the testing phase.  When
> used in conjunction with Mailbox's Test Framework we can trivially conduct
> end-to-end testing i.e. boot co-processor, send and receive messages to
> the co-processor, then shut it down again (repeat as required).
>

I want this too!

> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 34 +++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index 9d30809..8113c18 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -88,8 +88,42 @@ static ssize_t rproc_state_read(struct file *filp, char __user *userbuf,
>         return simple_read_from_buffer(userbuf, count, ppos, buf, i);
>  }
>
> +static ssize_t rproc_state_write(struct file *filp, const char __user *userbuf,
> +                                size_t count, loff_t *ppos)
> +{
> +       struct rproc *rproc = filp->private_data;
> +       char buf[10];
> +       int ret;
> +
> +       if (count > sizeof(buf))
> +               return count;
> +
> +       ret = copy_from_user(buf, userbuf, count);
> +       if (ret)
> +               return -EFAULT;
> +
> +       if (buf[count - 1] == '\n')
> +               buf[count - 1] = '\0';

I believe you can get here with count = 0.

> +
> +       if (!strncmp(buf, "start", count)) {
> +               ret = rproc_boot(rproc);
> +               if (ret) {
> +                       dev_err(&rproc->dev, "Boot failed: %d\n", ret);
> +                       return ret;
> +               }
> +       } else if (!strncmp(buf, "stop", count)) {
> +               rproc_shutdown(rproc);
> +       } else {
> +               dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);

Unrecognized

> +               return -EINVAL;
> +       }
> +
> +       return count;
> +}
> +
>  static const struct file_operations rproc_state_ops = {
>         .read = rproc_state_read,
> +       .write = rproc_state_write,
>         .open = simple_open,
>         .llseek = generic_file_llseek,
>  };

Part of these nits

Acked-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
