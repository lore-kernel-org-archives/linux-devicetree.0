From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v2 1/3] add sysfs document for fpga bridges
Date: Fri, 24 Oct 2014 10:11:26 -0500
Message-ID: <alpine.DEB.2.02.1410241009010.23446@atx-linux-37>
References: <1414108267-22058-1-git-send-email-atull@opensource.altera.com> <1414108267-22058-2-git-send-email-atull@opensource.altera.com> <20141024105420.GB20775@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141024105420.GB20775@amd>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, mgerlach@opensource.altera.com, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Fri, 24 Oct 2014, Pavel Machek wrote:

> On Thu 2014-10-23 18:51:05, atull@opensource.altera.com wrote:
> > From: Alan Tull <atull@opensource.altera.com>
> > 
> > Add sysfs document for fpga bridges.
> > 
> > Signed-off-by: Alan Tull <atull@opensource.altera.com>
> > ---
> >  Documentation/ABI/testing/sysfs-class-fpga-bridge |    5 +++++
> >  1 file changed, 5 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-class-fpga-bridge
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-class-fpga-bridge b/Documentation/ABI/testing/sysfs-class-fpga-bridge
> > new file mode 100644
> > index 0000000..b3303ae
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-class-fpga-bridge
> > @@ -0,0 +1,5 @@
> > +What:		/sys/class/fpga-bridge/<bridge>/enable
> > +Date:		October 2014
> > +KernelVersion:	3.18
> > +Contact:	Alan Tull <atull@opensource.altera.com>
> > +Description:	Enable bridge.  Write 1 to bring bridge out of reset.
> 
> Specify, what happens when 0 is written there?
> 									Pavel

Yes, I will add:  'Write 0 has no effect.'

Alan

> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
> 
