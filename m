From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/4] dt-bindings: clock: mvebu: Add compatible string for
 98dx1135 core clock
Date: Mon, 17 Jun 2019 23:25:18 +0200
Message-ID: <20190617212518.GN17551@lunn.ch>
References: <20190617100432.13037-1-chris.packham@alliedtelesis.co.nz>
 <20190617100432.13037-3-chris.packham@alliedtelesis.co.nz>
 <20190617170931.GG17551@lunn.ch>
 <52f0fe4f276e4088ac7ad47bc761722e@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <52f0fe4f276e4088ac7ad47bc761722e@svr-chch-ex1.atlnz.lc>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jason@lakedaemon.net" <jason@lakedaemon.net>, "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

> That list would be the same as the Kirkwood/Dove. I thought about adding 
> it but decided not to to avoid unnecessary duplication. One compromise 
> would be to change "for 98dx1135 SoC core clocks" to "for Kirkwood 
> 98dx1135 SoC" which would fit with the MV88f6180 line above and make it 
> clear that it falls into the kirkwood bucket.

Hi Chris

The Compromise sounds good.

Thanks
	Andrew
