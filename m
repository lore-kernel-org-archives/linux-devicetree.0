From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 2/2] iio: ad5755: Add DT binding documentation
Date: Sat, 11 Jun 2016 18:26:07 +0100
Message-ID: <b55cee8b-2966-d14f-3943-4a848876b43f@kernel.org>
References: <1457705561-12253-1-git-send-email-sean.nyekjaer@prevas.dk>
 <1457705561-12253-2-git-send-email-sean.nyekjaer@prevas.dk>
 <56E3E121.9030400@kernel.org> <56F94A21.6070804@kernel.org>
 <8a7b1dcb-205a-8801-737f-6aa1c39f6605@prevas.dk>
 <8e62350f-ec4c-cba4-fa46-95549a89e720@kernel.org>
 <574AF8EB.9060609@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <574AF8EB.9060609-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 29/05/16 15:12, Lars-Peter Clausen wrote:
> On 05/29/2016 03:57 PM, Jonathan Cameron wrote:
>> On 09/05/16 09:16, Sean Nyekj=E6r wrote:
>>>
>>>
>>> On 2016-03-28 17:13, Jonathan Cameron wrote:
>>>> On 12/03/16 09:28, Jonathan Cameron wrote:
>>>>> On 11/03/16 14:12, Sean Nyekjaer wrote:
>>>>>> Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
>>>>> Looks much better to me.
>>>>>
>>>>> Looking for Acks from Lars and a device tree binding maintainer
>>>>> on this one though.
>>>>> (added CCs)
>>>> Lars?
>>> No response...
>>> Is there anything wrong with this?
>> Given we are early in cycle there is no real rush for this...
>>
>> Lars, let me know if you are going to a while getting to this / any =
other
>> patches I want responses on from you.
>=20
> I don't think this solution is the correct approach, but since I'm no=
t able
> to provide an alternative and everybody else is OK with it, I'm not g=
oing to
> block it either. So go ahead and apply it.

Hmm. I've applied this now.  Perhaps we will revisit in the future and
eventually deprecate this binding in favour of something more generic.

Thanks for your hard work on this Sean. It certainly wasn't a case
with obvious 'right' answers!

Jonathan
>=20
