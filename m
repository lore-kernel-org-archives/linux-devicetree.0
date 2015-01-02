From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v7 2/4] fpga manager: add sysfs interface document
Date: Fri, 2 Jan 2015 06:12:00 +0100
Message-ID: <20150102051200.GI4873@amd>
References: <1419007551-10040-1-git-send-email-atull@opensource.altera.com>
 <1419007551-10040-3-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1419007551-10040-3-git-send-email-atull@opensource.altera.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: atull@opensource.altera.com
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, broonie@kernel.org, philip@balister.org, dinguyen@opensource.altera.com, monstr@monstr.eu, gregkh@linuxfoundation.org, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsung.com
List-Id: devicetree@vger.kernel.org


> +What:		/sys/class/fpga_manager/<fpga>/firmware
> +Date:		October 2014
> +KernelVersion:	3.18
> +Contact:	Alan Tull <atull@opensource.altera.com>
> +Description:	Name of the FPGA image file to load using firmware class.

This is wrong interface, right? The only use of this string is to pass
it to udev. We should simply pass "fpga-0" as a firware name, and let
udev figure it out, no need to to prepare name in separate component,
then pass it to kernel, which passes it back to udev.

> +What:		/sys/class/fpga_manager/<fpga>/reset
> +Date:		October 2014
> +KernelVersion:	3.18
> +Contact:	Alan Tull <atull@opensource.altera.com>
> +Description:	Write 1 to reset the FPGA

Does 0 need to be written there to pull the fpga out of reset? Is this
a suitable interface?

								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
