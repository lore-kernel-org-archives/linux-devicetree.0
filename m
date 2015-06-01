From: Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH 2/3] edac: Add L3/SoC support to the APM X-Gene SoC EDAC driver
Date: Mon, 1 Jun 2015 10:26:30 -0700
Message-ID: <CAPw-ZTkDuN4+OSRbiR=REPtTiFxWSh6XNq5uG8AopZGy__9qhg@mail.gmail.com>
References: <1432937075-16558-1-git-send-email-lho@apm.com>
	<1432937075-16558-2-git-send-email-lho@apm.com>
	<1432937075-16558-3-git-send-email-lho@apm.com>
	<20150601114346.GA10169@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150601114346.GA10169-fF5Pk5pvG8Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Borislav Petkov <bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org>
Cc: Doug Thompson <dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Masters <jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "patches-qTEPVZfXA3Y@public.gmane.org" <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

>> +static struct edac_dev_sysfs_attribute xgene_edac_l3_sysfs_attributes[] = {
>> +     { .attr = {
>> +               .name = "inject_ctrl",
>> +               .mode = (S_IRUGO | S_IWUSR)
>> +       },
>> +      .show = xgene_edac_l3_inject_ctrl_show,
>> +      .store = xgene_edac_l3_inject_ctrl_store },
>> +
>> +     /* End of list */
>> +     { .attr = {.name = NULL } }
>> +};
>
> Why are those sysfs nodes? Didn't we say that inject nodes should be in
> debugfs?
>
> So I'm going to stop looking here and wait for you to do the same
> changes to L3 and SOC as for the rest of the driver. Go through what
> just went upstream and do the same changes to that patch instead of
> blindly resending the original version.
>
> It is not a competition who gets their stuff upstream first, ok?!

Sorry about this and being a bit careless here.

>
>> +
>> +     if (edac_op_state == EDAC_OPSTATE_POLL)
>> +             edac_dev->edac_check = xgene_edac_l3_check;
>> +
>> +     edac_dev->sysfs_attributes = xgene_edac_l3_sysfs_attributes;
>> +
>> +     rc = edac_device_add_device(edac_dev);
>> +     if (rc > 0) {
>> +             dev_err(edac->dev, "failed edac_device_add_device()\n");
>> +             rc = -ENOMEM;
>> +             goto err1;
>> +     }
>> +
>> +     if (edac_op_state == EDAC_OPSTATE_INT)
>> +             edac_dev->op_state = OP_RUNNING_INTERRUPT;
>> +
>> +     list_add(&ctx->next, &edac->l3s);
>> +
>> +     xgene_edac_l3_hw_init(edac_dev, 1);
>
> Shouldn't you init the hw regs *before* you add it to the list of l3s
> and *not* after?

I want to make sure that the node is added in case there is an pending
interrupt. Otherwise, it will not get cleared and will continuously
generates interrupt.

-Loc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
