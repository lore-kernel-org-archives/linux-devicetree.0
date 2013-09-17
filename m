From: Olof Johansson <olof@lixom.net>
Subject: Re: "memory" binding issues
Date: Tue, 17 Sep 2013 14:33:51 -0700
Message-ID: <CAOesGMjt6RsvYRjXxpB=v-Ro6iyUN=YzkDd1mfHqCDJJDRJvLg@mail.gmail.com>
References: <1379300274.4098.77.camel@pasglop>
	<5238C4D1.6060500@gmail.com>
	<CAOesGMh0F09OAR4bepGSCE5Z5OZ56fBmDPBSfwZ+NB9RgcE0Vw@mail.gmail.com>
	<2179723.s3DLWi0P8b@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2179723.s3DLWi0P8b@flatron>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: frowand.list@gmail.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Warren <swarren@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 17, 2013 at 2:19 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Tuesday 17 of September 2013 14:15:52 Olof Johansson wrote:
>> On Tue, Sep 17, 2013 at 2:08 PM, Frank Rowand <frowand.list@gmail.com>
> wrote:
>> > On 9/17/2013 9:43 AM, Olof Johansson wrote:
>> >> On Tue, Sep 17, 2013 at 09:56:39AM +0200, Tomasz Figa wrote:
>> >>> I'm afraid that I must disagree. For consistency I'd rather go with
>> >>> what Ben said. Please see ePAPR chapter 2.2.1.1, which clearly
>> >>> defines how nodes should be named.
>> >>
>> >> 2.2.1.1 is there to point out that unit address _has_ to reflect reg.
>> >>
>> >> 2.2.3 says that unit addresses can be omitted.
>> >
>> > 2.2.3 is talking about path names.
>> >
>> > 2.2.1.1 is talking about node names.
>> >
>> > 2.2.1.1 _does_ require the unit address in the node name, 2.2.3 does
>> > not remove that requirement.
>>
>> Sigh, that's horrible. OF clearly doesn't require it.
>>
>> I guess people prefer to follow ePAPR even though it's broken? That
>> means someone needs to cleanup the current dts files. Any takers?
>
> I don't think it's broken, why do you think so? It's at least consistent.
> Probably not perfect and not complete, but IMHO a reasonable base for
> further work. (Also at least something written down that people can learn
> from and/or refer to.)

So, I stand corrected. It seems that at least one legacy system I'm
looking at always specifies unit address as well. I don't like it but
I'll stop arguing.

Ben: The interesting part is that it does _not_ specify it on /memory
though. Nor, of course, on /cpus or /openprom. So assuming /memory@0
exists will break even on some powerpc platforms.


-Olof
