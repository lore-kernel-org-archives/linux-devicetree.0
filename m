From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: vf610-zii-dev: add EEPROM entry to Rev C
Date: Mon, 23 Jan 2017 15:38:03 +0800
Message-ID: <20170123073801.GK5662@dragon>
References: <20170112230620.1735-1-vivien.didelot@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170112230620.1735-1-vivien.didelot@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, andrew@lunn.ch, Andrey Smirnov <andrew.smirnov@gmail.com>, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, kernel@savoirfairelinux.com, Sascha Hauer <kernel@pengutronix.de>, Nikita Yushchenko <nikita.yoush@cogentembedded.com>, cphealy@gmail.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 12, 2017 at 06:06:20PM -0500, Vivien Didelot wrote:
> The ZII Dev Rev C board has EEPROMs hanging the 88E6390 Ethernet switch
> chips. Add an "eeprom-length" property to allow access from ethtool.
> 
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Applied, thanks.
