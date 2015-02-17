From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Tue, 17 Feb 2015 11:12:19 -0700
Message-ID: <20150217181219.GA27658@obsidianresearch.com>
References: <alpine.DEB.2.02.1501131455130.30192@linuxheads99>
 <20150113222450.GA17475@obsidianresearch.com>
 <alpine.DEB.2.02.1501150936390.16760@linuxheads99>
 <20150115184726.GA23247@obsidianresearch.com>
 <20150115204502.591bca1d@lxorguk.ukuu.org.uk>
 <A3B5BC9B-EB88-4C0E-B235-E9C86D23DC34@konsulko.com>
 <20150121160151.453ba403@lxorguk.ukuu.org.uk>
 <D466D9FF-25DA-4765-9469-128733BEBC4D@konsulko.com>
 <20150121202700.GB4942@obsidianresearch.com>
 <20150215224006.GA5626@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150215224006.GA5626@amd>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, atull <atull@opensource.altera.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, hpa@zytor.com, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, robh+dt@kernel.org, Grant Likely <grant.likely@linaro.org>, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, philip@balister.org, rubini@gnudd.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, Felipe Balbi <balbi@ti.com>, m.chehab@samsung.com, davidb@codeaurora.org, Rob Landley <rob@landley.net>, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, Andrew Morton <akpm@linux->
List-Id: devicetree@vger.kernel.org

On Sun, Feb 15, 2015 at 11:40:06PM +0100, Pavel Machek wrote:

> > So keeping that much memory pinned in the kernel when I can prove it
> > is uncessary for my system (either because there is no suspend/resume
> > possibility, or because I know the CPU can always access the
> > filesytem) is very undesirable.
> 
> Well, your current device aalso has 1GB RAM, no?

No, certainly not. 256MB - the board only has space for two x16 DDR3
chips, and at design time 1GBit was about the biggest that could be
reasonably obtained.

It is also using a Zynq chip for management and the next firmware spin
is likely to throw away 50% of that space to enable Xilinx's narrow ECC
scheme on the ram.

The Linux environment requires only about 40M of ram for runtime, as
it was designed for systems with only 64M of ram, so even the 128M is
overkill.

Jason
