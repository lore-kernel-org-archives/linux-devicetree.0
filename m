From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/3 v4] ARM: bcm2835: Add the Raspberry Pi firmware driver
Date: Thu, 28 May 2015 16:09:12 -0600
Message-ID: <55679208.3020509@wwwdotorg.org>
References: <20150528114500.GP11677@x1> <1432837987-22861-1-git-send-email-eric@anholt.net> <5567886F.5080108@wwwdotorg.org> <55678AFC.6020404@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55678AFC.6020404-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Noralf_Tr=F8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/28/2015 03:39 PM, Noralf Tr=F8nnes wrote:
>=20
> Den 28.05.2015 23:28, skrev Stephen Warren:
>> On 05/28/2015 12:33 PM, Eric Anholt wrote:
>>> This gives us a function for making mailbox property channel reques=
ts
>>> of the firmware, which is most notable in that it will let us get a=
nd
>>> set clock rates.
> ...
>>> +int rpi_firmware_property_list(struct device_node *of_node,
>>> +                   void *data, size_t tag_size)
>>> +{
>>> +    struct platform_device *pdev =3D of_find_device_by_node(of_nod=
e);
>> I would expect the of_node -> pdev mapping to happen at client devic=
e
>> probe time. Simplest for this driver would be if the
>> client-probe-time-mapping function returned the "struct rpi_firmware=
"
>> and the client passed that to this function.
>=20
> What if the firmware driver/device is removed or reloaded?
> In that case the client has an invalid pointer. It wouldn't know abou=
t
> the change.

A provider can't be removed if it has clients. So, you'd have to remove
all clients first, then remove the provider. This may require adding
some code to increment/decrement the module use count when clients look
up the provider and are themselves removed.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
