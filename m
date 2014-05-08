From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/7] reset: sunxi: allow MFD subdevices probe
Date: Thu, 08 May 2014 22:05:59 +0200
Message-ID: <536BE3A7.8030402@free-electrons.com>
References: <1399483554-8824-1-git-send-email-boris.brezillon@free-electrons.com> <1399483554-8824-3-git-send-email-boris.brezillon@free-electrons.com> <20140508030722.GL7047@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBBLWHV6NQKGQEPRY5SKI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20140508030722.GL7047@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 08/05/2014 05:07, Maxime Ripard wrote:
> On Wed, May 07, 2014 at 07:25:49PM +0200, Boris BREZILLON wrote:
>> The current implementation uses sunxi_reset_init function for both early
>> init and platform device probe.
>>
>> The sunxi_reset_init function uses DT to retrieve device resources, which
>> will be an issue if reset controllers are registered from an MFD device
>> that define resources from mfd_cell definition.
>>
>> Moreover, we can make of devm functions when we're in the probe context.
>>
>> Signed-off-by: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> ---
>>  drivers/reset/reset-sunxi.c | 21 ++++++++++++++++++---
>>  1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/reset/reset-sunxi.c b/drivers/reset/reset-sunxi.c
>> index 695bd34..1b5fea6 100644
>> --- a/drivers/reset/reset-sunxi.c
>> +++ b/drivers/reset/reset-sunxi.c
>> @@ -145,7 +145,24 @@ MODULE_DEVICE_TABLE(of, sunxi_reset_dt_ids);
>>  
>>  static int sunxi_reset_probe(struct platform_device *pdev)
>>  {
>> -	return sunxi_reset_init(pdev->dev.of_node);
>> +	struct sunxi_reset_data *data;
>> +	struct resource *res;
>> +
>> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	data->membase = devm_request_and_ioremap(&pdev->dev, res);
>> +	if (!data->membase)
>> +		return -ENOMEM;
> You'd probably be better off using devm_ioremap_resource so that you
> get a meaningful error code.

Oh, I missed this one. I'll fix it for the next version.

> Apart from this, you have my 
> Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>
> Thanks!
> Maxime
>

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
