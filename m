From: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH v4 3/3] usb: chipidea: register driver as a peripheral
 with the phy
Date: Mon, 23 Nov 2015 10:05:23 -0800
Message-ID: <56535563.6010902@sonymobile.com>
References: <1448063240-2739-1-git-send-email-tim.bird@sonymobile.com>
 <1448063240-2739-3-git-send-email-tim.bird@sonymobile.com>
 <20151123082929.GA8193@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151123082929.GA8193@shlinux2>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, =?UTF-8?Q?Andersson=2c_Bj=c3=b6rn?= <Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <tbird20d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 11/23/2015 12:29 AM, Peter Chen wrote:
> On Fri, Nov 20, 2015 at 03:47:20PM -0800, Tim Bird wrote:
>> Register the chipidea driver with the phy, so that the phy
>> driver can kick the gadget driver when it resumes from low power.
>> The phy-msm-usb (Qualcomm) driver requires this in order to
>> recover gadget operation after you disconnect the USB cable
>> and reconnect it.
>>
>> Signed-off-by: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>> ---
>>  drivers/usb/chipidea/udc.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
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
> Hi Tim,
> 
> I am afraid it can't work for current chipidea framework (find this
> problem after testing), the chipidea core manages its host and device
> function using its own API start/stop, it does not define struct usb_otg
> APIs. In fact, it is not reasonable control host and device function
> at PHY driver.

OK.  I'm going to re-evaluate the phy-msm-usb.c code, and try to figure out
what it should look like under the current framework.

Thanks for looking at it and testing it.  I may have questions as I go.
 -- Tim

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
