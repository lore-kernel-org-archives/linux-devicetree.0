From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Sat, 21 Feb 2015 00:31:36 -0600
Message-ID: <alpine.DEB.2.10.1502210029200.2346@shineypoop>
References: <20150113222450.GA17475@obsidianresearch.com>
 <alpine.DEB.2.02.1501150936390.16760@linuxheads99>
 <20150115184726.GA23247@obsidianresearch.com>
 <20150115204502.591bca1d@lxorguk.ukuu.org.uk>
 <A3B5BC9B-EB88-4C0E-B235-E9C86D23DC34@konsulko.com>
 <20150121160151.453ba403@lxorguk.ukuu.org.uk>
 <D466D9FF-25DA-4765-9469-128733BEBC4D@konsulko.com>
 <20150121202700.GB4942@obsidianresearch.com> <20150215224006.GA5626@amd>
 <54E37569.80508@landley.net> <20150217191727.GA18429@amd>
 <0440c296085f48918e07134b07690a08@BY2FFO11FD028.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <0440c296085f48918e07134b07690a08@BY2FFO11FD028.protection.gbl>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Ming Lei <ming.lei@canonical.com>, Michal Simek <michal.simek@xilinx.com>
Cc: mark.rutland@arm.com, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, linux-doc@vger.kernel.org, rubini@gnudd.com, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, hpa@zytor.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, kyle.teske@ni.com, Grant Likely <grant.likely@linaro.org>, davidb@codeaurora.org, Linus Walleij <linus.walleij@linaro.org>, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, galak@codeaurora.org, Mark Brown <broonie@kernel.org>, philip@balister.org, dinguyen@opensource.altera.com, Michal Simek <monstr@monstr.eu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yvanderv@opensource.altera.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@ti.com>, Alan
List-Id: devicetree@vger.kernel.org

On Thu, 19 Feb 2015, Michal Simek wrote:

> On 02/17/2015 08:17 PM, Pavel Machek wrote:
> > On Tue 2015-02-17 11:07:53, Rob Landley wrote:
> >>
> >>
> >> On 02/15/2015 04:40 PM, Pavel Machek wrote:
> >>> On Wed 2015-01-21 13:27:00, Jason Gunthorpe wrote:
> >>>> On Wed, Jan 21, 2015 at 06:33:12PM +0200, Pantelis Antoniou wrote:
> >>>> My point is that the current firmware layer is overly cautious and
> >>>> FPGAs are very big. My current project on small Xilinx device has a
> >>>> 10MB programming file. The biggest Xilinx device today has a max
> >>>> bitfile size around 122MB.
> >>>>
> >>>> So keeping that much memory pinned in the kernel when I can prove it
> >>>> is uncessary for my system (either because there is no suspend/resume
> >>>> possibility, or because I know the CPU can always access the
> >>>> filesytem) is very undesirable.
> >>>
> >>> Well, your current device aalso has 1GB RAM, no?
> >>
> >> Unnecessarily pinning 10% of your ram is a good solution?
> > 
> > Never said that. But I'd rather have _some_ API proposed, then try to
> > design in everthing including kitchen sink and do nothing.
> 

I propose an extension to the firmware class:

int request_firmware_streamed(const struct firmware **firmware_p,
                              const char *name,
                              struct device *device,
                              int (*consumer)(char *buf,
                                              size_t size,
                                              void *priv))

This is a new function that streams the firmware file in 4k chunks to
a callback function.  So firmware is not limited to the allocation
size of vmalloc.

This new function would have the same parameters as request_firmware except
adding a pointer to a consumer function.  In the case of fpga's, the
consumer function is writing the 4k chunks to the fpga.

The new function will:
 * open the file
 * read 4k
 * hand that buffer to the consumer
 * sleep until the consumer returns
 * give up if consumer has a nonzero exit, continue reading otherwise

Admittedly this is really different from the current firmeware class's
structures.

The real problem this is trying to solve is that bitstreams can be huge,
especially as fpga's can be daisychained.  And the CPU doing the loading
could be embedded (limited resources).  IFAIK fpga's don't need to have
the whole image in a ram buffer.

This gives us the convenience of request_firmware() and gives the kernel an
extension of the firmware class that others might useful instead of solving
this problem that we keep hovering around for fpga's only.

Alan Tull
