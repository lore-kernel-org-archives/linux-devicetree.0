From: Andreas Larsson <andreas@gaisler.com>
Subject: Re: [PATCH v3] gpio: Add device driver for GRGPIO cores and support
 custom accessors with gpio-generic
Date: Wed, 13 Feb 2013 15:13:53 +0100
Message-ID: <511B9FA1.1090602@gaisler.com>
References: <1360653873-25368-1-git-send-email-andreas@gaisler.com> <20130213070550.GA17523@lizard.gateway.2wire.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130213070550.GA17523@lizard.gateway.2wire.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Anton Vorontsov <anton@enomsg.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

On 2013-02-13 08:05, Anton Vorontsov wrote:
> On Tue, Feb 12, 2013 at 08:24:33AM +0100, Andreas Larsson wrote:
>> +	res = platform_get_resource(ofdev, IORESOURCE_MEM, 0);
>> +	regs = devm_request_and_ioremap(&ofdev->dev, res);
>
> Just wonder, is it safe to pass null res to devm_request_and_ioremap()?

Yes, and it is the preferred sequence of calls according to the 
documentation of devm_request_and_ioremap.


>> +	label = kstrdup(np->full_name, GFP_KERNEL);
>> +	if (label)
>> +		gc->label = label;
>
> Do we need to free label? If not, having a comment would be awesome. :)
> And should we print a warning for !label case?

Yes, it needs to be freed, thanks! The !label case is kind of OK as the 
gpio system assigns some other label if it is NULL, but I'll require it 
instead to make things easier.


>> +static int grgpio_remove(struct platform_device *ofdev)
>> +{
>> +	dev_set_drvdata(&ofdev->dev, NULL);
>
> Is this really needed?

I guess not.


Thanks for the feedback! I take care of the other comments as well.

Cheers,
Andreas Larsson
