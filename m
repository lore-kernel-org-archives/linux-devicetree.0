From: Robert Schwebel <r.schwebel@pengutronix.de>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Thu, 28 May 2009 12:33:35 +0200
Message-ID: <20090528103335.GW6805@pengutronix.de>
References: <20090527175609.GB31861@flint.arm.linux.org.uk> <1243496236.3171.140.camel@pasglop> <20090528091513.GA14789@n2100.arm.linux.org.uk> <20090528.025739.16559619.davem@davemloft.net> <1243505493.5573.29.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758239AbZE1KeE@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1243505493.5573.29.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: David Miller <davem@davemloft.net>, devicetree-discuss@ozlabs.org, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.arm.linux.org.uk, scottwood@freescale.com, yuan-bo.ye@motorola.com, timur@freescale.com
List-Id: devicetree@vger.kernel.org

On Thu, May 28, 2009 at 08:11:33PM +1000, Benjamin Herrenschmidt wrote:
> The possibilities are endless. _BUT_ it does require some careful
> thinking to get things right. To that extent, I do agree with Russell
> that rather than a "violent" conversion, ARM should first try things out
> as an opt-in for a few platforms and see how it goes.

I think that the overall discussion goes into a very good direction.

The level of agreement is not as low as it might look like, I agree with
most of what David Gibson, benh and rmk have said so far; the problems
we've seen have been well identified. In the end it's probably a matter
of finding enough time to actually implement for example a prototype for
PXA.

rsc
-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
