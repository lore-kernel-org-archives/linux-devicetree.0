From: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Wed, 12 Jun 2019 07:42:42 -0300
Message-ID: <20190612074242.53a4cf56@coco.lan>
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
        <20190612034813.GA32652@zn.tnic>
        <08bd58dc0045670223f8d3bbc8be774505bd3ddf.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <08bd58dc0045670223f8d3bbc8be774505bd3ddf.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>, "Hawa, Hanna" <hhhawa@amazon.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Hanoch, Uri" <hanochu@amazon.com>
List-Id: devicetree@vger.kernel.org

Em Wed, 12 Jun 2019 18:29:26 +1000
Benjamin Herrenschmidt <benh@kernel.crashing.org> escreveu:

> On Wed, 2019-06-12 at 05:48 +0200, Borislav Petkov wrote:
> > On Wed, Jun 12, 2019 at 08:25:52AM +1000, Benjamin Herrenschmidt wrote:  
> > > Yes, we would be in a world of pain already if tracepoints couldn't
> > > handle concurrency :-)  
> > 
> > Right, lockless buffer and the whole shebang :)  
> 
> Yup.
> 
> > > Sort-of... I still don't see a race in what we propose but I might be
> > > missing something subtle. We are talking about two drivers for two
> > > different IP blocks updating different counters etc...  
> > 
> > If you do only *that* you should be fine. That should technically be ok.  
> 
> Yes, that' the point.

I don't think the EDAC core has any troubles with concurrency. 

As far as I remember, the hacks we had to do at x86 world are due to 
concurrency at the hardware side: having two RAS codes (either between
a driver and BIOS APEI/GHES or between two drivers) accessing the same 
set of MCA registers doesn't work at the Intel chipsets I'm aware of.

> 
> > I still think, though, that the sensible thing to do is have one
> > platform driver which concentrates all RAS functionality.   
>

> I tend to disagree here. We've been down that rabbit hole in the past
> and we (Linux in general) are trying to move away from that sort of
> "platform" overarching driver as much as possible.

Without entering on ARM-specific architecture design, I tend to agree
with the principle that different hardware components would use different
RAS drivers, provided that they use the already existing RAS cores.

Up to some extend, we have already multiple RAS drivers right now.

Besides EDAC/MCE, there are for example, PCIe errors that can come via 
AER. Network drivers also report errors using different mechanisms.
I know a person that it is interested on working on an implementation
to collect disk errors using a trace-based error report mechanism.

So, at the end of the day, different errors may come from different
drivers using different non-overlapping error mechanisms.

That's said, from the admin PoV, it makes sense to have a single
daemon that collect errors from all error sources and take the
needed actions.

> 
> > It is the
> > more sensible design and takes care of potential EDAC shortcomings and
> > the need to communicate between the different logging functionality,
> > as in, for example, "I had so many errors, lemme go and increase DRAM
> > scrubber frequency." For example. And all the other advantages of having
> > everything in a single driver.  
> 
> This is a policy. It should either belong to userspace, or be in some
> generic RAS code in the kernel, there's no reason why these can't be
> abstracted. Also in your specific example, it could be entirely local
> to the MC EDAC / DRAM controller path, we could have a generic way for
> EDAC to advertise that a given memory channel is giving lots of errors
> and have memory controller drivers listen to it but usually the EDAC MC
> driver *is* the only thing that looks like a MC driver to begin with,
> so again, pretty much no overlap with L1/L2 caches RAS or PCIe RAS
> etc...

On userspace, I guess there's just the rasdaemon and the old legacy
edac-utils. 

Right now, the rasdaemon doesn't have anything like that, but we keep
integrating new RAS report mechanisms to it (we just added support
this week for network devlink error reports). 

If I had to put a policy like that on userspace, rasdaemon should probably 
be the right place to add it.

Thanks,
Mauro
