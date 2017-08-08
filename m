From: Marcel Holtmann <marcel-kz+m5ild9QBg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 3/3] Bluetooth: hci_bcm: Add serdev support
Date: Tue, 8 Aug 2017 06:47:18 +0200
Message-ID: <52A773C0-3783-4A49-9F4F-0863F79B17F6@holtmann.org>
References: <1501576704-26423-1-git-send-email-loic.poulain@gmail.com>
 <1501576704-26423-3-git-send-email-loic.poulain@gmail.com>
 <696124D4-A5DA-46FA-A0F0-5DC74363BD23@holtmann.org>
 <444254163.121186.1501874785594@email.1und1.de>
 <51D602E3-B21A-402B-A1F5-6241D55448E9@holtmann.org>
 <1498038890.121361.1501875841550@email.1und1.de>
 <BB04C3A8-2BFC-44B7-AA84-E0B81F560B8C@holtmann.org>
 <653244764.121525.1501876203800@email.1und1.de>
 <A997C486-989A-4040-9871-773A858D8410@holtmann.org>
 <87o9rr10qy.fsf@eliezer.anholt.net>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87o9rr10qy.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Johan Hedberg <johan.hedberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, "open list:BLUETOOTH DRIVERS" <linux-bluetooth-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Eric,

>>>>>>>>> Add basic support for Broadcom serial slave devices.
>>>>>>>>> Probe the serial device, retrieve its maximum speed and
>>>>>>>>> register a new hci uart device.
>>>>>>>>> 
>>>>>>>>> Tested/compatible with bcm43438 (RPi3).
>>>>>>>>> 
>>>>>>>>> Signed-off-by: Loic Poulain <loic.poulain-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>>>>>> ...
>>>>>>>>> 
>>>>>>>>> +static int bcm_serdev_probe(struct serdev_device *serdev)
>>>>>>>>> +{
>>>>>>>>> +	struct bcm_bt_device *bcmdev;
>>>>>>>>> +	u32 speed;
>>>>>>>>> +	int err;
>>>>>>>>> +
>>>>>>>>> +	bcmdev = devm_kzalloc(&serdev->dev, sizeof(*bcmdev), GFP_KERNEL);
>>>>>>>>> +	if (!bcmdev)
>>>>>>>>> +		return -ENOMEM;
>>>>>>>>> +
>>>>>>>>> +	bcmdev->hu.serdev = serdev;
>>>>>>>>> +	serdev_device_set_drvdata(serdev, bcmdev);
>>>>>>>>> +
>>>>>>>>> +	err = of_property_read_u32(serdev->dev.of_node, "max-speed", &speed);
>>>>>>>>> +	if (!err)
>>>>>>>>> +		bcmdev->hu.oper_speed = speed;
>>>>>>>>> +
>>>>>>>>> +	return hci_uart_register_device(&bcmdev->hu, &bcm_proto);
>>>>>>>>> +}
>>>>>>>> 
>>>>>>>> We do not need any GPIO for reset lines or anything else for the rPI3?
>>>>>>>> 
>>>>>>> 
>>>>>>> unfortunately we don't have full schematics for RPI3, but according to firmware dt-blob.dts [1] there is a GPIO called BT_ON. This GPIO is controlled by the GPIO expander on the RPI3 board. The necessary driver for this expander is still out of tree (last mainlining attempt [2]).
>>>>>> 
>>>>>> so who handles this GPIO then right now (or any other GPIO for that matter)? I have seen Bluetooth being enabled and operational, but I really want to get this working in a plain upstream Fedora and without using hciattach or btattach.
>>>>> 
>>>>> The GPU firmware enables the GPIO and keeps this state. The mentioned expander driver should provide the ARM core (Linux) the necessary control.
>>>> 
>>>> what is the default behavior after reboot. BT_ON enabled or not?
>>> 
>>> AFAIK: enabled
> 
> Correct: it's enabled by the 2nd stage bootloader and never modified
> From there.

so I do not have Bluetooth working with a Fedora 26 upstream kernel. I can not figure out what extra is needed to make the Bluetooth chip respond. Is there a simple way to check the status of the BT_ON GPIO (with the lacking GPIO expander code).

>> that would be a funny default since it means that it consumes power
>> even if Bluetooth is never used. We really want to hook this up into
>> the Bluetooth power control of the controller. So that on power down
>> it also disables it and saves as much power as possible.
> 
> We would need a driver to talk to the firmware for the GPIO expander to
> turn it off.  I wrote one last year, but my motivation got killed by DT
> bikeshedding.

If we get the GPIO expander code upstream, I wonder if we can make BT_ON disabled by default. The hci_bcm could in theory turn it back off if the Bluetooth controller doesn’t get enabled, but it would require the Bluetooth driver to be at least loaded. While for now it is easiest to have BT_ON enabled, but if you really don’t want Bluetooth it seems kinda wasteful.

In addition we would need to know if the Bluetooth firmware needs to be reloaded after every BT_ON toggle. Normally there is an additional BT_RST reset line, but that seems to be missing in the rPI3 design.

Also all these hacks with miniuart and switching the console from ttyAMA0 to ttyS0 is totally weird to me. The Raspbian side of things seems to have hacked a bunch of things to make this work, but we really need to use serdev for Bluetooth devices like this and also have the power control of these done by the Bluetooth driver.

So what would it take to get this all working upstream so it can trickle down into a Fedora kernel?

Regards

Marcel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
