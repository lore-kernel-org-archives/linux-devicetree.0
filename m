From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH 4/4] drivers/mailbox: Add ASpeed mailbox driver
Date: Tue, 07 Feb 2017 16:44:26 +1100
Message-ID: <1486446266.4850.129.camel@kernel.crashing.org>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
         <20170112002910.3650-5-cyrilbur@gmail.com>
         <CACPK8XcsScjrit-7VHh4oL=zPiMeEAB5_R550U0uPsuQ4WF1mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8XcsScjrit-7VHh4oL=zPiMeEAB5_R550U0uPsuQ4WF1mg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 2017-02-07 at 16:10 +1030, Joel Stanley wrote:

> > +static ssize_t aspeed_mbox_read(struct file *file, char __user *buf,
> > +                               size_t count, loff_t *ppos)
> > +{
> > +       struct aspeed_mbox *mbox = file_mbox(file);
> > +       char __user *p = buf;
> > +       ssize_t ret;
> > +       int i;
> > +
> > +       if (!access_ok(VERIFY_WRITE, buf, count))
> > +               return -EFAULT;
> 
> As discussed in the LPC driver review:
> 
>  "And don't call access_ok(), it's racy and no driver should ever do that."
> 
> Make sure all of the things you fixed in that driver are fixed in this one.

Well... I don't entirely agree with Greg on that one :-) In this specific
case, since he's using __put_user() below, he must use access_ok() first.

The "alternate" option is to bounce everything via a local memory array,
copy_to/from_user (to/from that array) and then do the loop of inb/outb,
but in the grand scheme of things, what is written here is correct *and*
more efficient than the alternate approach. On such a slow SoC, those
cycles do count.

> > +
> > +       if (count + *ppos > ASPEED_MBOX_NUM_REGS)
> > +               return -EINVAL;
> > +
> > +       if (file->f_flags & O_NONBLOCK) {
> > +               if (!(aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> > +                               ASPEED_MBOX_CTRL_RECV))
> > +                       return -EAGAIN;
> > +       } else if (wait_event_interruptible(mbox->queue,
> > +                               aspeed_mbox_inb(mbox, ASPEED_MBOX_BMC_CTRL) &
> > +                               ASPEED_MBOX_CTRL_RECV)) {
> > +               return -ERESTARTSYS;
> > +       }
> > +
> > +       mutex_lock(&mbox->mutex);
> > +
> > +       for (i = *ppos; count > 0 && i < ASPEED_MBOX_NUM_REGS; i++) {
> > +               uint8_t reg = aspeed_mbox_inb(mbox, ASPEED_MBOX_DATA_0 + (i * 4));
> > +
> > +               ret = __put_user(reg, p);
> > +               if (ret)
> > +                       goto out_unlock;
> > +
> > +               p++;
> > +               count--;
> > +       }
> > +
> > +       /* ASPEED_MBOX_CTRL_RECV bit is W1C, this also unmasks in 1 step */
> 
> W1C? Write to clear?
> 
> > +       aspeed_mbox_outb(mbox, ASPEED_MBOX_CTRL_RECV, ASPEED_MBOX_BMC_CTRL);
> > +       ret = p - buf;
> > +
> > +out_unlock:
> > +       mutex_unlock(&mbox->mutex);
> > +       return ret;
> > +}
> > +
> > +module_platform_driver(aspeed_mbox_driver);
> > +
> > +MODULE_DEVICE_TABLE(of, aspeed_mbox_match);
> > +MODULE_LICENSE("GPL");
> > > > +MODULE_AUTHOR("Cyril Bur <cyrilbur-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
> > +MODULE_DESCRIPTION("ASpeed mailbox device driver");
> 
> ASPEED or Aspeed.
> 
> > --
> > 2.11.0
> > 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
