MIME-Version: 1.0
In-Reply-To: <CAL_JsqL3z1dqYZ68jtt2coNhM8sbZZWimuCku2mTHWDuS+kj6g@mail.gmail.com>
References: <20170321161958.9658-1-robh@kernel.org>
	<CAOesGMiWFPERPapOLCW4iqSuFWiqesBBjGN0ny6XjzFXNfKr4g@mail.gmail.com>
	<CAL_JsqL3z1dqYZ68jtt2coNhM8sbZZWimuCku2mTHWDuS+kj6g@mail.gmail.com>
Date: Wed, 29 Mar 2017 16:41:38 -0500
Message-ID: <CAL_JsqKUNzQvnpV-0BYOBcKjZgtC+atDBAPUzYtgpOW2Z4T17w@mail.gmail.com>
Subject: Re: [PATCH 0/3] dtc updates for 4.12
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Olof Johansson <olof@lixom.net>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "arm@kernel.org" <arm@kernel.org>
List-ID: <devicetree@vger.kernel.org>



On Tue, Mar 21, 2017 at 2:55 PM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Mar 21, 2017 at 2:15 PM, Olof Johansson <olof@lixom.net> wrote:
>> On Tue, Mar 21, 2017 at 9:19 AM, Rob Herring <robh@kernel.org> wrote:
>>> This series syncs dtc with current mainline. The primary motivation is
>>> to pull in the new checks I've worked on. This gives lots of new
>>> warnings which are turned off by default.
>>>
>>> Arm-soc folks, I've left the PCI checks enabled as they are pretty much
>>> all real errors and there aren't that many (about 1200, but that's lots
>>> of duplicates). I have a patch for some of them.
>>
>> Yay for better warnings!
>>
>> But as with all changes of this kind, when new warnings are introduced
>> please give people some time to remove them without turning them on by
>> default. We had a cycle like that already.
>
> Which I quickly fixed and learned my lesson. That's why I tried
> getting this out earlier as well.
>
>> Main reason is that it becomes too hard to spot new warnings when they
>> come in if the logs are flooded with 1200 existing warnings.
>
> Yeah. Since almost everything is an include, the warnings really multiply.
>
>> How many of them do you have patches for, per chance? If we can see
>> them show up quickly the answer to the above might be a bit different.
>
> Okay, I lied or lost them... It looks like it is 79 unique warnings
> for arm. I'll take a stab at fixing them.

Well, after all the fixes, there's still some false positives, so I'm going to turn off the warnings by default anyway.

Rob
