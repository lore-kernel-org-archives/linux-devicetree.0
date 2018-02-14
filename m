From: Daniel Schultz <d.schultz-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: rockchip: phycore: Remove 1.8 GHz operation
 point
Date: Wed, 14 Feb 2018 16:32:44 +0100
Message-ID: <a8de3d85-c4e6-eed6-d2e3-6d9b7318a9c2@phytec.de>
References: <1518515074-22526-1-git-send-email-d.schultz@phytec.de>
 <7871181.EPqc8gR4GV@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7871181.EPqc8gR4GV@diego>
Content-Language: de-DE
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On 02/14/2018 09:07 AM, Heiko Stübner wrote:
> Am Dienstag, 13. Februar 2018, 10:44:32 CET schrieb Daniel Schultz:
>> Rockchip recommends to run the CPU cores only with operations points of
>> 1.6 GHz or lower.
>>
>> Removed the cpu0 node with too high operation points and use the default
>> values instead.
>>
>> Signed-off-by: Daniel Schultz <d.schultz-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
> applied all 3 for 4.17
>
Thanks! I think I should have mentioned this earlier, but can you please add
     ARM: dts: rockchip: phycore: Remove 1.8 GHz operation point
to the stable tree v4.14?

-- 
Mit freundlichen Grüßen,
With best regards,
   Daniel Schultz

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
