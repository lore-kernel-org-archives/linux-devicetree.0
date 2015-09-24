From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v11 3/4] add FPGA manager core
Date: Thu, 24 Sep 2015 15:47:26 -0500
Message-ID: <alpine.DEB.2.02.1509241526380.5173@linuxheads99>
References: <1442935271-10375-1-git-send-email-atull@opensource.altera.com>
 <1442935271-10375-4-git-send-email-atull@opensource.altera.com>
 <20150922222929.GA26335@jcartwri.amer.corp.natinst.com>
 <20150923132354.GB31253@amd> <20150923141106.GH4953@mwanda>
 <alpine.DEB.2.02.1509231101050.23595@linuxheads99>
 <20150924074953.GI4953@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20150924074953.GI4953@mwanda>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, linus.walleij@linaro.org, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, iws@ovro.caltech.edu, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, rubini@gnudd.com, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Josh Cartwright <joshc@ni.com>, broonie@kernel.org, gregkh@linuxfoundation.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, dinguyen@opensource.altera.com, monstr@monstr.eu, Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@daveml
List-Id: devicetree@vger.kernel.org

On Thu, 24 Sep 2015, Dan Carpenter wrote:

> Of course, the maintainer gets the last word regardless of what anyone
> else thinks.
> 
> Generally, minimal code is better.  Trying to future proof code is a
> waste of time because you can't predict what will happen in the future.
> It's way more likely that some pointer you never expected to be NULL
> will be NULL instead of the few checked at the beginning of a function.
> Adding useless code uses RAM and makes the function slower.  It's a bit
> confusing for users as well because they will wonder when the NULL check
> is used.  A lot of times this sort of error handling is a bit fake and
> what I mean is that it looks correct but the system will just crash in a
> later function.
> 
> Also especially with a simple NULL dereferences like this theoretical
> one, it's better to just get the oops.  It kills the module but you get
> a good message in the log and it's normally straight forward to debug.
> 
> We spent a surprising amount of time discussing useless code.  I made
> someone redo a patch yesterday because they had incomplete error
> handling for a situation which could never happen.
> 
> regards,
> dan carpenter
> 
> 

Thanks for the discussion.

Interesting.  The amount of code bloat here compiles down to about two
machine instructions (in two places).  Actually a little more since I should
be using IS_ERR_OR_NULL.  But the main question is whether I should do
it at all.

The behaviour I should drive here is that the user will do their own error
checking.  After they get a pointer to a FPGA manager using
of_fpga_mgr_get(), they should check it and not assume that
fpga_mgr_firmware_load() will do it for them, i.e.

	mgr = of_fpga_mgr_get(mgr_node);
	if (IS_ERR(mgr))
		return PTR_ERR(mgr);
	fpga_mgr_firmware_load(mgr, flags, path);

I could take out these NULL pointer checks and it won't hurt anything unless
someone is just using the functions badly, in which case: kablooey.

Alan
