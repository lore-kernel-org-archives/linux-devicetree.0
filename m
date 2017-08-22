From: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: net: bluetooth: Add
 broadcom-bluetooth
Date: Tue, 22 Aug 2017 22:27:43 +0200
Message-ID: <4c23bcb6-1b90-c41e-6e47-7d8315e760ae@gmail.com>
References: <1501576704-26423-1-git-send-email-loic.poulain@gmail.com>
 <20170822074726.e424lflqxn6mb4xd@flea.lan>
 <f2fcf522-cd1e-e748-0ee7-ad28bbf8ae5d@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f2fcf522-cd1e-e748-0ee7-ad28bbf8ae5d-eS4NqCHxEME@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org, johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

>> Thanks a lot for working on that, I've made a similar attempt a few
>> weeks ago but didn't manage to get it to work.
>>
>> The way it's hooked in our boards is a bit more complex though, even
>> if it could be because we're using a different part.
>>
>> In order to get it running we need:
>>    - two clocks, called in the broadcom datasheets lpo and tcxo.
>>    - three GPIOs, device wakeup, host wakeup and a shutdown GPIO (which
>>      might be the BT_ON you were discussing about)
>>    - two regulators called vbat and reg-en for us (I guess they're
>>      meant to power the chip, and its registers >>
>> Do you know if you're also using those? Or could it be that it's just
>> hardwired to some non-gatable crystal / regulator on the RPI?

Not on Pi3, but the three gpios and the clock are pretty common for
Broadcom bt controller (cf v4 of dt-bindings patch).

This is already partially supported in the hci_bcm driver.
Today this driver registers a platform_driver(legacy/ACPI) and a
serdev_device_driver (new/DT).

The platform driver retrieves the gpios and mainly uses them in pm ops.
Once the ACPI for serdev will be supported, this plat driver should be
removed.

The serdev driver does no support this yet because I used the RPi3
as dev platform. But this is something we want to have as well.

> 
> unfortunately the Foundation doesn't provide the full schematics for RPI 
> 3 or RPI Zero W (which uses the same chip).
> 
> Please also take a look at the RPI Zero W device tree sources, which 
> describe the wifi part of the chip [1]. It contains a line called WL_ON 
> on gpio41 and the low power clock on gpio43.

Regards,
Loic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
