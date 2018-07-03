Return-Path: <SRS0=mM6y=JT=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH v2 0/7] mmc: pxamci: cleanups and minor DT tweaks
References: <20180630181405.17630-1-daniel@zonque.org>
 <CAPDyKFo3CPZaLrfcAX=PLYGEdRzdUKQ0Undw6oOSm4+Hd826Fw@mail.gmail.com>
 <6a2d16d5-2aab-b049-7e66-750ca4f9c102@zonque.org>
 <CAPDyKFp6NM8mwyZQK=2MkVbv3FqV4a_JCvLzjsgRBhZ1NZN85Q@mail.gmail.com>
 <87lgathdak.fsf@belgarion.home>
 <CAPDyKFo=fgZ=Sks6Mh2rA4yt7-WVhJN_vx8PdRHN-qXBnkKypg@mail.gmail.com>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <fc4de35f-f292-6be2-98cd-22f7eb79c5d3@zonque.org>
Date: Tue, 3 Jul 2018 11:23:57 +0200
MIME-Version: 1.0
In-Reply-To: <CAPDyKFo=fgZ=Sks6Mh2rA4yt7-WVhJN_vx8PdRHN-qXBnkKypg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Ulf Hansson <ulf.hansson@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tuesday, July 03, 2018 07:35 AM, Ulf Hansson wrote:
> On 2 July 2018 at 17:23, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>> Ulf Hansson <ulf.hansson@linaro.org> writes:
>>
>>> On 2 July 2018 at 16:43, Daniel Mack <daniel@zonque.org> wrote:
>>>> On Monday, July 02, 2018 04:38 PM, Ulf Hansson wrote:
>>>>>
>>>>> On 30 June 2018 at 20:13, Daniel Mack <daniel@zonque.org> wrote:
>>>> Hmm, applied on top of Robert's patch in [1] (see above)? Without that
>>>> patch, I expect build breakage with this series.
>>>
>>> Right, I drop the series. Thanks for letting me know!
>>>
>>> I think [1] is available from an immutable branch somewhere. I look it
>>> up and merge it before applying this again.
>> Yup, it's here :
>> git fetch https://github.com/rjarzmik/linux.git tags/pxa-for-4.19-dma_slave_map
>>
>> Let it spare a bit of your maintainer time :)
> 
> Thanks. I have pulled the branch and re-applied the series from Daniel.

Great, thank you!


Daniel
