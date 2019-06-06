Return-Path: <SRS0=Sfu6=UF=verge.net.au=horms@kernel.org>
Date: Thu, 6 Jun 2019 15:42:33 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] ARM: dts: rza2mevb: Add input switch
Message-ID: <20190606134232.ahetmpqlrvrmxsi5@verge.net.au>
References: <20190604200914.64896-1-chris.brandt@renesas.com>
 <20190604200914.64896-3-chris.brandt@renesas.com>
 <20190606084827.2cg6eab3gvjvtfmd@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606084827.2cg6eab3gvjvtfmd@verge.net.au>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Jun 06, 2019 at 10:48:28AM +0200, Simon Horman wrote:
> On Tue, Jun 04, 2019 at 03:09:14PM -0500, Chris Brandt wrote:
> > Add support for input switch SW3 on the Renesas RZ/A2M EVB
> > development board.
> > 
> > Note that this uses the IRQ interrupt, as the RZ/A2 GPIO controller
> > does not include interrupt support
> > 
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> 
> Thanks Chris,
> 
> I have applied this for inclusion in v5.3.
> 
> There was a minor conflict when applying the pinctl portion
> of the patch which I have resolved. The result is as follows.

Scratch that, I was working in the wrong branch.
I now have your patch cleanly applied for inclusion in v5.3.
