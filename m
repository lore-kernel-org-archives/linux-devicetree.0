From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v8 2/4] fpga manager: add sysfs interface document
Date: Sat, 17 Jan 2015 22:11:30 +0100
Message-ID: <20150117211130.GA22044@amd>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1501150936390.16760@linuxheads99>
Sender: linux-doc-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, gregkh@linuxfoundation.org, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, delicious.quinoa@gmail.com
List-Id: devicetree@vger.kernel.org

Hi!

> I'm looking into moving the sysfs interface to debugfs.  Doesn't look too
> hard and you and Alan are making lots of sense about this.

Debugfs: please don't. That's meant for debugging, not for production
use.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
