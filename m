From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v11 3/4] add FPGA manager core
Date: Fri, 25 Sep 2015 13:00:36 +0300
Message-ID: <20150925100036.GM4953@mwanda>
References: <1442935271-10375-1-git-send-email-atull@opensource.altera.com>
 <1442935271-10375-4-git-send-email-atull@opensource.altera.com>
 <20150922222929.GA26335@jcartwri.amer.corp.natinst.com>
 <20150923132354.GB31253@amd> <20150923141106.GH4953@mwanda>
 <alpine.DEB.2.02.1509231101050.23595@linuxheads99>
 <20150924074953.GI4953@mwanda>
 <alpine.DEB.2.02.1509241526380.5173@linuxheads99>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1509241526380.5173@linuxheads99>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: atull <atull@opensource.altera.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, linus.walleij@linaro.org, pantelis.antoniou@konsulko.com, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, iws@ovro.caltech.edu, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, rubini@gnudd.com, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, akpm@linux-foundation.org, monstr@monstr.eu, Pavel Machek <pavel@denx.de>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, balbi@ti.com, davem@davemloft.net, robh+dt@kernel.org, rob@landley.net, Josh Cartwright <joshc@ni.com>, dinguyen@opensource.altera.com, delicious.quinoa@gma
List-Id: devicetree@vger.kernel.org

On Thu, Sep 24, 2015 at 03:47:26PM -0500, atull wrote:
> Interesting.  The amount of code bloat here compiles down to about two
> machine instructions (in two places).  Actually a little more since I should
> be using IS_ERR_OR_NULL.  But the main question is whether I should do
> it at all.
> 

They kernel already has too many bogus checks for IS_ERR().  It's a very
common bug to check for IS_ERR() when you should be checking for NULL.

-	foo = some_allocator();
+	foo = kmalloc();
	if (IS_ERR(foo))
		goto fail;

I have a static checker for "warn: 'foo' isn't an ERR_PTR" but I haven't
published it because too much code has impossible checks.

> The behaviour I should drive here is that the user will do their own error
> checking.  After they get a pointer to a FPGA manager using
> of_fpga_mgr_get(), they should check it and not assume that
> fpga_mgr_firmware_load() will do it for them, i.e.
> 
> 	mgr = of_fpga_mgr_get(mgr_node);
> 	if (IS_ERR(mgr))
> 		return PTR_ERR(mgr);
> 	fpga_mgr_firmware_load(mgr, flags, path);
> 

I don't understand completely how of_fpga_mgr_get() ever returns NULL.
A lot of the of_ functions return ERR_PTRs if OF_ is compiled in but
they return NULL if it's not.  I think this is so people can build with
COMPILE_TEST so we get more coverage with static analysis?

> I could take out these NULL pointer checks and it won't hurt anything unless
> someone is just using the functions badly, in which case: kablooey.

Linux devs are very good about doing error checking.  An early kablooey
is what we want for people who don't.

Also if you provide a sanity check then Markus Elfring will remove all
the error checking in the callers.  Don't do it.

regards,
dan carpenter
