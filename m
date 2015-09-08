From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH] ARM: dts: sun4i: Add dts file for the
 pov protab2-ips9 tablet
Date: Tue, 8 Sep 2015 09:45:52 +0200
Message-ID: <55EE9230.70209@redhat.com>
References: <1441441319-10658-1-git-send-email-hdegoede@redhat.com>
 <20150906163023.GR31584@lukather> <55ED3739.609@redhat.com>
 <20150907205603.GX31584@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150907205603.GX31584@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 07-09-15 22:56, Maxime Ripard wrote:
> On Mon, Sep 07, 2015 at 09:05:29AM +0200, Hans de Goede wrote:
>>>> +&reg_ldo3 {
>>>> +	/*
>>>> +	 * We need to always power the camera sensor, otherwhise all access
>>>> +	 * to i2c1 is blocked.
>>>> +	 */
>>>> +	regulator-always-on;
>>>> +	regulator-min-microvolt = <2800000>;
>>>> +	regulator-max-microvolt = <2800000>;
>>>> +	regulator-name = "vdd-csi";
>>>> +};
>>>
>>> What is connected on i2c1 ? Just the camera sensor? or it has some
>>> other devices there?
>>
>> The bma250 accelerometer sits there, and the kernel already has a driver
>> for it. That driver needs to have devicetree binding support added, and
>> then we should be able to use the accelerometer.
>
> Ok, so if this regulator is disable, you can't access the other
> devices as well, right?

Right, the controller reports the bus as being stuck.

> Do you know why? Is it the regulator providing
> the pull-up voltage?

I've tried enabling the pull ups on the SoC i2c pins, so I do not think
that it is that, it seems that somehow when not powered the camera sensor is
actively keeping the lines low. Either it has multiple power planes, or
it is using normally-on fet-s between ground and its i2c lines.

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
