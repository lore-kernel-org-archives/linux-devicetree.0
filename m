From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/9] clk: sunxi: Add prcm mod0 clock driver
Date: Wed, 26 Nov 2014 09:04:57 +0100
Message-ID: <547589A9.5060802@redhat.com>
References: <1416749895-25013-1-git-send-email-hdegoede@redhat.com> <1416749895-25013-4-git-send-email-hdegoede@redhat.com> <20141125165744.GA17789@x1>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBNET22RQKGQEYQ2JSWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20141125165744.GA17789@x1>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 11/25/2014 05:57 PM, Lee Jones wrote:
> On Sun, 23 Nov 2014, Hans de Goede wrote:
>
>> Add a driver for mod0 clocks found in the prcm. Currently there is only
>> one mod0 clocks in the prcm, the ir clock.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
>>   drivers/clk/sunxi/Makefile                        |  2 +-
>>   drivers/clk/sunxi/clk-sun6i-prcm-mod0.c           | 63 +++++++++++++++++++++++
>>   drivers/mfd/sun6i-prcm.c                          | 14 +++++
>>   4 files changed, 79 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/clk/sunxi/clk-sun6i-prcm-mod0.c
>
> [...]
>
>> diff --git a/drivers/mfd/sun6i-prcm.c b/drivers/mfd/sun6i-prcm.c
>> index 283ab8d..ff1254f 100644
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
> I'm not overly keen on these magic numbers (and yes, I'm well aware
> that I SoB'ed the patch which started them off).
>
> It's not a show stopper, although I'd prefer if they were fixed with a
> subsequent patch.

These are offsets of the relevant registers inside the prcm register block,
if not done this way, then how should they be done ?

Regards,

Hans
