From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/3 v4] ARM: bcm2835: Add the Raspberry Pi firmware driver
Date: Thu, 28 May 2015 16:10:24 -0600
Message-ID: <55679250.1040708@wwwdotorg.org>
References: <20150528114500.GP11677@x1> <1432837987-22861-1-git-send-email-eric@anholt.net> <55678BBC.5090507@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55678BBC.5090507-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?Tm9yYWxmIFRyw7hubmVz?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/28/2015 03:42 PM, Noralf Tr=C3=B8nnes wrote:
>=20
> Den 28.05.2015 20:33, skrev Eric Anholt:
>> This gives us a function for making mailbox property channel request=
s
>> of the firmware, which is most notable in that it will let us get an=
d
>> set clock rates.

>> +static int rpi_firmware_remove(struct platform_device *pdev)
>> +{
>> +    struct rpi_firmware *fw =3D platform_get_drvdata(pdev);
>> +
>> +    mbox_free_channel(fw->chan);
>=20
> I guess driver data has to be reset here:
> platform_set_drvdata(pdev, NULL);

The value of the drvdata is irrelevant before the device has probed, or
after it has been removed. Hence, drivers should not manually clear
drvdata. (Many drivers used to, but that code is being purged out).
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
