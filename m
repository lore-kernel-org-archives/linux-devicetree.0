From: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] mailbox: Add Broadcom PDC mailbox driver
Date: Tue, 28 Jun 2016 20:51:29 +0530
Message-ID: <CABb+yY1s_m-80yetUd381NpWVaDDMzLp5v=h8kaKHbpH5nGHng@mail.gmail.com>
References: <1464113250-15629-1-git-send-email-rob.rice@broadcom.com>
 <1464113250-15629-3-git-send-email-rob.rice@broadcom.com> <CABb+yY3igUUnvzMBtqjhvCfS82HLUHK_PGZBrQOENOPY6nu56A@mail.gmail.com>
 <CAG4BRp=CbdTWM3NipEZoFmBy=gEzpPiN=1jtK4oEVv+9Bg67Kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAG4BRp=CbdTWM3NipEZoFmBy=gEzpPiN=1jtK4oEVv+9Bg67Kg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Rice <rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Anup Patel <anup.patel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Rice <rrice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 28, 2016 at 7:06 PM, Rob Rice <rob.rice-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:

>>>  drivers/mailbox/Kconfig                 |    9 +
>>>  drivers/mailbox/Makefile                |    2 +
>>>  drivers/mailbox/mailbox-pdc/Makefile    |    8 +
>>>  drivers/mailbox/mailbox-pdc/pdc.c       | 1181 +++++++++++++++++++++++++++++++
>>>  drivers/mailbox/mailbox-pdc/pdc.h       |  303 ++++++++
>>>  drivers/mailbox/mailbox-pdc/pdc_debug.c |  101 +++
>>>  drivers/mailbox/mailbox-pdc/pdc_debug.h |   24 +
>>>
>> We already have mailbox api testing rig - mailbox-test, still if you
>> really need debugfs exposure please merge it in pdc.c especially when
>> pdc_debug.c is only 80lines and it always compiled and currently has
>> to export functions globally. Maybe fold everything in a single like
>> other platforms?
>
> [WRR] I'm using debugfs to display stats, not so much for testing the
> module. So I don't think mailbox-test is a substitute. But if you
> prefer, I'll move the stats code into pdc.c, along with the code from
> pdc.h and move pdc.c from the mailbox-pdc directory up to
> drivers/mailbox.
>
Yes, please merge them.

>>> +/**
>>> + * pdc_hw_init() - Use the given initialization parameters to initialize the
>>> + * state for one of the PDCs.
>>> + * @dev:   device structure for PDC
>>> + * @pdcs:  state of the PDC
>>> + * @parms: parameter values to set
>>> + */
>>> +static
>>> +void pdc_hw_init(struct device *dev, struct pdc_state *pdcs,
>>> +                struct hw_init_parms *parms)
>>>
>> You could do without the dev and parms.
>
> [WRR] Yes, I can get dev from pdcs. but parms is a stack variable in
> the calling function and has to be passed, as I see it.
>
hw_init_parms is invented only to be passed to pdc_hw_init from probe.
.ring_entries is PDC_RING_ENTRIES
.hw_pbase is unused
.hw_vbase is pdcs->pdc_reg_vbase

thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
