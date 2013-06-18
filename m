From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v4 02/10] pinctrl: mvebu: dove pinctrl driver
Date: Tue, 18 Jun 2013 16:11:16 +0100
Message-ID: <20130618151116.GZ2718@n2100.arm.linux.org.uk>
References: <1344689809-6223-1-git-send-email-sebastian.hesselbarth@gmail.com> <1347550912-18021-1-git-send-email-sebastian.hesselbarth@gmail.com> <1347550912-18021-3-git-send-email-sebastian.hesselbarth@gmail.com> <20130618113606.GA26763@n2100.arm.linux.org.uk> <CACRpkdZTVN2O-Rv4u-Ccb9EzV0At3zc7GYQyTq=HkseOi=GTeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZTVN2O-Rv4u-Ccb9EzV0At3zc7GYQyTq=HkseOi=GTeg@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Stephen Warren <swarren@wwwdotorg.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 18, 2013 at 05:02:49PM +0200, Linus Walleij wrote:
> Nowadays I would do the above with regmap_update_bits().
> 
> Mutual exclusion for read-modify-write of individual bits in a
> register is one of those cases where doing a regmap over
> a memory-mapped register range makes a lot of sense.
> (drivers/mfd/syscon.c being a nice example)

So, for that solution we need to have some kind of global regmap per
register or somesuch.  Then you run into regmap needing a struct
device - well, with a shared register, which struct device do you
use, or do you have to invent one?

That sounds more heavy-weight than is really necessary.
