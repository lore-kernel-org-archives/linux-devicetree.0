From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 0/2] ARM: DTS: Fix broken GICv2 register maps
Date: Thu, 19 Jan 2017 09:08:55 -0800
Message-ID: <20170119170854.GX7403@atomide.com>
References: <1484736811-24002-1-git-send-email-marc.zyngier@arm.com>
 <2966702.djJyWhCMlK@wuerfel>
 <16613dbe-08b9-98d8-c747-a977e78601b1@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <16613dbe-08b9-98d8-c747-a977e78601b1@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, arm@kernel.org, Tsahee Zidenberg <tsahee@annapurnalabs.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms@verge.net.au>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.e>
List-Id: devicetree@vger.kernel.org

* Marc Zyngier <marc.zyngier@arm.com> [170118 05:09]:
> On 18/01/17 12:34, Arnd Bergmann wrote:
> > On Wednesday, January 18, 2017 10:53:29 AM CET Marc Zyngier wrote:
> >> For a GICv2 (which happens to be virtualization capable), the
> >> architecture mandates the following regions:
> >>
> >> 	     GICD: 4kB
> >> 	     GICC: 8kB
> >> 	     GICH: 8kB
> >> 	     GICV: 8kB
> >>
> >> Unfortunately, I made a mistake in one of the examples contained in
> >> the DT binding document, and everyone duplicated that same mistake all
> >> over the map.
> >>
> >> This small series fixes the DT binding, and hopefully updates all the
> >> offending DTs to be compliant with the architecture.
> >>
> > 
> > Looks good to me, can you send this as a pull request to arm@kernel.org
> > once you have collected a reasonable number of Acks?
> 
> Sure, will do.
> 
> > Acked-by: Arnd Bergmann <arnd@arndb.de>

Here's yet another ack to paste for both patches:

Acked-by: Tony Lindgren <tony@atomide.com>
