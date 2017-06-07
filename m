From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH 6/8] firmware: arm_scmi: add initial support for power protocol
Date: Wed, 7 Jun 2017 22:38:42 +0200
Message-ID: <CAK8P3a3Vw2AvAr4hNd0A6Tih1YNorjiG2jkhcuo=CK1RF+aLFA@mail.gmail.com>
References: <1496851812-19623-1-git-send-email-sudeep.holla@arm.com> <1496851812-19623-7-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496851812-19623-7-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 7, 2017 at 6:10 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:

> +struct scmi_msg_resp_power_attributes {
> +       __le16 num_domains;
> +       __le16 reserved;
> +       __le32 stats_addr_low;
> +       __le32 stats_addr_high;
> +       __le32 stats_size;
> +} __packed;
> +
> +struct scmi_msg_resp_power_domain_attributes {
> +       __le32 flags;
> +#define SUPPORTS_STATE_SET_NOTIFY(x)   ((x) & BIT(31))
> +#define SUPPORTS_STATE_SET_ASYNC(x)    ((x) & BIT(30))
> +#define SUPPORTS_STATE_SET_SYNC(x)     ((x) & BIT(29))
> +           u8 name[SCMI_MAX_STR_SIZE];
> +} __packed;

I think it would be better to leave out the __packed here, which
can lead to rather inefficient code. It's only really a problem when
building with -mstrict-align, but it's better to write code in a way that
doesn't rely on that.

> +static int
> +scmi_power_domain_attributes_get(struct scmi_handle *handle, u32 domain,
> +                                struct power_dom_info *dom_info)
> +{
> +       int ret;
> +       struct scmi_xfer *t;
> +       struct scmi_msg_resp_power_domain_attributes *attr;
> +
> +       ret = scmi_one_xfer_init(handle, POWER_DOMAIN_ATTRIBUTES,
> +                                SCMI_PROTOCOL_POWER, sizeof(domain),
> +                                sizeof(*attr), &t);
> +       if (ret)
> +               return ret;
> +
> +       *(__le32 *)t->tx.buf = cpu_to_le32(domain);
> +       attr = (struct scmi_msg_resp_power_domain_attributes *)t->rx.buf;

It seems you require a similar pattern in each caller of scmi_one_xfer_init(),
but it seems a little clumsy to always require those casts, so maybe there
is a nicer way to do this. How about making scmi_one_xfer_init() act
as an allocation function and having it return the buffer or a PTR_ERR?

It also seems odd to have it named 'init' but actually allocate the scmi_xfer
structure rather than filling a local variable that gets passed by reference.

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
