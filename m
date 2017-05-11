From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] of: remove extraneous 'const' in typedef
Date: Thu, 11 May 2017 10:13:18 -0500
Message-ID: <CAL_Jsq+ZRaWbMxDBvZ36qnjECTGpc19oK_ZoEZJ3gkoQSw=VFw@mail.gmail.com>
References: <20170511122458.3862716-1-arnd@arndb.de> <CAL_JsqJxubj3Swe7qr7sU8xJbQJRcK17LYKpDhN4DsF-yg7cHg@mail.gmail.com>
 <CAK8P3a3YNqUrV1eREJ4eZaULO-+A2EnTg+2s7RUNd77F0d9wng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a3YNqUrV1eREJ4eZaULO-+A2EnTg+2s7RUNd77F0d9wng@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 11, 2017 at 10:03 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, May 11, 2017 at 4:44 PM, Rob Herring <robh+dt@kernel.org> wrote:
>> On Thu, May 11, 2017 at 7:24 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>>> One change that was meant to address a sparse warning turned out
>>> to cause hundreds of new gcc-7 warnings:
>>
>> I guess you are the only one on gcc-7.
>
> It was just released last week or so. I actually had been using it for
> a while but accidentally disabled a lot of the warning output until now
> some others started using it too and asked me about it.
>
>>> include/linux/of_irq.h:11:13: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
>>>
>>> After reverting the change, the gcc warnings are gone again, and I
>>> can't reproduce the sparse warnings either.
>>
>> Humm, maybe different sparse versions? I'm on 0.5.0.
>
> I have v0.5.0-183-gfbbfc73. To clarify, I did not get a sparse warning after my
> patch, I did not try reverting your patch first.

Indeed, the warnings are gone with current sparse from git.

Rob
