From: delicious quinoa <delicious.quinoa@gmail.com>
Subject: Re: [PATCH 1/1] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Wed, 6 Nov 2013 17:18:54 -0600
Message-ID: <CANk1AXTys8B-jW0bATu19pOauVqe=aMc7v=SxXPm7npWb2y7eA@mail.gmail.com>
References: <1383778182-16941-1-git-send-email-delicious.quinoa@gmail.com>
	<1383778182-16941-2-git-send-email-delicious.quinoa@gmail.com>
	<CAOMZO5BarpUGOExmDR8c2e0YOL41MmNkMii2ZU+jKrmEVtcmig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5BarpUGOExmDR8c2e0YOL41MmNkMii2ZU+jKrmEVtcmig@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@stericsson.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jamie Iles <jamie@jamieiles.com>, Heiko Stuebner <heiko@sntech.de>, Alan Tull <atull@altera.com>, Dinh Nguyen <dinguyen@altera.com>, Yves Vandervennet <rocket.yvanderv@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 6, 2013 at 5:09 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Wed, Nov 6, 2013 at 8:49 PM, Alan Tull <delicious.quinoa@gmail.com> wrote:
>
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       gpio->regs = devm_ioremap_resource(&pdev->dev, res);
>> +       if (!gpio->regs) {
>> +               err = -ENOMEM;
>> +               goto out_free_ports;
>
> The correct way to handle the error here would be:
>
> if (IS_ERR(gpio->regs) {
>      err = PTR_ERR(gpio->regs)
>      goto out_free_ports;
>
>
>> +out_unregister:
>> +       dwapb_gpio_unregister(gpio);
>> +
>> +       if (gpio->domain) {
>> +               irq_dispose_mapping(gpio->hwirq);
>> +               irq_domain_remove(gpio->domain);
>> +       }
>> +
>> +out_free_ports:
>> +       devm_kfree(&pdev->dev, gpio->ports);
>
> No need to call devm_kfree
>
>> +
>> +out_err:
>> +       devm_kfree(&pdev->dev, gpio);
>
> Same here.
>
>> +       return err;
>> +}
>> +
>> +static int dwapb_gpio_remove(struct platform_device *pdev)
>> +{
>> +       struct dwapb_gpio *gpio = platform_get_drvdata(pdev);
>> +
>> +       dwapb_gpio_unregister(gpio);
>> +       if (gpio->domain) {
>> +               irq_dispose_mapping(gpio->hwirq);
>> +               irq_domain_remove(gpio->domain);
>> +       }
>> +       devm_kfree(&pdev->dev, gpio->ports);
>> +       devm_kfree(&pdev->dev, gpio);
>
> No need to call devm_kfree
>
> Regards,
>
> Fabio Estevam

Cool, I agree.  I will fix in v7.

Thanks,
Alan
