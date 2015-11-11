From: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH 2/2] usb: phy: msm: fix connect/disconnect bug for
 dragonboard OTG port
Date: Wed, 11 Nov 2015 09:48:00 -0800
Message-ID: <56437F50.6050006@sonymobile.com>
References: <1447202811-3429-1-git-send-email-tim.bird@sonymobile.com>
 <1447202811-3429-2-git-send-email-tim.bird@sonymobile.com>
 <20151111031445.GA8826@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151111031445.GA8826@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, =?UTF-8?Q?Andersson=2c_Bj=c3=b6rn?= <Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 11/10/2015 07:14 PM, Peter Chen wrote:
> On Tue, Nov 10, 2015 at 04:46:51PM -0800, Tim Bird wrote:
>> This fixes a bug where if you disconnect and re-connect the USB cable,
>> the gadget driver stops working.
>>
>> Add support for async_irq to wake up driver from low power mode.
>> Without this, the power management code never calls resume.
>> Also, have the phy driver kick the gadget driver (chipidea otg)
>> by having the chipidea driver register with it, for vbus connect
>> notifications.
>>
>> Signed-off-by: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>> ---
>>  drivers/usb/chipidea/udc.c    |  6 ++++++
>>  drivers/usb/phy/phy-msm-usb.c | 16 ++++++++++++++++
>>  include/linux/usb/msm_hsusb.h |  1 +
>>  3 files changed, 23 insertions(+)
>>
>> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
>> index 8223fe7..06234cd 100644
>> --- a/drivers/usb/chipidea/udc.c
>> +++ b/drivers/usb/chipidea/udc.c
>> @@ -1890,6 +1890,12 @@ static int udc_start(struct ci_hdrc *ci)
>>  
>>  	ci->gadget.ep0 = &ci->ep0in->ep;
>>  
>> +	if (ci->usb_phy) {
>> +		retval = otg_set_peripheral(ci->usb_phy->otg, &ci->gadget);
>> +		if (retval)
>> +			goto destroy_eps;
>> +	}
>> +
>>  	retval = usb_add_gadget_udc(dev, &ci->gadget);
>>  	if (retval)
>>  		goto destroy_eps;
> 
> Although it looks no affect for other drivers, it is better you
> can split patches between controller and phy, then I can have a test.

OK.

> In fact, most of phy-msm-usb.c's implementations (except USB PHY related)
> are included in chipidea drivers, hope you can try it in future.

I would like to do this.  I'm pretty confused about the relationship between
ehci, chipidea and the phy code, with regard to managing the controller
hardware.  Is there a phy in mainline that is a good example of having most
of the controller support in the chipidea driver rather than in the phy?

Thanks!
 
>> diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
>> index 80eb991..eb80f92 100644
>> --- a/drivers/usb/phy/phy-msm-usb.c
>> +++ b/drivers/usb/phy/phy-msm-usb.c
>> @@ -1731,6 +1731,12 @@ static int msm_otg_probe(struct platform_device *pdev)
>>  		return motg->irq;
>>  	}
>>  
>> +	motg->async_irq = platform_get_irq_byname(pdev, "async_irq");
>> +	if (motg->async_irq < 0) {
>> +		dev_info(&pdev->dev, "platform_get_irq for async_irq failed\n");
>> +		motg->async_irq = 0;
>> +	}
>> +
> 
> dev_err

OK - I'll change this.  I've listed the async_irq as optional in the binding doc,
so I don't actually error out, but I was unsure the appropriate error level for
this message.

Thanks for the feedback!
 -- Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
