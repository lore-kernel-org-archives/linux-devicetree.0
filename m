From: Christophe RICARD <christophe.ricard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tpmdd-devel] [PATCH 07/16] tpm/tpm_i2c_stm_st33: Add devicetree
 structure
Date: Wed, 08 Oct 2014 07:47:58 +0200
Message-ID: <5434D00E.7000602@gmail.com>
References: <1412712189-1234-1-git-send-email-christophe-h.ricard@st.com> <1412712189-1234-8-git-send-email-christophe-h.ricard@st.com> <20141007223025.GE2366@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141007223025.GE2366-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: peterhuewe-Mmb7MZpHnFY@public.gmane.org, ashley-fm2HMyfA2y6tG0bUXCXiUA@public.gmane.org, tpmdd-yWjUBOtONefk1uMJSBkQmQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, christophe-h.ricard-qxv4g6HH51o@public.gmane.org, jean-luc.blanc-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jason,

On 08/10/2014 00:30, Jason Gunthorpe wrote:
> On Tue, Oct 07, 2014 at 10:03:00PM +0200, Christophe Ricard wrote:
>
>> +_irq_probe:
>> +	/* IRQ */
>> +	r = irq_of_parse_and_map(pp, 0);
>> +	if (r < 0) {
>> +		pr_err("Unable to get irq, error: %d\n", r);
>> +		interrupts = 0;
>> +		goto _end;
>> +	}
>> +	interrupts = 1;
>> +	client->irq = r;
> client->irq is already set correctly by of_i2c_register_devices - so I
> don't think this sequence is necessary?
May be you are right. I will crosscheck.
>> +	if (interrupts) {
>> +		r = devm_gpio_request_one(&client->dev, pdata->io_serirq,
>> +					GPIOF_IN, "TPM IO_SERIRQ");
> Similarly, I wonder if pdata->io_serirq is just duplication of
> client->irq and that should be set by the creator instead?
pdata->io_serirq stores the gpio number which will be converted into irq 
number.
pdata->io_serirq is only use by static platform configuration not 
devicetree configuration
>> +#ifdef CONFIG_OF
>> +static const struct of_device_id of_st33zp24_i2c_match[] = {
>> +	{ .compatible = "st,st33zp24_i2c", },
>> +	{}
>> +};
> missing:
>
> MODULE_DEVICE_TABLE(of, of_st33zp24_i2c_match);
Oops. Good catch :).
>> +		#ifdef CONFIG_OF
>> +			.of_match_table = of_match_ptr(of_st33zp24_i2c_match),
>> +		#endif
> The #ifdef is unnecessary, the of_match_ptr macro takes care of that
> already.
Ok will clean that.
>
> Jason

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
