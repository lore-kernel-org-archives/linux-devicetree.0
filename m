From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Thu, 15 Jan 2015 11:36:17 +0000
Message-ID: <20150115113617.537965b3@lxorguk.ukuu.org.uk>
References: <20150107084819.GA1887@amd>
 <alpine.DEB.2.02.1501091302370.30067@linuxheads99>
 <20150109205643.GA5761@amd>
 <20150112210134.687176ed@lxorguk.ukuu.org.uk>
 <20150112214314.GA18610@obsidianresearch.com>
 <20150113162847.2778b5a5@lxorguk.ukuu.org.uk>
 <20150113200032.GA16205@obsidianresearch.com>
 <alpine.DEB.2.02.1501131455130.30192@linuxheads99>
 <20150113222450.GA17475@obsidianresearch.com>
 <20150114160617.02fb9135@lxorguk.ukuu.org.uk>
 <20150114181258.GB16392@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20150114181258.GB16392@obsidianresearch.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, atull <atull@opensource.altera.com>, galak@codeaurora.org, broonie@kernel.org, philip@balister.org, dinguyen@opensource.altera.com, monstr@monstr.eu, gregkh@linuxfoundation.org, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, Pavel Machek <pavel@denx.de>, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.c
List-Id: devicetree@vger.kernel.org

On Wed, 14 Jan 2015 11:12:58 -0700
Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:

> On Wed, Jan 14, 2015 at 04:06:17PM +0000, One Thousand Gnomes wrote:
> 
> > and I think you effectively have the user usage covered here for such
> > things. It much like GPIO pins - we can describe them but we can also
> > declare they are not visible to the user.
> 
> A missing element in mainline is a kind of VFIO scheme to let user
> space access the FPGA registers designated for user space use.

Agreed entirely.

> A fixed bus interface block and dynamic reconfiguration for the
> remainder is probably the way to manage that. But, that implies that
> even a family of swappable FPGAs will have a DT overlay associated
> with it.

Or some other resource, it could be described by PCI but something is
going to need to describe it when we get to that state and something
will need to set up the IOMMU for it and potentially manage virtualising
it or assigning it to things like docker instances.
 
> Ideally, I could see wanting to have a file format that combines the
> overlay and FPGA bitfile. A loader tool would use the /dev/ interface
> to setup both elements. That would be much more robust than the
> current scheme I see (eg Xilinx) using where the bitfile and DT bit
> live in completely different places and have to be perfectly matched.

yes - there is a model for this in Linux already. Some of the audio
subsystems have "firmware" files distributed which are actually a
structured file that userspace parses to get a real set of firmware for
the controller and a set of descriptions for things like mixer controls.

They have the same basic problem - when you change firmware your control
interfaces may change so you need both descriptions together.

Alan
