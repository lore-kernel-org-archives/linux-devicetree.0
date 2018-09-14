From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 2/7] net: phy: mscc: add support for VSC8584 PHY
Date: Fri, 14 Sep 2018 18:58:24 +0200
Message-ID: <20180914165824.GA3811@lunn.ch>
References: <cover.b921b010b6d6bde1c11e69551ae38f3b2818645b.1536916714.git-series.quentin.schulz@bootlin.com>
 <a61d9affd3f1ec9deb60c882cce1daf37fbe2427.1536916714.git-series.quentin.schulz@bootlin.com>
 <20180914131846.GG14865@lunn.ch>
 <20180914132930.fphdm3dm2incetbq@qschulz>
 <20180914162828.5e75ffh5sig4om3d@qschulz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180914162828.5e75ffh5sig4om3d@qschulz>
Sender: linux-kernel-owner@vger.kernel.org
To: Quentin Schulz <quentin.schulz@bootlin.com>
Cc: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, f.fainelli@gmail.com, allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, antoine.tenart@bootlin.com
List-Id: devicetree@vger.kernel.org

> Confirmed by HW engineers, it only impacts PHYs in the same package.

Hi Quentin

Thanks for checking. As you said, it would be counter intuitive,
meaning a lot of confusion if it actually did happen.

Maybe you can add "in package" before broadcast in the commit message
and the code comments.

       Andrew
