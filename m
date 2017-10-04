From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 10/22] firmware: arm_scmi: probe and initialise all the
 supported protocols
Date: Wed, 4 Oct 2017 13:06:20 +0200
Message-ID: <CAK8P3a15DxNYzaYmAbxEqAm2FCJS9KQFk8vBDqmSn9QUiw64=A@mail.gmail.com>
References: <1506604306-20739-1-git-send-email-sudeep.holla@arm.com> <1506604306-20739-11-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506604306-20739-11-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: ALKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Roy Franz <roy.franz-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Harb Abdulhamid <harba-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>, Ryan Harkin <Ryan.Harkin-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 28, 2017 at 3:11 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> +static const struct scmi_protocol_match scmi_protocols[] = {
> +       {
> +               .protocol_id = SCMI_PROTOCOL_PERF,
> +               .fn = scmi_perf_protocol_init,
> +               .name = "scmi-cpufreq",
> +       }, {
> +               .protocol_id = SCMI_PROTOCOL_CLOCK,
> +               .fn = scmi_clock_protocol_init,
> +               .name = "scmi-clocks",
> +       }, {
> +               .protocol_id = SCMI_PROTOCOL_POWER,
> +               .fn = scmi_power_protocol_init,
> +               .name = "scmi-power-domain",
> +       }, {
> +               .protocol_id = SCMI_PROTOCOL_SENSOR,
> +               .fn = scmi_sensors_protocol_init,
> +               .name = "scmi-hwmon",
> +       },
> +       {}
> +};

This looks backwards from what we do elsewhere in the kernel,
and could be considered a layering violation: it requires a generic
part of of the driver to know about all the more specific ones,
and it means that we have to modify the global table here each
time we add another protocol.

Can you rewrite this to allow dynamic registration of the protocols?

       Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
