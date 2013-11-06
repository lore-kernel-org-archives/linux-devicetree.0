From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Thu, 07 Nov 2013 00:29:17 +0100
Message-ID: <527AD0CD.8020001@gmail.com>
References: <1383778182-16941-1-git-send-email-delicious.quinoa@gmail.com> <1383778182-16941-2-git-send-email-delicious.quinoa@gmail.com> <CAOMZO5BarpUGOExmDR8c2e0YOL41MmNkMii2ZU+jKrmEVtcmig@mail.gmail.com> <CANk1AXTys8B-jW0bATu19pOauVqe=aMc7v=SxXPm7npWb2y7eA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CANk1AXTys8B-jW0bATu19pOauVqe=aMc7v=SxXPm7npWb2y7eA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: delicious quinoa <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, Yves Vandervennet <rocket.yvanderv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/07/2013 12:18 AM, delicious quinoa wrote:
> On Wed, Nov 6, 2013 at 5:09 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Wed, Nov 6, 2013 at 8:49 PM, Alan Tull <delicious.quinoa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>> +
>>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +       gpio->regs = devm_ioremap_resource(&pdev->dev, res);
>>> +       if (!gpio->regs) {
>>> +               err = -ENOMEM;
>>> +               goto out_free_ports;
>>
>> The correct way to handle the error here would be:
>>
>> if (IS_ERR(gpio->regs) {
>>       err = PTR_ERR(gpio->regs)
>>       goto out_free_ports;
>>
>>
>>> +out_unregister:
>>> +       dwapb_gpio_unregister(gpio);
>>> +
>>> +       if (gpio->domain) {
>>> +               irq_dispose_mapping(gpio->hwirq);
>>> +               irq_domain_remove(gpio->domain);
>>> +       }
>>> +
>>> +out_free_ports:
>>> +       devm_kfree(&pdev->dev, gpio->ports);
>>
>> No need to call devm_kfree
>>
>>> +
>>> +out_err:
>>> +       devm_kfree(&pdev->dev, gpio);
>>
>> Same here.
>>
>>> +       return err;
>>> +}
>>> +
>>> +static int dwapb_gpio_remove(struct platform_device *pdev)
>>> +{
>>> +       struct dwapb_gpio *gpio = platform_get_drvdata(pdev);
>>> +
>>> +       dwapb_gpio_unregister(gpio);
>>> +       if (gpio->domain) {
>>> +               irq_dispose_mapping(gpio->hwirq);
>>> +               irq_domain_remove(gpio->domain);
>>> +       }
>>> +       devm_kfree(&pdev->dev, gpio->ports);
>>> +       devm_kfree(&pdev->dev, gpio);
>>
>> No need to call devm_kfree
>>
>> Regards,
>>
>> Fabio Estevam
>
> Cool, I agree.  I will fix in v7.

Alan, will review tomorrow. Please do not send v7 too quickly,
but let it idle for some more days. Especially, DT maintainers
have so many reviews to do - so be patient.

Also, for v7, you should use
'git format-patch --subject-prefix "PATCH v7" ...' to reflect
the patch version in email subject line.

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
