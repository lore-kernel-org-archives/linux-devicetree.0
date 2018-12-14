From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 0/5] Add CPU clock support for Armada 7K/8K
Date: Fri, 14 Dec 2018 14:09:22 -0800
Message-ID: <154482536298.19322.16460657058404864070@swboyd.mtv.corp.google.com>
References: <20181206171516.15891-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181206171516.15891-1-gregory.clement@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Quoting Gregory CLEMENT (2018-12-06 09:15:11)
> Hello,
> 
> This is the second version of a series allowing to manage the cpu
> clock for Armada 7K/8K. For these SoCs, the CPUs share the same clock
> by cluster, so actually the clock management is done at cluster level.
> 
> As for the other Armada 7K/8K clocks it is possible to have multiple
> AP so here again we need to have unique name: the purpose of the second
> patch is to share a common code which will be used in 3 drivers.
> 
> The last 2 patch enable the driver at dt and platform level and will
> be applied through the mvebu subsystem.
 
The binding "marvell,ap806-cpu-clock" is not documented. It was in the
previous series but then got dropped from this one? Why?
