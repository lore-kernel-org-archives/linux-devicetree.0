From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 2/2] gpio: axp209: add pinctrl support
Date: Wed, 23 Nov 2016 14:45:12 +0100
Message-ID: <20161123144512.55eb45e7@free-electrons.com>
References: <20161123132749.11666-1-quentin.schulz@free-electrons.com>
        <20161123132749.11666-3-quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20161123132749.11666-3-quentin.schulz@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello,

By far not a full review, just a few things that I saw while scrolling
through the code.

On Wed, 23 Nov 2016 14:27:49 +0100, Quentin Schulz wrote:

> +static struct axp20x_desc_function *
> +axp20x_pinctrl_desc_find_func_by_name(struct axp20x_pctl *pctl,
> +				      const char *group, const char *func)
> +{
> +	const struct axp20x_desc_pin *pin;
> +	struct axp20x_desc_function *desc_func;

These variables should go inside the for loop. There is this problem in
other functions in your code: you should keep local variables in the
scope where they are used.

> +	int i;
> +
> +	for (i = 0; i < pctl->desc->npins; i++) {
> +		pin = &pctl->desc->pins[i];
> +
> +		if (!strcmp(pin->pin.name, group)) {

Change this to:

		if (strcmp(pin->pin.name, group))
			continue;

This way, the rest of the code in the function is intended with one
less tab.

Or alternatively, if only one element in the array will match, you can
also break out from the loop when you have found the matching element,
and handle whatever needs to be done on this element outside of the
loop.

> +static struct axp20x_desc_function *
> +axp20x_pctl_desc_find_func_by_pin(struct axp20x_pctl *pctl, unsigned int offset,
> +				  const char *func)
> +{
> +	const struct axp20x_desc_pin *pin;
> +	struct axp20x_desc_function *desc_func;
> +	int i;
> +
> +	for (i = 0; i < pctl->desc->npins; i++) {
> +		pin = &pctl->desc->pins[i];
> +
> +		if (pin->pin.number == offset) {

Same comment here.

> +static int axp20x_build_state(struct platform_device *pdev)
> +{
> +	struct axp20x_pctl *pctl = platform_get_drvdata(pdev);
> +	unsigned int npins = pctl->desc->npins;
> +	const struct axp20x_desc_pin *pin;
> +	struct axp20x_desc_function *func;
> +	int i, ret;
> +
> +	pctl->ngroups = npins;
> +	pctl->groups = devm_kzalloc(&pdev->dev,
> +				    pctl->ngroups * sizeof(*pctl->groups),
> +				    GFP_KERNEL);
> +	if (!pctl->groups)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < npins; i++) {
> +		pctl->groups[i].name = pctl->desc->pins[i].pin.name;
> +		pctl->groups[i].pin = pctl->desc->pins[i].pin.number;
> +	}
> +
> +	/* We assume 4 functions per pin should be enough as a default max */
> +	pctl->functions = devm_kzalloc(&pdev->dev,
> +				       npins * 4 * sizeof(*pctl->functions),
> +				       GFP_KERNEL);
> +	if (!pctl->functions)
> +		return -ENOMEM;
> +
> +	/* Create a list of uniquely named functions */
> +	for (i = 0; i < npins; i++) {
> +		pin = &pctl->desc->pins[i];
> +		func = pin->functions;
> +
> +		while (func->name) {
> +			axp20x_pinctrl_add_function(pctl, func->name);
> +			func++;
> +		}
> +	}
> +
> +	pctl->functions = krealloc(pctl->functions,
> +				   pctl->nfunctions * sizeof(*pctl->functions),
> +				   GFP_KERNEL);

Not sure why you need to first allocation for 4 functions, and then
reallocate a potentially larger (or smaller?) array here.

Will devm_kzalloc() followed by krealloc() really have the expected
behavior?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
