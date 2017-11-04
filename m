From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 03/20] firmware: arm_scmi: add basic driver
 infrastructure for SCMI
Date: Sat, 4 Nov 2017 17:21:11 +0530
Message-ID: <CABb+yY0KR7rzUSqrG7vPJDZONK3rXtk03WX2eTGAdmkpvTUEbw@mail.gmail.com>
References: <1509720477-18936-1-git-send-email-sudeep.holla@arm.com> <1509720477-18936-4-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509720477-18936-4-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 3, 2017 at 8:17 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:

.....

> +int scmi_do_xfer(const struct scmi_handle *handle, struct scmi_xfer *xfer)
> +{
> +       int ret;
> +       int timeout;
> +       struct scmi_info *info = handle_to_scmi_info(handle);
> +       struct device *dev = info->dev;
> +
> +       ret = mbox_send_message(info->tx_chan, xfer);
>                                                                           ^^^^^^^^
The call still remains unchanged and broken.
https://lkml.org/lkml/2017/7/24/502
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
