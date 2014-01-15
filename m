From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 1/2] ohci-platform: Add support for
 devicetree instantiation
Date: Wed, 15 Jan 2014 19:58:25 +0100
Message-ID: <52D6DA51.5050905@redhat.com>
References: <Pine.LNX.4.44L0.1401151123340.1587-100000@iolanthe.rowland.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Return-path: <linux-sunxi+bncBDL4X2GMZUKRBWNU3OLAKGQEHP3E4OQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1401151123340.1587-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
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

On 01/15/2014 05:30 PM, Alan Stern wrote:
> On Wed, 15 Jan 2014, Hans de Goede wrote:
>
>> +static int ohci_platform_power_on(struct platform_device *dev)
>> +{
>> +	struct usb_hcd *hcd = platform_get_drvdata(dev);
>> +	struct ohci_platform_priv *priv = hcd_to_ohci_priv(hcd);
>> +	int clk, ret;
>> +
>> +	for (clk = 0; clk < OHCI_MAX_CLKS && priv->clks[clk]; clk++) {
>
> You fixed this one...
>
>> @@ -125,13 +225,22 @@ static int ohci_platform_remove(struct platform_device *dev)
>>   {
>>   	struct usb_hcd *hcd = platform_get_drvdata(dev);
>>   	struct usb_ohci_pdata *pdata = dev_get_platdata(&dev->dev);
>> +	struct ohci_platform_priv *priv = hcd_to_ohci_priv(hcd);
>> +	int clk;
>>
>>   	usb_remove_hcd(hcd);
>> -	usb_put_hcd(hcd);
>>
>>   	if (pdata->power_off)
>>   		pdata->power_off(dev);
>>
>> +	for (clk = 0; priv->clks[clk] && clk < OHCI_MAX_CLKS; clk++)
>
> but not this one.  :-(  Same for the ehci-platform patch.

Oops, sorry about that, v7 coming up.

> In fact, it might be easier to make this loop go backward, like
> you do in the *_platform_power_off routines.

I prefer keep doing things forward here, the backward loop in
power_off is because the disable_unprepare must be done in reverse
order if the prepare_enable calls.

> Is there a devm-type routine that will take care of all this for you?

Nope, the downside of getting the clocks by index rather then by name
is that there are no devm routines for that.

Regards,

Hans
