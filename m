From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 4/4] drivers/mailbox: Add ASpeed mailbox driver
Date: Tue, 7 Feb 2017 16:10:25 +1030
Message-ID: <CACPK8XcsScjrit-7VHh4oL=zPiMeEAB5_R550U0uPsuQ4WF1mg@mail.gmail.com>
References: <20170112002910.3650-1-cyrilbur@gmail.com> <20170112002910.3650-5-cyrilbur@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170112002910.3650-5-cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2017 at 10:59 AM, Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This provides access to the mbox registers on the ast2400 and ast2500
> boards.

s/boards/SoCs/

>
> This driver allows arbitrary reads and writes to the 16 data registers as
> the other end may have configured the mbox hardware to provide an
> interrupt when a specific register gets written to.
>
> Signed-off-by: Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Send this to lkml as well next time you submit.

> ---
>  drivers/mailbox/Kconfig       |   9 ++
>  drivers/mailbox/Makefile      |   2 +
>  drivers/mailbox/aspeed-mbox.c | 334 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 345 insertions(+)
>  create mode 100644 drivers/mailbox/aspeed-mbox.c
>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index ceff415f201c..10a7f3f2765c 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -152,4 +152,13 @@ config BCM_PDC_MBOX
>           Mailbox implementation for the Broadcom PDC ring manager,
>           which provides access to various offload engines on Broadcom
>           SoCs. Say Y here if you want to use the Broadcom PDC.
> +
> +config ASPEED_MBOX

Call this ASPEED_LPC_MAILBOX, as it's a in the LPC IP block.

> +       depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
> +       bool "Aspeed ast2400/2500 Mailbox Controller"

Call this Aspeed LPC Mailbox Controller, as the layout is shared by
SoCs other than the 2500 and 2400.

> +       default "y"
> +       ---help---
> +         Provides a driver for the MBOX registers found on Aspeed SOCs
> +         (AST2400 and AST2500). This driver provides a device for aspeed
> +         mbox registers
>  endif
> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
> index 7dde4f609ae8..db5b4f3f29e0 100644
> --- a/drivers/mailbox/Makefile
> +++ b/drivers/mailbox/Makefile
> @@ -31,3 +31,5 @@ obj-$(CONFIG_HI6220_MBOX)     += hi6220-mailbox.o
>  obj-$(CONFIG_BCM_PDC_MBOX)     += bcm-pdc-mailbox.o
>
>  obj-$(CONFIG_TEGRA_HSP_MBOX)   += tegra-hsp.o
> +
> +obj-$(CONFIG_ASPEED_MBOX)      += aspeed-mbox.o
> diff --git a/drivers/mailbox/aspeed-mbox.c b/drivers/mailbox/aspeed-mbox.c
> new file mode 100644
> index 000000000000..c4ee6ba228ea
> --- /dev/null
> +++ b/drivers/mailbox/aspeed-mbox.c

> +
> +static ssize_t aspeed_mbox_read(struct file *file, char __user *buf,
> +                               size_t count, loff_t *ppos)
> +{
> +       struct aspeed_mbox *mbox = file_mbox(file);
> +       char __user *p = buf;
> +       ssize_t ret;
> +       int i;
> +
> +       if (!access_ok(VERIFY_WRITE, buf, count))
> +               return -EFAULT;

As discussed in the LPC driver review:

 "And don't call access_ok(), it's racy and no driver should ever do that."

Make sure all of the things you fixed in that driver are fixed in this one.

> +
> +       if (count + *ppos > ASPEED_MBOX_NUM_REGS)
> +               return -EINVAL;
> +
> +       if (file->f_flags & O_NONBLOCK) {
> +               if (!(aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> +                               ASPEED_MBOX_CTRL_RECV))
> +                       return -EAGAIN;
> +       } else if (wait_event_interruptible(mbox->queue,
> +                               aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> +                               ASPEED_MBOX_CTRL_RECV)) {
> +               return -ERESTARTSYS;
> +       }
> +
> +       mutex_lock(&mbox->mutex);
> +
> +       for (i = *ppos; count > 0 && i < ASPEED_MBOX_NUM_REGS; i++) {
> +               uint8_t reg = aspeed_mbox_inb(mbox, ASPEED_MBOX_DATA_0 + (i * 4));
> +
> +               ret = __put_user(reg, p);
> +               if (ret)
> +                       goto out_unlock;
> +
> +               p++;
> +               count--;
> +       }
> +
> +       /* ASPEED_MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step */

W1C? Write to clear?

> +       aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV, ASPEED_MBOX_BMC_CTRL);
> +       ret = p - buf;
> +
> +out_unlock:
> +       mutex_unlock(&mbox->mutex);
> +       return ret;
> +}
> +

> +module_platform_driver(aspeed_mbox_driver);
> +
> +MODULE_DEVICE_TABLE(of, aspeed_mbox_match);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
> +MODULE_DESCRIPTION("ASpeed mailbox device driver");

ASPEED or Aspeed.

> --
> 2.11.0
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
