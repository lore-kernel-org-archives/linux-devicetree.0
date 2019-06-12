From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Wed, 12 Jun 2019 05:48:14 +0200
Message-ID: <20190612034813.GA32652@zn.tnic>
References: <bfbc12fb68eea9d8d4cc257c213393fd4e92c33a.camel@amazon.com>
 <20190531051400.GA2275@cz.tnic>
 <ce01a2bc-7973-5978-b033-a6bdc61b9d4b@amazon.com>
 <32431fa2-2285-6c41-ce32-09630205bb54@arm.com>
 <9a2aaf4a9545ed30568a0613e64bc3f57f047799.camel@kernel.crashing.org>
 <20190608090556.GA32464@zn.tnic>
 <1ae5e7a3464f9d8e16b112cd371957ea20472864.camel@kernel.crashing.org>
 <68446361fd1e742b284555b96b638fe6b5218b8b.camel@kernel.crashing.org>
 <20190611115651.GD31772@zn.tnic>
 <6df5a17bb1c900dc69b991171e55632f40d9426f.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6df5a17bb1c900dc69b991171e55632f40d9426f.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, James Morse <james.morse@arm.com>
Cc: "Hawa, Hanna" <hhhawa@amazon.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Hanoch, Uri" <hanochu@amazon.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 12, 2019 at 08:25:52AM +1000, Benjamin Herrenschmidt wrote:
> Yes, we would be in a world of pain already if tracepoints couldn't
> handle concurrency :-)

Right, lockless buffer and the whole shebang :)

> Sort-of... I still don't see a race in what we propose but I might be
> missing something subtle. We are talking about two drivers for two
> different IP blocks updating different counters etc...

If you do only *that* you should be fine. That should technically be ok.

I still think, though, that the sensible thing to do is have one
platform driver which concentrates all RAS functionality. It is the
more sensible design and takes care of potential EDAC shortcomings and
the need to communicate between the different logging functionality,
as in, for example, "I had so many errors, lemme go and increase DRAM
scrubber frequency." For example. And all the other advantages of having
everything in a single driver.

And x86 already does that - we even have a single driver for all AMD
platforms - amd64_edac. Intel has a couple but there's still a lot of
sharing.

But apparently ARM folks want to have one driver per IP block. And we
have this discussion each time a new vendor decides to upstream its
driver. And there's no shortage of vendors in ARM-land trying to do
that.

James and I have tried to come up with a nice scheme to make that work
on ARM and he has an example prototype here:

http://www.linux-arm.org/git?p=linux-jm.git;a=shortlog;h=refs/heads/edac_dummy/v1

to show how it could look like.

But I'm slowly growing a serious aversion against having this very same
discussion each time an ARM vendor sends a driver. And that happens
pretty often nowadays.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
