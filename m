From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Tue, 13 Jan 2015 16:21:33 +0000
Message-ID: <20150113162133.2a4d1116@lxorguk.ukuu.org.uk>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <1420575219-27061-3-git-send-email-atull@opensource.altera.com>
 <20150107084819.GA1887@amd>
 <alpine.DEB.2.02.1501091302370.30067@linuxheads99>
 <20150109205643.GA5761@amd>
 <4D4EA2D5-68DD-49F7-9E2D-3A0A8F6AF9CA@konsulko.com>
 <20150110151118.GA16036@amd>
 <alpine.DEB.2.10.1501111009180.2556@shineypoop>
 <20150112180608.GA11295@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20150112180608.GA11295@obsidianresearch.com>
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
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, hpa@zytor.com, Steffen Trumtrar <s.trumtrar@pengutronix.de>, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, Michal Simek <michal.simek@xilinx.com>, kyle.teske@ni.com, Grant Likely <grant.likely@linaro.org>, davidb@codeaurora.org, Linus Walleij <linus.walleij@linaro.org>, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, atull <atull@opensource.altera.com>, galak@codeaurora.org, Mark Brown <broonie@kernel.org>, philip@balister.org, dinguyen@opensource.altera.com, Michal Simek <monstr@monstr.eu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yvanderv@opensource.altera.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Felipe
List-Id: devicetree@vger.kernel.org

On Mon, 12 Jan 2015 11:06:08 -0700
Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:

> On Sun, Jan 11, 2015 at 10:29:00AM -0600, atull wrote:
> > the FPGA image.  If someone wants there to be only one FPGA image on
> > the FGPA forever, they will probably not be using this framework; their
> > FPGA will probably be loaded before Linux boots up.
> 
> Nonsense, loading the FPGA through Linux is much better

You need both. There are platforms where the FPGA must be loaded to even
boot the OS (for example Linux running an FPGA soft 486 can't run until
the FPGA has the CPU loaded into it.
