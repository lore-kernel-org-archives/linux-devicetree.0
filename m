From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] Documentation/devicetree: document cavium-pip
 rx-delay/tx-delay properties
Date: Wed, 8 Jun 2016 22:51:56 +0300
Message-ID: <20160608195156.GH5218@raspberrypi.musicnaut.iki.fi>
References: <1465079042-22499-1-git-send-email-aaro.koskinen@iki.fi>
 <20160608191842.GA19860@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160608191842.GA19860@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: David Daney <ddaney.cavm@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On Wed, Jun 08, 2016 at 02:18:42PM -0500, Rob Herring wrote:
> On Sun, Jun 05, 2016 at 01:24:02AM +0300, Aaro Koskinen wrote:
> > Document cavium-pip rx-delay/tx-delay properties. Currently the board
> > specific values need to be hardcoded in the platform code, which we
> > want to avoid when moving to DT-only booting.
> > 
> > Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> > ---
> >  Documentation/devicetree/bindings/net/cavium-pip.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/cavium-pip.txt b/Documentation/devicetree/bindings/net/cavium-pip.txt
> > index 7dbd158..edbf411 100644
> > --- a/Documentation/devicetree/bindings/net/cavium-pip.txt
> > +++ b/Documentation/devicetree/bindings/net/cavium-pip.txt
> > @@ -37,6 +37,10 @@ Properties for PIP port which is a child the PIP interface:
> >  
> >  - phy-handle: Optional, see ethernet.txt file in the same directory.
> >  
> > +- rx-delay: Delay value for RGMII receive clock. Optional. Disabled if 0.
> > +
> > +- tx-delay: Delay value for RGMII transmit clock. Optional. Disabled if 0.
> 
> What are the units? Use standard unit suffix if in ns, us, etc.

This is a raw register value, and the mapping to actual delay varies
depending on HW, AFAIK. 

A.
