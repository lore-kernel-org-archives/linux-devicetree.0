Return-Path: <karl@kernel.org>
Date: Thu, 4 Aug 2016 19:40:02 +0000
From: Karl Beldan <kbeldan@baylibre.com>
Subject: Re: [PATCH] ARM: dts: da850: Add missing pin muxing for the UARTs
Message-ID: <20160804194002.GA15878@gobelin>
References: <20160804110656.25318-1-kbeldan@baylibre.com>
 <m2eg64pchw.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2eg64pchw.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Sekhar Nori <nsekhar@ti.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, karl.beldan+oss@gmail.com
List-ID: <devicetree@vger.kernel.org>

On Thu, Aug 04, 2016 at 12:20:27PM -0700, Kevin Hilman wrote:
> Karl Beldan <kbeldan@baylibre.com> writes:
> 
> > This adds 2 pinctrl groups (rtscts, rxtx) for each of the 3 UARTs.
> >
> > Signed-off-by: Karl Beldan <kbeldan@baylibre.com>
> 
> Should da850-evm be updated to use the serial2_rxtx_pins also?
> 
I could not find the EVM schematics on the net and I only have an LCDK,
but according to the code it should, however I can't tell whether it
needs flow control.
 
Karl
