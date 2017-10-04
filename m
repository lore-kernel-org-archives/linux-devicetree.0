From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 11/22] firmware: arm_scmi: add support for polling
 based SCMI transfers
Date: Wed, 4 Oct 2017 13:13:54 +0200
Message-ID: <CAK8P3a2wRFif2zYKKmdcNm5wgbGdhqwLdA-YV7AX_0LmM+OiQQ@mail.gmail.com>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com> <1506604306-20739-12-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506604306-20739-12-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 28, 2017 at 3:11 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> It would be useful to have options to perform some SCMI transfers
> atomically by polling for the completion flag instead of interrupt
> driven. The SCMI specification has option to disable the interrupt and
> poll for the completion flag in the shared memory.
>
> This patch adds support for polling based SCMI transfers using that
> option. This might be used for uninterrupted/atomic DVFS operations
> from the scheduler context.

multi-millisecond timeouts from inside the scheduler sound like a
really bad idea. Could this maybe get changed to an asynchronous
operation?

> +       if (xfer->hdr.poll_completion) {
> +               timeout = info->desc->max_rx_timeout_ms * 100;
> +               while (!scmi_xfer_poll_done(info, xfer) && timeout--)
> +                       udelay(10);

The timeout calculation is bad as well, since both the
scmi_xfer_poll_done() call and udelay() can take much longer
than the 10 microsecond delay that you use for the calculation.

If you want to do a timeout check like this, it should generally
be done using ktime_get()/ktime_add()/ktime_before().

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
