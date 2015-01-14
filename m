From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Wed, 14 Jan 2015 15:58:15 +0000
Message-ID: <20150114155815.41e0680b@lxorguk.ukuu.org.uk>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <1420575219-27061-3-git-send-email-atull@opensource.altera.com>
 <20150107084819.GA1887@amd>
 <alpine.DEB.2.02.1501091302370.30067@linuxheads99>
 <20150109205643.GA5761@amd>
 <20150112210134.687176ed@lxorguk.ukuu.org.uk>
 <20150112214314.GA18610@obsidianresearch.com>
 <20150113162847.2778b5a5@lxorguk.ukuu.org.uk>
 <027665D5-EB1F-47D1-B727-FE236C009FA7@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <027665D5-EB1F-47D1-B727-FE236C009FA7@konsulko.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, hpa@zytor.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, Michal Simek <michal.simek@xilinx.com>, kyle.teske@ni.com, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Grant Likely <grant.likely@linaro.org>, davidb@codeaurora.org, Linus Walleij <linus.walleij@linaro.org>, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, atull <atull@opensource.altera.com>, galak@codeaurora.org, Mark Brown <broonie@kernel.org>, philip@balister.org, dinguyen@opensource.altera.com, Michal Simek <monstr@monstr.eu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yvanderv@opensource.altera.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Felipe
List-Id: devicetree@vger.kernel.org

> Those people have failed to show up and provide input and/or code.

That doesn't excuse failing to design the code properly.

> 
> >> It is one thing to context switch a maths algorithm that is built to
> >> be stateless, it is quite another to context switch between, say an
> >> ethernet core with an operating Linux Net driver doing DMA and a maths
> >> algorithm.
> > 
> > And people already do it with thins like maths algorithms.
> > 
> 
> Again those people have failed to show up and provide input and/or code.

Actually there is a whole academic world out there, lots of papers and
research OS code including Linux based bits. 

> We have a lot of well known use cases that this patchset addresses
> satisfactorily. The possible users of the cases you point out are 
> welcome to provide input and working code to address their needs.

So you want to shove crap in the kernel with a broken ABI someone (no
doubt not you) will have to keep maintained forever ?
 
> At this point in time, no-one has showed up; is there a reason for
> this needed capability to be delayed in order to address something
> that no-one has expressed interest for?

I'm not suggesting it's delayed - I'm suggesting its designed properly in
the first place.

We know the kind of use cases that are coming. Designing in complete
ignorance of them is just stupidity.

Atul wants to put something in staging, and grow it from there. That's
not delaying it, but trying to get it done right.

Alan
