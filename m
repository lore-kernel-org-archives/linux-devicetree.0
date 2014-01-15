From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 1/2] ohci-platform: Add support for
 devicetree instantiation
Date: Wed, 15 Jan 2014 16:07:40 +0100
Message-ID: <52D6A43C.9090706@redhat.com>
References: <Pine.LNX.4.44L0.1401141404420.1310-100000@iolanthe.rowland.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBRGI3KLAKGQEOLEMORQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1401141404420.1310-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 01/14/2014 08:08 PM, Alan Stern wrote:
> On Mon, 13 Jan 2014, Hans de Goede wrote:
>
>> Add support for ohci-platform instantiation from devicetree, including
>> optionally getting clks and a phy from devicetree, and enabling / disabling
>> those on power_on / off.
>>
>> This should allow using ohci-platform from devicetree in various cases.
>> Specifically after this commit it can be used for the ohci controller found
>> on Allwinner sunxi SoCs.
>
> This is fine as far as I am concerned, except for one thing.
>
>> @@ -60,17 +127,23 @@ static int ohci_platform_probe(struct platform_device *dev)
>>   	struct usb_hcd *hcd;
>>   	struct resource *res_mem;
>>   	struct usb_ohci_pdata *pdata = dev_get_platdata(&dev->dev);
>> -	int irq;
>> -	int err = -ENOMEM;
>> -
>> -	if (!pdata) {
>> -		WARN_ON(1);
>> -		return -ENODEV;
>> -	}
>> +	struct ohci_platform_priv *priv;
>> +	int clk, irq, err;
>
> clk isn't initialized to anything...

Good catch, will fix and then do a v6 with this + the issue from your other mail fixed
and I'll add your ack.

>
>> -err_put_hcd:
>> -	usb_put_hcd(hcd);
>>   err_power:
>>   	if (pdata->power_off)
>>   		pdata->power_off(dev);
>> +err_put_clks:
>> +	while (--clk >= 0)
>> +		clk_put(priv->clks[clk]);
>
> ... but it gets used here.  The compiler should have warned about this.

Should have yes, but it doesn't (I've just double checked).

> After fixing that, you can add
>
> Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

Thanks & Regards,

Hans
