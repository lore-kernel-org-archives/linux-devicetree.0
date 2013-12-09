From: Chris Ruehl <chris.ruehl-CR359r9tUDPXPF5Rlphj1Q@public.gmane.org>
Subject: Re: [PATCH 1/3] usb: phy-generic: Add GPIO based ChipSelect
Date: Mon, 09 Dec 2013 12:11:54 +0800
Message-ID: <52A5430A.5010308@gtsys.com.hk>
References: <1385967919-13258-1-git-send-email-chris.ruehl@gtsys.com.hk> <1385967919-13258-2-git-send-email-chris.ruehl@gtsys.com.hk> <20131206202453.GF21086@saruman.home> <52A520BA.1000603@gtsys.com.hk> <20131209040705.GB20608@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131209040705.GB20608-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday, December 09, 2013 12:07 PM, Felipe Balbi wrote:
> Hi,
>
> On Mon, Dec 09, 2013 at 09:45:30AM +0800, Chris Ruehl wrote:
>> On Saturday, December 07, 2013 04:24 AM, Felipe Balbi wrote:
>>> Hi,
>>>
>>> On Mon, Dec 02, 2013 at 03:05:17PM +0800, Chris Ruehl wrote:
>>>> @@ -231,27 +249,40 @@ static int usb_phy_gen_xceiv_probe(struct platform_device *pdev)
>>>>   		return -ENOMEM;
>>>>
>>>>   	nop->reset_active_low = true;	/* default behaviour */
>>>> +	nop->cs_active_low = true;
>>>>
>>>>   	if (dev->of_node) {
>>>>   		struct device_node *node = dev->of_node;
>>>>   		enum of_gpio_flags flags;
>>>> +		enum of_gpio_flags csflags;
>>>>
>>>>   		if (of_property_read_u32(node, "clock-frequency",&clk_rate))
>>>>   			clk_rate = 0;
>>>>
>>>>   		needs_vcc = of_property_read_bool(node, "vcc-supply");
>>>> +
>>>>   		nop->gpio_reset = of_get_named_gpio_flags(node, "reset-gpios",
>>>>   								0,&flags);
>>>> +
>>> two unrelated changes
>>>
>>>>   		if (nop->gpio_reset == -EPROBE_DEFER)
>>>>   			return -EPROBE_DEFER;
>>>>
>>>>   		nop->reset_active_low = flags&  OF_GPIO_ACTIVE_LOW;
>>>>
>>>> +		nop->gpio_chipselect = of_get_named_gpio_flags(node, "cs-gpios",
>>>> +								0,&csflags);
>>>> +		if (gpio_is_valid(nop->gpio_chipselect))
>>>> +			nop->cs_active_low = csflags&  OF_GPIO_ACTIVE_LOW;
>>>> +
>>>>   	} else if (pdata) {
>>>>   		type = pdata->type;
>>>>   		clk_rate = pdata->clk_rate;
>>>>   		needs_vcc = pdata->needs_vcc;
>>>>   		nop->gpio_reset = pdata->gpio_reset;
>>>> +		nop->gpio_chipselect = pdata->gpio_chipselect;
>>>> +	} else {
>>>> +		nop->gpio_reset = -1;
>>> This line is already going upstream, please remove it, i'll handle the
>>> conflict later.
>>>
>> Beause the rest of the patch set is not ready to make it in the
>> upstream, I will checkout latest linux-next and send the patch again
>> as a single patch.
> no, please *never* base any patches off of linux-next. That tree gets
> recreated every day and can never be considered stable. Aim at using a
> tag from Linus instead (v3.13-rc3, for example). It's a much better
> development point than linux-next.
>
> In case patch doesn't apply cleanly, different maintainers will have
> their choice of rebasing it themselves or asking author to rebase on a
> specific branch.
>
> By default, however, use a tag from Linus.
>
> cheers
>

Thanks for the advice, I will follow :-)

Chris
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
