From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCHv7 3/3] edac: altera: Add EDAC support for Altera SoC
 SDRAM Controller.
Date: Tue, 8 Jul 2014 13:52:05 +0200
Message-ID: <20140708115205.GA8628@amd.pavel.ucw.cz>
References: <1403730927-16163-1-git-send-email-tthayer@altera.com>
 <1403730927-16163-4-git-send-email-tthayer@altera.com>
 <20140708113109.GC8100@amd.pavel.ucw.cz>
 <20140708114227.GB27659@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140708114227.GB27659@pd.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: tthayer@altera.com, robherring2@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, dinguyen@altera.com, dougthompson@xmission.com, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, tthayer.linux@gmail.com, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue 2014-07-08 13:42:28, Borislav Petkov wrote:
> On Tue, Jul 08, 2014 at 01:31:09PM +0200, Pavel Machek wrote:
> > > +	read_reg = readl(mc_vbase + DRAMADDRW);
> > > +
> > > +	width = readl(mc_vbase + DRAMIFWIDTH);
> > > +
> > > +	col = (read_reg & DRAMADDRW_COLBIT_MASK) >>
> > > +		DRAMADDRW_COLBIT_LSB;
> > > +	row = (read_reg & DRAMADDRW_ROWBIT_MASK) >>
> > > +		DRAMADDRW_ROWBIT_LSB;
> > > +	bank = (read_reg & DRAMADDRW_BANKBIT_MASK) >>
> > > +		DRAMADDRW_BANKBIT_LSB;
> > > +	cs = (read_reg & DRAMADDRW_CSBIT_MASK) >>
> > > +		DRAMADDRW_CSBIT_LSB;
> > 
> > As I said, all the defines only make this harder to read. The code is
> > pretty obvious if you put numbers in here...
> 
> Since when it is a good coding practice to put naked numbers instead of
> descriptive macro names??!
> 
> Now, I can understand that the macro names could be made more
> descriptive so that you can understand what they mean, but naked
> numbers?! You must be joking although 1st of April is long gone.

I'm not joking. Try to understand and verify the code above. You
can't. The "descriptive macro names" are useless; all the code does is
split register in pieces. With the numbers it would be  very obvious.


									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
