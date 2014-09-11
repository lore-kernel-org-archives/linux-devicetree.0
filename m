From: Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org>
Subject: Re: [PATCH RFC 2/3] ARM: regulator: add Freescale MXS regulator driver
Date: Thu, 11 Sep 2014 07:53:20 +0200
Message-ID: <541138D0.6090808@lategoodbye.de>
References: <1410089869-6611-1-git-send-email-info@lategoodbye.de>	<1410089869-6611-3-git-send-email-info@lategoodbye.de>	<20140909182211.GG3896@leverpostej>	<540F523D.4010904@lategoodbye.de>	<20140910141853.GA4994@leverpostej>	<20140910151316.GG7960@sirena.org.uk>	<54108B34.6010701@lategoodbye.de> <CAOMZO5BEN_DQOyhrx5ZB7y6DoDvqbLvDyJfAabOvtUvKOiGHOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5BEN_DQOyhrx5ZB7y6DoDvqbLvDyJfAabOvtUvKOiGHOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "stefan.wahren-eS4NqCHxEME@public.gmane.org" <stefan.wahren-eS4NqCHxEME@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

Am 10.09.2014 20:54, schrieb Fabio Estevam:
> Hi Stefan,
>
> On Wed, Sep 10, 2014 at 2:32 PM, Stefan Wahren <info-saaNCTdWVBT7BZbvpMY5sg@public.gmane.org> wrote:
>> Hi Mark,
>>
>> Am 10.09.2014 17:13, schrieb Mark Brown:
>>>
>>> On Wed, Sep 10, 2014 at 03:18:53PM +0100, Mark Rutland wrote:
>>>>
>>>> On Tue, Sep 09, 2014 at 08:17:17PM +0100, Stefan Wahren wrote:
>>>
>>>
>>> Ugh, this looks like it might be a regulator driver but since the
>>> subject line was "ARM: " I deleted it unread - if your changelog looks
>>> different to all the other changelogs in the subsystem it probably needs
>>> changing.
>>
>>
>> sorry about the confusion, i will remove ARM in the next version.
>>
>> Changelog? I didn't send a changelog because it was my first version.
>>
>> Should i resend this version only to you?
>
> In the cover letter of this RFC series you mentioned that this has not
> been tested on real hardware.
>
> What about sending a new version of this series (with the RFC prefix
> removed and with Mark Rutland's suggestion implemented) tested on a
> mx28 board and also with the Subject of the regulator patch changed to
> 'regulator: add support for mxs regulator" with Mark Brown on Cc?
>

that's the same idea i had about the first real version of my patch. 
Unfortunately i can do the porting only in my spare time. So i try to 
avoid with the RFC series the situation, that i spend many days in 
development and testing, but after it the regulator guys says it went in 
the complete wrong direction. The advice about the anatop regulator was 
helpful, but there is still some unsureness.

I will try to get a Duckbill, so i can do testing at home.

Thanks

Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
