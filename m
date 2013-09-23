From: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Subject: Re: [PATCH v3 2/5] ARM: dts: add reference voltage property for MXS
 LRADC
Date: Mon, 23 Sep 2013 15:39:19 +0200
Message-ID: <52404487.4080501@digi.com>
References: <1374501843-19651-1-git-send-email-hector.palacios@digi.com>  <1374501843-19651-3-git-send-email-hector.palacios@digi.com>  <520AA3CD.1040008@kernel.org> <1376491467.18617.41.camel@hornet>  <52153B8E.7050309@free-electrons.com>  <df6d000d-c918-48ec-958c-c8529ae1b75f@email.android.com> <1377190299.2626.9.camel@hornet> <5217E999.7020408@kernel.org> <52403845.5020002@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52403845.5020002-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alexandre,

On 09/23/2013 02:47 PM, Alexandre Belloni wrote:
> Hector,
>
> I'd like to go forward with this and have a chance to see that includ=
ed
> in 3.13. Do you mind if I rework your patch series by removing the DT
> part and then resubmit ?

I don't mind at all. Please go ahead.

>
> Regards,
>
>
> On 24/08/2013 01:00, Jonathan Cameron wrote:
>> On 08/22/13 17:51, Pawel Moll wrote:
>>> On Thu, 2013-08-22 at 07:17 +0100, Jonathan Cameron wrote:
>>>> I would favour option 2 though some of the discussions going on at=
 the moment about
>>>> bindings might result in a generic description of this and any oth=
er bits of
>>>>   analog front end.
>>> Any link to this discussion? devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org doesn't see=
m to
>>> be involved (of course I may have simply missed the thread ;-)
>> Some cc's dropped off the discussion at some point that should have =
been there
>> and the topic has 'wandered' somewhat from where it started.
>>
>> https://lkml.org/lkml/2013/8/21/409
>>
>> and the couple of messages after that are probably the most relevant=
=2E
>>
>> Speaking of which the devicetree list on here was the old one, I've =
just switched
>> to the vger list you suggest above.
>>
>>
>>> Pawe=C5=82
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-iio=
" in
>>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>
>


Best regards,
--
Hector Palacios
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
