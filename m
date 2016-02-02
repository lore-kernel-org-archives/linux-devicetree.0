From: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 2/2] reset: img: Add Pistachio reset controller driver
Date: Tue, 2 Feb 2016 09:13:01 +0000
Message-ID: <56B0731D.6040605@imgtec.com>
References: <1453122758-651-1-git-send-email-james.hartley@imgtec.com>  <1453122758-651-3-git-send-email-james.hartley@imgtec.com> <1454359327.3447.77.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454359327.3447.77.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Damien Horsley <damien.horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Govindraj Raja <govindraj.raja-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

Yes that all looks fine to me.

Thanks,
James.

On 02/01/16 20:42, Philipp Zabel wrote:
> Hi James,
>
> Thanks for the reminder. I'll apply these with a few small fixups.
> No need to resend if you agree.
>
> Am Montag, den 18.01.2016, 13:12 +0000 schrieb James Hartley:
>> From: "Damien.Horsley" <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> s/Damien.Horsley/Damien Horsley/
>
>> Add reset controller driver for Pistachio SoC
>>
>> Signed-off-by: Damien.Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Same here.
>
>> Signed-off-by: James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/reset/Makefile                       |    1 +
>>   drivers/reset/reset-pistachio.c              |  155 ++++++++++++++++++++++++++
>>   include/dt-bindings/reset/pistachio-resets.h |   36 ++++++
>>   3 files changed, 192 insertions(+)
>>   create mode 100644 drivers/reset/reset-pistachio.c
>>   create mode 100644 include/dt-bindings/reset/pistachio-resets.h
> [...]
>> diff --git a/drivers/reset/reset-pistachio.c b/drivers/reset/reset-pistachio.c
>> new file mode 100644
>> index 0000000..8e39465
>> --- /dev/null
>> +++ b/drivers/reset/reset-pistachio.c
>> @@ -0,0 +1,155 @@
> [...]
>> +static int pistachio_reset_assert(struct reset_controller_dev *rcdev,
>> +			      unsigned long id)
> This should be aligned to the open parenthesis.
>
> [...]
>> +static int pistachio_reset_deassert(struct reset_controller_dev *rcdev,
>> +				unsigned long id)
> And this.
>
> [...]
>> +static int pistachio_reset_remove(struct platform_device *pdev)
>> +{
>> +	struct pistachio_reset_data *data = platform_get_drvdata(pdev);
>> +
>> +	reset_controller_unregister(&data->rcdev);
>> +
>> +	return 0;
>> +}
>> +
>> +
> And one of these empty lines has to go.
>
>> +static const struct of_device_id pistachio_reset_dt_ids[] = {
>> +	 { .compatible = "img,pistachio-reset", },
>> +	 { /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, pistachio_reset_dt_ids);
>> +
>> +static struct platform_driver pistachio_reset_driver = {
>> +	.probe	= pistachio_reset_probe,
>> +	.remove	= pistachio_reset_remove,
>> +	.driver = {
>> +		.name		= "pistachio-reset",
>> +		.of_match_table	= pistachio_reset_dt_ids,
>> +	},
>> +};
>> +module_platform_driver(pistachio_reset_driver);
>> +
>> +MODULE_AUTHOR("Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>");
> regards
> Philipp
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
