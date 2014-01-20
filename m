From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: add rockchip vendor prefix
Date: Mon, 20 Jan 2014 08:49:11 -0600
Message-ID: <CAL_JsqLwsJkCbu7rZDGTquryFzom4K4hg3GrczifbAV+pvpcaQ@mail.gmail.com>
References: <201312201626.48119.heiko@sntech.de>
	<2229282.4AAJ7iLdU7@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2229282.4AAJ7iLdU7@phil>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 20, 2014 at 8:23 AM, Heiko St=FCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrot=
e:
> Am Freitag, 20. Dezember 2013, 16:26:47 schrieb Heiko St=FCbner:
>> It seems I forgot to add the vendor prefix for rockchip to the vendo=
r-prefix
>> list. Therefore add it now.
>>
>> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
>
> not sure, where this should go through
> arm-soc? or is there a special dt-tree around?

Sorry, missed this one. I'll apply for 3.14.

Rob

>
>
> Thanks
> Heiko
>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.txt |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> b/Documentation/devicetree/bindings/vendor-prefixes.txt index
>> ca2c190..2dc3b75 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -65,6 +65,7 @@ ralink      Mediatek/Ralink Technology Corp.
>>  ramtron      Ramtron International
>>  realtek Realtek Semiconductor Corp.
>>  renesas      Renesas Electronics Corporation
>> +rockchip     Fuzhou Rockchip Electronics Co., Ltd
>>  samsung      Samsung Semiconductor
>>  sbs  Smart Battery System
>>  schindler    Schindler
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
