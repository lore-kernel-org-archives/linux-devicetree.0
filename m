From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 4/8] Documentation: devicetree: Document Tronsmart vendor
 prefix
Date: Tue, 1 Mar 2016 12:53:55 +0100
Message-ID: <56D582D3.3040902@suse.de>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
 <1456789465-2962-5-git-send-email-afaerber@suse.de>
 <56D57EED.1090901@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D57EED.1090901-IBi9RG/b67k@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am 01.03.2016 um 12:37 schrieb Matthias Brugger:
> On 01/03/16 00:44, Andreas F=C3=A4rber wrote:
>> Choose the obvious prefix, "tronsmart".
>>
>> Cc: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>> ---
>=20
> Same as a older patch I send some month ago. So also this is a trivia=
l
> one, for the record:
>=20
> Singed-off-by: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>

Hm, I see yours got an Acked-by from Rob on Jan 17. Through whose queue
is this supposed to go?

Searching for it, I even found a similar 2014 patch from Beniamino
Galvani (CC'ed), without any review replies.

I'll happily pick up one of the previous patches instead. Sorry, was in
a hurry to clean this series up for Nicolas (Mini Mx) and to avoid any
Odroid-C2 users duplicating my work.

Cheers,
Andreas

>>   Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index f871e8e7e98f..662edc7bce04 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -243,6 +243,7 @@ toshiba    Toshiba Corporation
>>   toumaz    Toumaz
>>   tplink    TP-LINK Technologies Co., Ltd.
>>   tronfy    Tronfy
>> +tronsmart    Tronsmart
>>   truly    Truly Semiconductors Limited
>>   upisemi    uPI Semiconductor Corp.
>>   urt    United Radiant Technology Corporation

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton; HRB 21284 (AG=
 N=C3=BCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
