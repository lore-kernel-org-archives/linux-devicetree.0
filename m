From: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] mtd: hisilicon: add device tree binding documentation
Date: Mon, 01 Dec 2014 21:07:52 +0800
Message-ID: <547C6828.6010702@gmail.com>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com> <1415105221-7732-3-git-send-email-wangzhou.bry@gmail.com> <20141130090106.GF3608@norris-Latitude-E6410>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141130090106.GF3608@norris-Latitude-E6410>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014=E5=B9=B411=E6=9C=8830=E6=97=A5 17:01, Brian Norris wrote:
> One more thing:
>
> On Tue, Nov 04, 2014 at 08:47:01PM +0800, Zhou Wang wrote:
>> diff --git a/Documentation/devicetree/bindings/mtd/hisi504-nand.txt =
b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
>> new file mode 100644
>> index 0000000..c8b3988
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
>> @@ -0,0 +1,40 @@
>> +Hisilicon Hip04 Soc NAND controller DT binding
>> +
>> +Required properties:
>> +- compatible:          Should be "hisilicon,504-nfc".
>
> I notice you use "NFC" naming throughout. I know others have had
> complaints about overloading the acronym NFC which sometimes means "N=
ear
> Field Communication", instead of the intended "NAND Flash Controller.=
"
> Is there any kind of naming convention within Hisilicon documentation
> that insists on calling this NFC, or can we avoid that confusing name=
?
>
> If possible, I'd suggest "hisilicon,504-nand" as an alternative.
>

I think that is a good idear to call "hisilicon,504-nand", in fact, at
the beginning, I also confused with the name "nfc".

> Brian
>

Thanks,
Zhou Wang


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
