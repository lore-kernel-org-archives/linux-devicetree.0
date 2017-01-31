From: Olof Johansson <olof@lixom.net>
Subject: Re: [PULL v2] ARM: DTS: Fix broken GICv2 register maps
Date: Mon, 30 Jan 2017 21:06:48 -0800
Message-ID: <20170131050648.GB16560@localhost>
References: <1485766389-30811-1-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1485766389-30811-1-git-send-email-marc.zyngier@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, arm@kernel.org, Tsahee Zidenberg <tsahee@annapurnalabs.com>, devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Beno??t Cousson <bcousson@baylibre.com>, Fabio Estevam <fabio.estevam@nxp.co>
List-Id: devicetree@vger.kernel.org

Hi Marc, 

On Mon, Jan 30, 2017 at 08:53:09AM +0000, Marc Zyngier wrote:
> ARM-soc folks,
> 
> Please find below the pull request for a DT fix affecting a large
> number of 32bit platforms, which has been acked by a number of
> platform maintainers.
> 
> * From v1: Dropped the controvertial cortex-a15-gic->arm,gic-400
>   change in the example, at Rob's request.
> 
> The following changes since commit 49def1853334396f948dcb4cedb9347abb318df5:
> 
>   Linux 4.10-rc4 (2017-01-15 16:21:59 -0800)

Any reason you had to base this on -rc4? We usually stick to an older -rc
for all our branches, this cycle it's -rc3.

Care to respin? Or I can just pick over the patches, as long as you don't
need them as a stable base somewhere else.


-Olof
