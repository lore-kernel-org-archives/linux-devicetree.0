From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH] devicetree: bindings: Document Gateworks vendor prefix
Date: Wed, 13 Aug 2014 18:13:35 -0700
Message-ID: <CAJ+vNU1QXMMke+pUy6xbxaYhNqqRivM=_qLpVLPePTQLicj_Zg@mail.gmail.com>
References: <1407658509-1773-1-git-send-email-tharvey@gateworks.com>
	<53E7D325.4060802@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53E7D325.4060802-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Aug 10, 2014 at 1:16 PM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
> Le 10/08/2014 01:15, Tim Harvey a =C3=A9crit :
>
>> Add Gateworks Corporation to the list of device tree vendor prefixes=
=2E
>>
>> Gateworks designs and manufactures single board computers designed f=
or
>> embedded wireless and wired network applications.
>>
>> Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index 46a311e..803fa4f 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -54,6 +54,7 @@ globalscale   Globalscale Technologies, Inc.
>>   gmt   Global Mixed-mode Technology, Inc.
>>   google        Google, Inc.
>>   gumstix       Gumstix, Inc.
>> +gw     Gateworks Corporation
>
>
> I would go with "gateworks" here, "gw" is usually a shorter term for
> "gateway", and there is an actual company called "Gateway" also
> manufacturing various types of computers.
> --
> Florian

Hi Florian,

Well... I got to the table first with Gateworks so I don't see why I
can't take the 'gw' prefix personally. Note that I do have several
devicetree files in arch/arm/dts/imx6-gw*.dts* already in mainline
that use the 'gw' vendor prefix (albeit one could argue that I should
have been asked to add 'gw' to the vendor-prefixes.txt back then, but
that is not the way things went down).

Tim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
