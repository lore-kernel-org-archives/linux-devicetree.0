MIME-Version: 1.0
In-Reply-To: <20161214214012.GB6947@obsidianresearch.com>
References: <20161212183905.GA30702@obsidianresearch.com>
	<CAL_Jsq+JdmKj88Tp=N+V781qj+muEB6nuGpjDCgiPsrzB9tWMg@mail.gmail.com>
	<20161214214012.GB6947@obsidianresearch.com>
Date: Thu, 15 Dec 2016 08:57:41 -0600
Message-ID: <CAL_Jsq+imhyUz6dWAvNrH1hHA2d+A0Zs+LAXrQS0FMXWuE_9dQ@mail.gmail.com>
Subject: Re: [PATCH] of/platform: depopulate devices in the reverse order of creation
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Grant Likely <grant.likely@secretlab.ca>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Dec 14, 2016 at 3:40 PM, Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:
> On Wed, Dec 14, 2016 at 02:54:02PM -0600, Rob Herring wrote:
>> On Mon, Dec 12, 2016 at 12:39 PM, Jason Gunthorpe
>> <jgunthorpe@obsidianresearch.com> wrote:
>> > If the DT has inter-dependencies, then the devices need to be removed
>> > in the right order to avoid removal problems.
>> >
>> > Assuming the DT is constructed so that EPROBE_DEFER doesn't happen
>> > during creating then a good way to avoid removal problems is reversing
>> > the order during depopulation.
>>
>> I assume you mean by sorting the nodes to get lucky with the init
>> order.
>
> Not quite, the init order doesn't matter, just that the device list/DT
> is ordered topologically. The driver bind order can still be
> randomized. No luck needed.

I meant init in a generic sense
>
>> > In my specific case I have a gpio driver, followed by a i2c bitbang
>> > using that driver. So gpiolib prints an error if it the gpio driver is
>> > removed before the gpio client..
>>
>> Good news, functional dependencies are going into 4.10. Let's fix GPIO
>> and use that.
>
> Sure, but it will be some time until that is used everwhere..
>
> You don't think there is some value in 'hiding' the problem with
> ordering until that work is done? IIRC that was essentially how
> EPROBE_DEFER was introduced?
>
> Jason
