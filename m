From: Alexey Klimov <klimov.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 03/20] firmware: arm_scmi: add basic driver
 infrastructure for SCMI
Date: Thu, 4 Jan 2018 19:21:45 +0000
Message-ID: <CALW4P+J3RQFV3AuJ3-QHt8-JR12e8PquKbouDEJvWxWOfXcD1A@mail.gmail.com>
References: <1514904162-11201-1-git-send-email-sudeep.holla@arm.com> <1514904162-11201-4-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514904162-11201-4-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sudeep,

thank you for working on this.

On Tue, Jan 2, 2018 at 2:42 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:

[...]

> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> new file mode 100644
> index 000000000000..58d8f88893e6
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/driver.c

[..]

> + * Return: 0 is successfully released
> + *     if null was passed, it returns -EINVAL;
> + */
> +int scmi_handle_put(const struct scmi_handle *handle)
> +{
> +       struct scmi_info *info;
> +
> +       if (!handle)
> +               return -EINVAL;
> +
> +       info = handle_to_scmi_info(handle);
> +       mutex_lock(&scmi_list_mutex);
> +       if (!WARN_ON(!info->users))
> +               info->users--;
> +       mutex_unlock(&scmi_list_mutex);
> +
> +       return 0;
> +}
> +
> +static const struct scmi_desc scmi_generic_desc = {
> +       .max_rx_timeout_ms = 30,        /* we may increase this if required */

What are your thoughts about making it a module parameter?

IIRC, this may required to be increased when someone uses debugging
version of firmware, for example.
In such case someone might need to recompile the kernel in order to
boot with enabled and initialized scmi.

Also, there can be a chance that another transport will be used that
will require larger than 5 * 30 ms delay (such kind of transport can
be kinda useless, I know, but can help with development).

With module parameter you can still boot passing the larger timeout
parameter to the module from cmdline.

> +       .max_msg = 20,          /* Limited by MBOX_TX_QUEUE_LEN */
> +       .max_msg_size = 128,
> +};

Best regards,
Alexey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
