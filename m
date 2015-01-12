From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Mon, 12 Jan 2015 21:01:34 +0000
Message-ID: <20150112210134.687176ed@lxorguk.ukuu.org.uk>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <1420575219-27061-3-git-send-email-atull@opensource.altera.com>
 <20150107084819.GA1887@amd>
 <alpine.DEB.2.02.1501091302370.30067@linuxheads99>
 <20150109205643.GA5761@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20150109205643.GA5761@amd>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Pavel Machek <pavel@denx.de>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, atull <atull@opensource.altera.com>, broonie@kernel.org, philip@balister.org, dinguyen@opensource.altera.com, monstr@monstr.eu, gregkh@linuxfoundation.org, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@davemloft.net, m.chehab@samsun
List-Id: devicetree@vger.kernel.org

> Then configure udev to load right firmware for you, or ln -s
> image-i-want-now socfpga-fpga-image to select the one to read...?

Your conceptual model is wrong. FPGA firmware is dynamic. There are
already people who lazy reload FPGA firmware on taskswitches. This
proposed fpga manager is broken but it's broken in exactly the reverse
direction to the one you are arguing for.

There are plenty of people today who treat the FPGA as an entirely
dynamic resource. It's not like flashing a controller, its near
immediate.

The udev/sysfs model is broken because
- it's too slow for dynamic switching
- it doesn't address permissions
- it doesn't address namespaces
- it doesn't address dynamic management of resources (open/use/close)
  with dyanmic resource recovery on the final close as is the Unix way.

not because FPGA's are some static boot time resource.

If you look at all the academic work on this you see the same kind
of dynamic usage, even more so.

The library API you actually need is much closer to

	/* Get my firmware */
	fw = fpga_openfirmware("foo.fpga");
	/* Get me a suitable FPGA for it */
	fd = fpga_alloc(&w);
	/* Load it */
	fgpa_load(fd, "foo.fpga");

	do_shit(fd);

	fpga_close(fd);

You want to be able to have things like your game just load up an audio
physics engine, lob it into a random fpga, play it, drop it. Likewise
lots of other FPGA apps - video processing for example, crypto, format
convertors, gesture analysers and so on. Think a world where there are
gimp filters that want to just grab an fpga for 3 seconds.

Its completely dynamic and it will get more so as we switch from the
painful world of VHDL and friends to high level parallel aware language
compilers for FPGAs and everyone will be knocking up quick FPGA hacks.

Alan
