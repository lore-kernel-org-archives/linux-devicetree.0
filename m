From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 5/5] net: phy: dp83867: Use unsigned variables to store
 unsigned properties
Date: Mon, 13 May 2019 22:46:41 +0200
Message-ID: <20190513204641.GA12345@lunn.ch>
References: <20190510214550.18657-1-tpiepho@impinj.com>
 <20190510214550.18657-5-tpiepho@impinj.com>
 <49c6afc4-6c5b-51c9-74ab-9a6e8c2460a5@gmail.com>
 <3a42c0cc-4a4b-e168-c03e-1cc13bd2f5d4@gmail.com>
 <1557777496.4229.13.camel@impinj.com>
 <b246b18d-5523-7b8b-9cd0-b8ccb8a511e9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b246b18d-5523-7b8b-9cd0-b8ccb8a511e9@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Trent Piepho <tpiepho@impinj.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

> > Perhaps you could tell me if the approach I've taken in patch 3, 
> > "Add ability to disable output clock", and patch 4, "Disable tx/rx
> > delay when not configured", are considered acceptable?  I can conceive
> > of arguments for alternate approaches.  I would like to add support for
> >  these into u-boot too, but typically u-boot follows the kernel DT
> > bindings, so I want to finalize the kernel DT semantics before sending
> > patches to u-boot.
> > 
> I lack experience with these TI PHY's. Maybe Andrew or Florian can advise.

Hi Trent

I already deleted the patches. For patch 3:

+ 	  if (dp83867->clk_output_sel > DP83867_CLK_O_SEL_REF_CLK &&
+	         dp83867->clk_output_sel != DP83867_CLK_O_SEL_OFF) {
+		 	phydev_err(phydev, "ti,clk-output-sel value %u out of range\n",
+				   dp83867->clk_output_sel);
+			return -EINVAL;
+													       }

This last bit looks odd. If it is not OFF, it is invalid?

Are there any in tree users of DP83867_CLK_O_SEL_REF_CLK? We have to
be careful changing its meaning. But if nobody is actually using it...

Patch 4:

This is harder. Ideally we want to fix this. At some point, somebody
is going to want 'rgmii' to actually mean 'rgmii', because that is
what their hardware needs.

Could you add a WARN_ON() for 'rgmii' but the PHY is actually adding a
delay? And add a comment about setting the correct thing in device
tree?  Hopefully we will then get patches correcting DT blobs. And if
we later do need to fix 'rgmii', we will break less board.

> >>> Please note that net-next is closed currently. Please resubmit the
> >>> patches once it's open again, and please annotate them properly
> >>> with net-next.
> > 
> > Sorry, didn't know about this policy.  Been years since I've submitted
> > net patches.  Is there a description somewhere of how this is done? 
> > Googling net-next wasn't helpful.  I gather new patches are only
> > allowed when the kernel merge window is open?  And they can't be queued
> > on patchwork or a topic branch until this happens?

You can post patches while it is closed for review, but add "RFC" in
the subject so it is clear you just want comments. You will still need
to resubmit once it opens up again.

    Andrew
