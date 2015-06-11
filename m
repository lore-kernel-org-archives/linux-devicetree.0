From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Re: [PATCH v4 1/2] phy-sun4i-usb: Add full support
 for usb0 phy / OTG
Date: Thu, 11 Jun 2015 18:33:08 +0900
Message-ID: <557955D4.4030908@samsung.com>
References: <1433088626-8858-1-git-send-email-hdegoede@redhat.com>
 <1433088626-8858-2-git-send-email-hdegoede@redhat.com> <55792122.20607@ti.com>
 <557941A6.5000306@samsung.com> <557944EE.1020303@redhat.com>
 <557946EC.3060607@samsung.com> <55794DEA.1050604@redhat.com>
Reply-To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDL3F4G2ZAIBBVVL4WVQKGQE7UHGGRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-reply-to: <55794DEA.1050604-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 06/11/2015 05:59 PM, Hans de Goede wrote:
> Hi,
> 
> On 11-06-15 10:29, Chanwoo Choi wrote:
>> Hi Hans,
>>
>> On 06/11/2015 05:21 PM, Hans de Goede wrote:
>>> Hi Chanwoo,
>>>
>>> Thanks for the quick review.
>>>
>>> On 11-06-15 10:07, Chanwoo Choi wrote:
>>>> Hi Hans,
>>>>
>>>> I add the comment about extcon-related code.
>>>>
>>>> Firstly,
>>>> I'd like you to implment the extcon driver for phy-sun4i-usb device
>>>> in drivers/extcon/ directoryby using MFD
>>>
>>> No, just no, this is not what the MFD framework is for, the usb-phy
>>> in question here is not a multifunction device. The MFD framework
>>> is intended for true multi-function devices like i2c attached
>>> PMICs which have regulators, gpios, pwm, input (power button),
>>> chargers, power-supply, etc. That is NOT the case here.
>>>
>>> Also moving this to the MFD framework would very likely requiring
>>> the devicetree binding for the usb-phy to change which we cannot
>>> do as that would break the devicetree ABI.
>>>
>>>> because there are both extcon
>>>> provider driver and extcon client driver. I think that all extcon
>>>> provider driver better to be included in drivers/extcon/ directory.
>>>> extcon_set_cable_state() function should be handled in extcon provider
>>>> driver which is incluced in drivers/extcon/ directory.
>>>
>>> I do not find this a compelling reason, there are plenty of subsystems
>>> where not all implementations of the subsystem class live in the subsystem
>>> directory, e.g. input and hwmon devices are often also found outside of
>>> the input and hwmon driver directories.
>>
>> There are difference on between input/hwmon and extcon.
>>
>> Because input and hwmon driver implement the only one type driver as provider driver.
>> But, extcon implement the two type driver of both extcon provider and extcon client driver.
>> The extcon is similiar with regulator and clock framework as resource.
>>
>> extcon provider driver to provider the event when the state of external connector is changed.
>> - devm_extcon_dev_register()
>> - e.g., almost extcon provider driver are included in 'drivers/extcon/' directory.
> 
> I understand, but that does not change my first argument, that the usb-phy is not
> a MFD device. And although it may be desirable to keep extcon provider drivers
> in the drivers/extcon, there are no technical reasons to do so.
> 
> The whole reason why Kishon asked me to start using the extcon framework is to avoid
> adding a private API to the phy-sun4i-usb code for notifying the musb-sunxi code
> about otg-id-pin status changes. Adding a separate driver for just the extcon bits
> means re-adding a private api to the phy-sun4i-usb code but this time for the
> extcon code, at which point we might just as well skip extcon and have the
> musb-sunxi glue code call directly into the phy-sun4i-usb code...
> 
> Needing a private API for a separate extcn driver actually is a good argument to
> NOT have a separate extcon driver and keep the extcon code in the phy-sun4i-usb code,
> where as I see no technical arguments in favor of a separate extcon driver.

There is one technical issue.

The extcon_set_cable_state() should be handled by extcon provider driver.
because extcon_set_cable_state() inform the extcon client driver of the event
when detecting the change of h/w line (gpio line) or register of peripheral device.

But, extcon client driver can now get the instance of extcon_dev structure
by extcon_get_edev_by_phandle() and then can change the cable state by using the extcon_set_cable_state().

I think that these issue have to be protected by framework level.

Thanks,
Chanwoo Choi
