From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v11 3/4] add FPGA manager core
Date: Wed, 23 Sep 2015 11:15:16 -0500
Message-ID: <alpine.DEB.2.02.1509231101050.23595@linuxheads99>
References: <1442935271-10375-1-git-send-email-atull@opensource.altera.com>
 <1442935271-10375-4-git-send-email-atull@opensource.altera.com>
 <20150922222929.GA26335@jcartwri.amer.corp.natinst.com>
 <20150923132354.GB31253@amd> <20150923141106.GH4953@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20150923141106.GH4953@mwanda>
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
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, linux-kernel@vger.kernel.org, hpa@zytor.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, iws@ovro.caltech.edu, michal.simek@xilinx.com, kyle.teske@ni.com, jgunthorpe@obsidianresearch.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, broonie@kernel.org, philip@balister.org, Petr Cvek <petr.cvek@tul.cz>, akpm@linux-foundation.org, monstr@monstr.eu, Pavel Machek <pavel@denx.de>, gregkh@linuxfoundation.org, balbi@ti.com, davem@davemloft.net, robh+dt@kernel.org, rob@landley.net, Josh Cartwright <joshc@ni.com>, dinguyen@opensource.altera.com, delicious.quinoa@gm
List-Id: devicetree@vger.kernel.org

On Wed, 23 Sep 2015, Dan Carpenter wrote:

> On Wed, Sep 23, 2015 at 03:23:54PM +0200, Pavel Machek wrote:
> > > > +int fpga_mgr_firmware_load(struct fpga_manager *mgr, u32 flags,
> > > > +			   const char *image_name)
> > > > +{
> > > > +	struct device *dev = &mgr->dev;
> > > > +	const struct firmware *fw;
> > > > +	int ret;
> > > > +
> > > > +	if (!mgr)
> > > > +		return -ENODEV;
> > > 
> > > Again; I'm of the opinion this is needlessly defensive.
> > 
> > Not only that, it can never happen. mgr is already dereferenced above.
> > 
> 
> It's not dereferenced.  We're taking the address of mgr->dev but we
> don't dereference mgr.
> 
> regards,
> dan carpenter
> 
> 

That's correct, it's not dereferenced.

Is there some community agreement on whether we want to check a pointer
that has been passed for NULL or not?  This is C code after all.  Checking
a passed pointer for NULL is a very common reason to return -ENODEV.

Alan
