From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/4] dt-bindings: clock: mvebu: Add compatible string for
 98dx1135 core clock
Date: Mon, 17 Jun 2019 19:09:31 +0200
Message-ID: <20190617170931.GG17551@lunn.ch>
References: <20190617100432.13037-1-chris.packham@alliedtelesis.co.nz>
 <20190617100432.13037-3-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190617100432.13037-3-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, jason@lakedaemon.net, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2019 at 10:04:30PM +1200, Chris Packham wrote:
> Add compatible string for the core clock on the 98dx1135 switch with
> integrated CPU.

Hi Chris

Should there be a list of provider IDs and clock names?

Thanks
	Andrew
