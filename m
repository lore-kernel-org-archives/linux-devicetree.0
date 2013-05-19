From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH v2] net: dm9000: Allow instantiation using device tree
Date: Sun, 19 May 2013 19:18:41 +0200
Message-ID: <51990971.2050306@gmail.com>
References: <1368962191-32594-1-git-send-email-tomasz.figa@gmail.com> <5198D359.5060608@gmail.com> <15046898.dr5fzcR9ZS@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <15046898.dr5fzcR9ZS@flatron>
Sender: netdev-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Sascha Hauer <s.hauer@pengutronix.de>, David Miller <davem@davemloft.net>, Francois Romieu <romieu@fr.zoreil.com>
List-Id: devicetree@vger.kernel.org

On 05/19/2013 03:41 PM, Tomasz Figa wrote:
>>> +static struct dm9000_plat_data *dm9000_parse_dt(struct device *dev)
>>> >  >  +{
>>> >  >  +	struct dm9000_plat_data *pdata;
>>> >  >  +	struct device_node *np = dev->of_node;
>>> >  >  +	const void *mac_addr;
>>> >  >  +
>>> >  >  +	if (!IS_ENABLED(CONFIG_OF) || !np)
>>> >  >  +		return NULL;
>> >
>> >  Shouldn't ERR_PTR() value be returned here ?
>
> Nope. No platform data is a valid case, so no error here.

OK, sorry, I should have checked that.

>>> >  >  +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>>> >  >  +	if (!pdata) {
>>> >  >  +		dev_err(dev, "failed to allocate platform data struct\n");
>> >
>> >  There is no need for this error log, k*alloc already logs any failures.
>
> Hmm. Does it print what allocation exactly failed? (e.g. a backtrace)

It seems the caller tracking is supported in subset of the kernel 
configurations.

> Not that it would give anything that could help you in an out of memory
> condition like this, but in general it's good to know in what point the
> failure happened.

As long as it is ENOMEM and the driver core reports failed probe I wouldn't
really care. Nevertheless I saw patch series removing such already existing
"Not enough memory" kind of error logs from the kernel, pointing out that mm
already provides relevant error logging.

Thanks,
Sylwester
