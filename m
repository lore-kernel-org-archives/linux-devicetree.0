From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 5/5] net: phy: dp83867: Use unsigned variables to store
 unsigned properties
Date: Mon, 13 May 2019 23:43:32 +0200
Message-ID: <20190513214332.GB12345@lunn.ch>
References: <20190510214550.18657-1-tpiepho@impinj.com>
 <20190510214550.18657-5-tpiepho@impinj.com>
 <49c6afc4-6c5b-51c9-74ab-9a6e8c2460a5@gmail.com>
 <3a42c0cc-4a4b-e168-c03e-1cc13bd2f5d4@gmail.com>
 <1557777496.4229.13.camel@impinj.com>
 <b246b18d-5523-7b8b-9cd0-b8ccb8a511e9@gmail.com>
 <20190513204641.GA12345@lunn.ch>
 <1557782787.4229.36.camel@impinj.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557782787.4229.36.camel@impinj.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Trent Piepho <tpiepho@impinj.com>
Cc: "hkallweit1@gmail.com" <hkallweit1@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> > Hi Trent
> > 
> > I already deleted the patches. For patch 3:
> > 
> > + 	  if (dp83867->clk_output_sel > DP83867_CLK_O_SEL_REF_CLK &&
> > +	         dp83867->clk_output_sel != DP83867_CLK_O_SEL_OFF) {
> > +		 	phydev_err(phydev, "ti,clk-output-sel value %u out of range\n",
> > +				   dp83867->clk_output_sel);
> > +			return -EINVAL;
> > +		      }
> > 
> > This last bit looks odd. If it is not OFF, it is invalid?
> 
> The valid values are in the range 0 to DP83867_CLK_O_SEL_REF_CLK and
> also DP83867_CLK_O_SEL_OFF.  Thus invalid values are those greater than
> DP83867_CLK_O_SEL_REF_CLK which are not DP83867_CLK_O_SEL_OFF.

Hi Trent
 
O.K.

> > Are there any in tree users of DP83867_CLK_O_SEL_REF_CLK? We have to
> > be careful changing its meaning. But if nobody is actually using it...
> 
> Nope.  I doubt this will affect anyone.  They'd need to strap the phy
> to get a different configuration, and the explicitly add a property,
> which isn't in the example DTS files, to change the configuration to
> something they didn't want, and then depend on a driver bug ignoring
> the erroneous setting they added.

O.K, then this patch is O.K. Does the binding documentation need
updating?
 
> > Patch 4:
> > 
> > This is harder. Ideally we want to fix this. At some point, somebody
> > is going to want 'rgmii' to actually mean 'rgmii', because that is
> > what their hardware needs.
> > 
> > Could you add a WARN_ON() for 'rgmii' but the PHY is actually adding a
> > delay? And add a comment about setting the correct thing in device
> > tree?  Hopefully we will then get patches correcting DT blobs. And if
> > we later do need to fix 'rgmii', we will break less board.
> 
> Yes I can do this.  Should it warn on any use of "rgmii"?

No, i would only warn when there is a delay configured by
strapping. If you want the PHY to be left alone, you should use
PHY_INTERFACE_MODE_NA, which should be the default if there is no
phy-mode property. If DT actually asked for "rgmii", it either means
it is wrong and rgmii-id should be used to match the strapping, or
both the strapping and the DT is wrong and somebody really does want
"rgmii".

> If so, how would someone make the warning go away if they actually
> want rgmii mode with no delay?

We take the warning out, and implement "rgmii" correctly, and let
boards break which have broken DT. We have done this before, but
without a period of time with a warning.

> I suspect hsdk.dts is an example of an in-tree broken board that uses
> "rgmii" would it should have used "rgmii-id".

O.K, so when you submit the patch Cc: Alexey Brodkin <abrodkin@synopsys.com>

     Andrew
