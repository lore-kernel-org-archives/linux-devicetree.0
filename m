From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v5 2/3] net: Add Keystone NetCP ethernet driver
Date: Tue, 30 Sep 2014 13:09:34 +0000
Message-ID: <063D6719AE5E284EB5DD2968C1650D6D174A1012@AcuExch.aculab.com>
References: <1411667317-1163-1-git-send-email-santosh.shilimkar@ti.com>
	<1411667317-1163-3-git-send-email-santosh.shilimkar@ti.com>
 <20140929.155200.2231132602322345812.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20140929.155200.2231132602322345812.davem@davemloft.net>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: 'David Miller' <davem@davemloft.net>, "santosh.shilimkar@ti.com" <santosh.shilimkar@ti.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sandeep_n@ti.com" <sandeep_n@ti.com>, "joe@perches.com" <joe@perches.com>
List-Id: devicetree@vger.kernel.org

From: David Miller
> From: Santosh Shilimkar <santosh.shilimkar@ti.com>
> Date: Thu, 25 Sep 2014 13:48:36 -0400
> 
> > +static inline int gbe_phy_link_status(struct gbe_slave *slave)
> > +{
> > +	if (!slave->phy)
> > +		return 1;
> > +
> > +	if (slave->phy->link)
> > +		return 1;
> > +
> > +	return 0;
> > +}
> 
> Please use 'bool' as the return type and return 'true' or 'false'.

That function body could also be just:
	return !slave->phy && slave->phy->link;
which might be more readable if directly coded.

I also wonder if slave>phy can actually be NULL?
If it can be under unusual circumstances it might be worth
assigning the address of a dummy 'phy' structure so that the
tests can all be removed.

	David
