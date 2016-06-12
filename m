From: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v4 0/2] Add a new Rockchip usb2 phy driver
Date: Sun, 12 Jun 2016 09:01:58 +0800
Message-ID: <e04a4ba5-ee22-5d18-1341-ce8c7780eb15@rock-chips.com>
References: <1465290954-15852-1-git-send-email-frank.wang@rock-chips.com>
 <7024078.xQbt7GEvIn@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7024078.xQbt7GEvIn@diego>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 2016/6/8 22:33, Heiko St=C3=BCbner wrote:
> Hi Frank,
>
> Am Dienstag, 7. Juni 2016, 17:15:52 schrieb Frank Wang:
>> The newer SoCs (rk3366, rk3399) of Rock-chip take a different usb-ph=
y
>> IP block than rk3288 and before, and most of phy-related registers a=
re
>> also different from the past, so a new phy driver is required necess=
arily.
>>
>> These series patches add phy-rockchip-inno-usb2.c and the correspond=
ing
>> documentation.
> please see the replies on the v3 thread (regarding handling of multip=
le phy
> blocks) .
>

OK, I just got back from Dragon Boat Festival (one of the great=20
traditions of my nation's festival), I will correct it and send out=20
later today.


BR.
=46rank

>> Changes in v4:
>>   - Used 'phy-supply' instead of 'vbus_*-supply'.
>>
>> Changes in v3:
>>   - Supplemented some hardware-description into the devicetree bindi=
ngs.
>>   - Resolved the mapping defect between fixed value in driver and th=
e
>> property in devicetree.
>>   - Code cleanup.
>>
>> Changes in v2:
>>   - Specified more hardware-description into the devicetree bindings=
=2E
>>   - Optimized some process of driver.
>>
>> Frank Wang (2):
>>    Documentation: bindings: add DT documentation for Rockchip USB2PH=
Y
>>    phy: rockchip-inno-usb2: add a new driver for Rockchip usb2phy
>>
>>   .../bindings/phy/phy-rockchip-inno-usb2.txt        |   62 ++
>>   drivers/phy/Kconfig                                |    7 +
>>   drivers/phy/Makefile                               |    1 +
>>   drivers/phy/phy-rockchip-inno-usb2.c               |  614
>> ++++++++++++++++++++ 4 files changed, 684 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt cre=
ate
>> mode 100644 drivers/phy/phy-rockchip-inno-usb2.c
>
>
>


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
