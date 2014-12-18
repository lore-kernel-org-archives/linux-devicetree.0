From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 07/13] mfd: sun6i-prcm: Add support for
 the ir-clk
Date: Thu, 18 Dec 2014 09:53:22 +0100
Message-ID: <54929602.8020002@redhat.com>
References: <1418836704-15689-1-git-send-email-hdegoede@redhat.com> <1418836704-15689-8-git-send-email-hdegoede@redhat.com> <20141218084129.GT13885@x1>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBC5MZKSAKGQEWF52FOA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141218084129.GT13885@x1>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 18-12-14 09:41, Lee Jones wrote:
> On Wed, 17 Dec 2014, Hans de Goede wrote:
>
>> Add support for the ir-clk which is part of the sun6i SoC prcm module.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/mfd/sun6i-prcm.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>
> Pretty standard stuff (
>
>> diff --git a/drivers/mfd/sun6i-prcm.c b/drivers/mfd/sun6i-prcm.c
>> index 2f2e9f0..1911731 100644
>> --- a/drivers/mfd/sun6i-prcm.c
>> +++ b/drivers/mfd/sun6i-prcm.c
>> @@ -41,6 +41,14 @@ static const struct resource sun6i_a31_apb0_gates_clk_res[] = {
>>   	},
>>   };
>>
>> +static const struct resource sun6i_a31_ir_clk_res[] = {
>> +	{
>> +		.start = 0x54,
>> +		.end = 0x57,
>> +		.flags = IORESOURCE_MEM,
>> +	},
>> +};
>
> I'm still unkeen on this registers not being defined -- but whateveer!
>
>>   static const struct resource sun6i_a31_apb0_rstc_res[] = {
>>   	{
>>   		.start = 0xb0,
>> @@ -69,6 +77,12 @@ static const struct mfd_cell sun6i_a31_prcm_subdevs[] = {
>>   		.resources = sun6i_a31_apb0_gates_clk_res,
>>   	},
>>   	{
>> +		.name = "sun6i-a31-ir-clk",
>> +		.of_compatible = "allwinner,sun4i-a10-mod0-clk",
>> +		.num_resources = ARRAY_SIZE(sun6i_a31_ir_clk_res),
>> +		.resources = sun6i_a31_ir_clk_res,
>> +	},
>> +	{
>>   		.name = "sun6i-a31-apb0-clock-reset",
>>   		.of_compatible = "allwinner,sun6i-a31-clock-reset",
>>   		.num_resources = ARRAY_SIZE(sun6i_a31_apb0_rstc_res),
>
> This is all pretty standard stuff:
>
> For my own reference:
>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Do you do  you expect this patch to be handled?

I've no preference for how this goes upstream. There are no compile time deps
and runtime the ir will not work (but not explode) until all the bits are
in place.

Regards,

Hans


>
