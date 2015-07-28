From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v2 3/6] mailbox: Add support for ST's Mailbox IP
Date: Wed, 29 Jul 2015 00:06:55 +0200
Message-ID: <1438121215.30903.27.camel@tiscali.nl>
References: <1437990272-23111-1-git-send-email-lee.jones@linaro.org>
	 <1437990272-23111-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437990272-23111-4-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, jassisinghbrar@gmail.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On ma, 2015-07-27 at 10:44 +0100, Lee Jones wrote:
> --- /dev/null
> +++ b/drivers/mailbox/mailbox-sti.c

> +static int sti_mbox_probe(struct platform_device *pdev)
> +{
> +	[...]
> +
> +	match = of_match_device(sti_mailbox_match, &pdev->dev);
> +	if (!match) {
> +		dev_err(&pdev->dev, "No configuration found\n");
> +		return -ENODEV;
> +	}
> +	pdev->dev.platform_data = (struct sti_mbox_pdata *) match->data;
> +
> +	[...]
> +}

> +static struct platform_driver sti_mbox_driver = {
> +	.probe = sti_mbox_probe,
> +	.remove = sti_mbox_remove,
> +	.driver = {
> +		.name = "sti-mailbox",
> +		.of_match_table = sti_mailbox_match,
> +	},
> +};
> +module_platform_driver(sti_mbox_driver);

> +MODULE_ALIAS("platform:mailbox-sti");

It seems this alias is only useful if there's a corresponding struct
platform_device with a "mailbox-sti" .name. I couldn't spot that
platform_device.

Besides, if I read sti_max_probe() correctly, without OF support loading
this module won't accomplish much. So what would another way of
autoloading this module buy you?

Thanks,


Paul Bolle
