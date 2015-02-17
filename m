From: Rob Landley <rob@landley.net>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Tue, 17 Feb 2015 11:07:53 -0600
Message-ID: <54E37569.80508@landley.net>
References: <20150113200032.GA16205@obsidianresearch.com> <alpine.DEB.2.02.1501131455130.30192@linuxheads99> <20150113222450.GA17475@obsidianresearch.com> <alpine.DEB.2.02.1501150936390.16760@linuxheads99> <20150115184726.GA23247@obsidianresearch.com> <20150115204502.591bca1d@lxorguk.ukuu.org.uk> <A3B5BC9B-EB88-4C0E-B235-E9C86D23DC34@konsulko.com> <20150121160151.453ba403@lxorguk.ukuu.org.uk> <D466D9FF-25DA-4765-9469-128733BEBC4D@konsulko.com> <20150121202700.GB4942@obsidianresearch.com> <20150215224006.GA5626@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150215224006.GA5626@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, atull <atull@opensource.altera.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini@gnudd.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, Andrew Morton <akpm@linux-foundation.org>, Linus
List-Id: devicetree@vger.kernel.org



On 02/15/2015 04:40 PM, Pavel Machek wrote:
> On Wed 2015-01-21 13:27:00, Jason Gunthorpe wrote:
>> On Wed, Jan 21, 2015 at 06:33:12PM +0200, Pantelis Antoniou wrote:
>> My point is that the current firmware layer is overly cautious and
>> FPGAs are very big. My current project on small Xilinx device has a
>> 10MB programming file. The biggest Xilinx device today has a max
>> bitfile size around 122MB.
>>
>> So keeping that much memory pinned in the kernel when I can prove it
>> is uncessary for my system (either because there is no suspend/resume
>> possibility, or because I know the CPU can always access the
>> filesytem) is very undesirable.
> 
> Well, your current device aalso has 1GB RAM, no?

Unnecessarily pinning 10% of your ram is a good solution?

> I'd say the general case is "store bitstream in RAM" we can add
> optimalizations later.

We _have_ a firmware loading layer that doesn't store other kinds of
firmware in pinned kernel memory. I guess that was retroactively a bad
idea. As was the "freeing kernel memory" part at the end of boot.

There honestly are small embedded devices. Still. When you have your
DRAM on the SOC instead of as an external chip, a gigabyte is not in the
cards.

If you're saying "Linux should not care about this niche, let's open
ourselves to a new disruptive technology attack with that as its initial
protected base, because the average kernel developer age is about 44 now
and we're not really recruiting anybody younger than that, so we'll all
be dead before we have to care about being replaced"...

Rob

(At $DAYJOB we're building a chip that runs off of induction current to
retrofit monitoring sensors onto things. It currently has 64 megs of ram
but they're trying to trim that _down_ to free up chip space.)
