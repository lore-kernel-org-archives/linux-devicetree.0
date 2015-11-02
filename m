From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] devicetree: add Sigma Designs vendor prefix
Date: Mon, 2 Nov 2015 14:15:50 -0600
Message-ID: <CAL_Jsq+JF7t2f92d=soV5vQZq6cK5nTV+t3KSALuOHh-qhW7MA@mail.gmail.com>
References: <1443806507-12061-1-git-send-email-mans@mansr.com> <56373009.3050306@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56373009.3050306-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 2, 2015 at 3:42 AM, Mason <slash.tmp-GANU6spQydw@public.gmane.org> wrote:
> On 02/10/2015 19:21, Mans Rullgard wrote:
>
>> Add the "sigma" vendor prefix for Sigma Designs, Inc.
>>
>> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index 82d2ac9..ea77ee5 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -192,6 +192,7 @@ schindler Schindler
>>  seagate      Seagate Technology PLC
>>  semtech      Semtech Corporation
>>  sharp        Sharp Corporation
>> +sigma        Sigma Designs, Inc.
>>  sil  Silicon Image
>>  silabs       Silicon Laboratories
>>  siliconmitus Silicon Mitus, Inc.
>
> Hello,
>
> How can I determine whether this patch has been applied?
>
> (I examined a few branches in Rob's tree.)

I've now applied it.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
