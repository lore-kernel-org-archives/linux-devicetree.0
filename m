From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/2] serial/imx: get rid of the uses of cpu_is_mx1()
Date: Sun, 3 Jul 2011 23:38:28 -0600
Message-ID: <20110704053828.GB15152@ponder.secretlab.ca>
References: <1309679760-22796-1-git-send-email-shawn.guo@linaro.org>
 <1309679760-22796-2-git-send-email-shawn.guo@linaro.org>
 <20110703211007.GB13742@ponder.secretlab.ca>
 <20110704021923.GA10245@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-serial-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110704021923.GA10245@S2100-06.ap.freescale.net>
Sender: linux-serial-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@freescale.com>
Cc: Shawn Guo <shawn.guo@linaro.org>, patches@linaro.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 04, 2011 at 10:19:25AM +0800, Shawn Guo wrote:
> > > @@ -689,7 +728,7 @@ static int imx_startup(struct uart_port *port)
> > >  		}
> > >  	}
> > >  
> > > -	if (!cpu_is_mx1()) {
> > > +	if (IS_IMX2_UART()) {
> > 
> > The logic is getting reversed here, is this really what you want to
> > do?  I would think you'd want to preserve the !IS_IMX1_UART() logic.
> > 
> Maybe not.  I actually made a small improvement here.  The body of
> the 'if' is really IMX2 specific code, so it makes more sense to use
> IS_IMX2_UART() than !IS_IMX1_UART().

Okay, it would probably be worth mentioning this change in the commit text.

