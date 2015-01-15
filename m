From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Thu, 15 Jan 2015 20:45:02 +0000
Message-ID: <20150115204502.591bca1d@lxorguk.ukuu.org.uk>
References: <20150107084819.GA1887@amd>
 <alpine.DEB.2.02.1501091302370.30067@linuxheads99>
 <20150109205643.GA5761@amd>
 <20150112210134.687176ed@lxorguk.ukuu.org.uk>
 <20150112214314.GA18610@obsidianresearch.com>
 <20150113162847.2778b5a5@lxorguk.ukuu.org.uk>
 <20150113200032.GA16205@obsidianresearch.com>
 <alpine.DEB.2.02.1501131455130.30192@linuxheads99>
 <20150113222450.GA17475@obsidianresearch.com>
 <alpine.DEB.2.02.1501150936390.16760@linuxheads99>
 <20150115184726.GA23247@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20150115184726.GA23247@obsidianresearch.com>
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
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, atull <atull@opensource.altera.com>, galak@codeaurora.org, broonie@kernel.org, philip@balister.org, dinguyen@opensource.altera.com, monstr@monstr.eu, Pavel Machek <pavel@denx.de>, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, gregkh@linuxfoundation.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.c
List-Id: devicetree@vger.kernel.org

On Thu, 15 Jan 2015 11:47:26 -0700
Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:
> It is a novel idea, my concern would be that embedding the FPGA in the
> DT makes it permanent unswappable kernel memory.
> Not having the kernel hold the FPGA is best for many uses.

If you have a filesysytem before the FPGA is set up then it belongs in
the file system. As you presumably loaded the kernel from somewhere there
ought to be a file system (even an initrd).

> Having the kernel hold the FPGA as a swppable file handle/mmap of some
> sort is next best (obviously the fs must be operating during resume)

For a lot of hardware that gets somewhat hairy because you don't know
what the dependancies between devices are on the resume but yes.

> Unswappable kernel memory is the worst choice

There is another case here - which is where the firmware is somewhere
else physically. For example in PCI ROM space, or flash, but designed to
be loaded by the OS.


> I think to justify the ioctls you need a reason to have the context
> of a FD. sysfs is stateless, so if my process dies the kernel doesn't
> know.

That isn't to say the stateless information doesn't belong in sysfs. Eg
you don't neccessarily want to open the device node and go through ioctls
just for bits of information that are interesting to reporting tools.

(Imagine an 'lsfpga' tool for the kind of things you'd leave in sysfs)

> Identifying the ioctls needed would probably clarify things. My
> rough start would be 
> 
> - Get status: programed, not programmed, error?
>   Bitfile type? (eg Xilinx has nearly every permutation of bit/byte
>   ordering)

That's probably some kind of "what are you" ioctl that returns the
vendor/type information.

> - Hand over to a DT overlay (how does this work?) Lock transfers
>   from FD to kernel

That bit isn't stateful so I would actually have expected something in
the kernel ABI along the lines of 

           request_fpga(blah)

which does

             if in use by user
                    EBUSY
             lock it (all user opens will fail)

and

            release_fpga(blah)

and a sysfs node indicating its busy (and perhaps also what for if the
request_fpga passes a textual name)

> Not sure about partial reconfiguration - clearly the kernel needs to
> know and check that the bitfiles are of the correct family, I wonder
> if the approach should be to program a basis on the FPGA which then
> creates a new FPGA device in the system that can accept the partial
> reconfiguration - this way the locking makes sense, the basis is
> locked by the kernel and devices and the overlay remains
> lockable/swappable/whatever by a dedicated /dev/ node ??

I think so.

If you closed the device you have no idea what happened between the close
and a re-open, therefore you have no idea what the FPGA state is.
 
> Just thinking aloud, I've never had a use case for partial
> reconfiguration.

The API handles it but whether it needs to be there from day one I don't
know.

Alan
