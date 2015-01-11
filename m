From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v8 0/4] FPGA Manager Framework
Date: Sun, 11 Jan 2015 20:52:19 +0100
Message-ID: <20150111195219.GA25760@amd>
References: <1420575219-27061-1-git-send-email-atull@opensource.altera.com>
 <20150110181120.GA26067@t400>
 <alpine.DEB.2.10.1501111004580.2556@shineypoop>
 <20150111162426.GC26067@t400>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150111162426.GC26067@t400>
Sender: linux-doc-owner@vger.kernel.org
To: Konrad Zapalowicz <bergo.torino@gmail.com>
Cc: atull <atull@opensource.altera.com>, gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, mark.rutland@arm.com, linux-doc@vger.kernel.org, rubini@gnudd.com, pantelis.antoniou@konsulko.com, s.trumtrar@pengutronix.de, devel@driverdev.osuosl.org, sameo@linux.intel.com, nico@linaro.org, ijc+devicetree@hellion.org.uk, kyle.teske@ni.com, grant.likely@linaro.org, davidb@codeaurora.org, linus.walleij@linaro.org, cesarb@cesarb.net, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, iws@ovro.caltech.edu, broonie@kernel.org, philip@balister.org, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com, linux-kernel@vger.kernel.org, balbi@ti.com, delicious.quinoa@gmail.com, robh+dt@kernel.org, rob@landley.net, galak@codeaurora.org, akpm@linux-foundation.org, davem@dave
List-Id: devicetree@vger.kernel.org

On Sun 2015-01-11 17:24:26, Konrad Zapalowicz wrote:
> On 01/11, atull wrote:
> > On Sat, 10 Jan 2015, Konrad Zapalowicz wrote:
> > 
> > > On 01/06, atull@opensource.altera.com wrote:
> > > > From: Alan Tull <atull@opensource.altera.com>
> > > 
> > > Alan, there is something wrong with your email client configuration
> > > and you need to fix.
> > > 
> > > thanks,
> > > konrad
> > 
> > Hi Konrad,
> > 
> > Can you be more specific?  What problem are you seeing?  Is it a problem 
> > with the original patch  post or when I reply?  When I a post, I'm using
> > 'git send-email' with sendmail and when I am replying, I am using alpine.
> 
> I think that because you email client configuration sets the 'From'
> header to "atull@..." and at the same time you sign-off messages with
> "Alan Tull atull@..." the "From" is added at the beginning of the
> message to indicate the original author.
> 
> This should be fixed as the "from" is not welcomed in the body of the
> commit message.

Actually, why not? Tools should know to look at From: in the
commit. AFAICT, Alan has it set up correctly.
								Pavel
								
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
