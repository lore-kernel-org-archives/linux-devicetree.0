From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] edac: add support for Amazon's Annapurna Labs EDAC
Date: Fri, 14 Jun 2019 12:53:01 +0200
Message-ID: <20190614105301.GB2586@zn.tnic>
References: <9a2aaf4a9545ed30568a0613e64bc3f57f047799.camel@kernel.crashing.org>
 <20190608090556.GA32464@zn.tnic>
 <1ae5e7a3464f9d8e16b112cd371957ea20472864.camel@kernel.crashing.org>
 <68446361fd1e742b284555b96b638fe6b5218b8b.camel@kernel.crashing.org>
 <20190611115651.GD31772@zn.tnic>
 <6df5a17bb1c900dc69b991171e55632f40d9426f.camel@kernel.crashing.org>
 <20190612034813.GA32652@zn.tnic>
 <08bd58dc0045670223f8d3bbc8be774505bd3ddf.camel@kernel.crashing.org>
 <20190612104238.GG32652@zn.tnic>
 <2a53690aa81a406b9a6290f70e47470d0f698f00.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2a53690aa81a406b9a6290f70e47470d0f698f00.camel@kernel.crashing.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: James Morse <james.morse@arm.com>, "Hawa, Hanna" <hhhawa@amazon.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "Woodhouse, David" <dwmw@amazon.co.uk>, "paulmck@linux.ibm.com" <paulmck@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "davem@davemloft.net" <davem@davemloft.net>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Shenhar, Talel" <talel@amazon.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Chocron, Jonathan" <jonnyc@amazon.com>, "Krupnik, Ronen" <ronenk@amazon.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, Hanoch, Uri
List-Id: devicetree@vger.kernel.org

Reply part 2.

On Thu, Jun 13, 2019 at 09:54:18AM +1000, Benjamin Herrenschmidt wrote:
> Why ? Because one or two historical drivers mix MC and PCI then "it
> makes sense" to do that for everybody ?

Because it was like that. And now all of a sudden ARM wants something
different. So we must at least talk about it before we do it, right?

Also, I don't know if you've noticed but RAS "architecture" on Linux is
still a big WIP, to put it mildly. So before we do anything, we should
have at least some rough idea of where it is all going to.

> And then you have 20 platforms and 20 drivers, with 50% or more code
> duplication, bugs fixed in one and not the other, gratuituous behaviour
> differences to confuse users etc... No. that doesn't make sense.

No different on ARM if you have a memory controller IP which is roughly
the same IP but different vendors integrate it and they each tweak it
a bit in their own way (registers, ECC support, etc) and you get an
EDAC MC driver from every vendor and they all don't share the basic
functionality.

> I have no idea what "the DT argument" is, and that's from the guy who
> created the FDT....
> 
> I have difficulties understanding how you cannot see that having re-
> usable single drivers for a single piece of HW makes sense. If anything
> in term of avoiding duplication, bitrot, bugs being fixed in some and
> not others, etc etc... It also means more eyes on a given piece of code
> which is a good thing.
> 
> Also you "have heard more than enough" is again a sign that a whole lot
> of people are trying to tell you something that you seem to refuse to
> hear.

Hmm, I think I'm hearing it. But not without good arguments for why
we're going to do it. I believe that became clear so far..

> Whatever that "DT argument" is, did you just ignore it or had
> some good and solid arguments of your own to refute it ?

I don't care about refuting it or not - all I care about is getting good
arguments for why we should do this driver-per-IP-block thing. EDAC was
was ok so far - I wasn't going to change it just because someone is
sending me drivers per-IP block and not selling me the idea properly.

And AFAIR I haven't heard a single good argument trying to convince me
why it should be done this way. Only after this thread started and we
started poking at it, I got some good arguments.

So enough wasting time, I think we can try the per-IP things and see
where it would get us.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
