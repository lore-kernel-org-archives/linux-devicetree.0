From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Subject: Re: [PATCH 2/2] ARM: DTS: Fix register map for virt-capable GIC
Date: Wed, 18 Jan 2017 08:39:16 -0800
Message-ID: <2cfdd977-5ee9-a66a-acaf-8a4213bdbc37@oracle.com>
References: <1484736811-24002-1-git-send-email-marc.zyngier@arm.com>
 <1484736811-24002-3-git-send-email-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1484736811-24002-3-git-send-email-marc.zyngier@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>, arm@kernel.org, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Jason Cooper <jason@lakedaemon.net>, Simon Horman <horms@verge.net.au>, Santosh Shilimkar <ssantosh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Antoine Tenart <antoine.tenart@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, Fabio Estevam <fabio.estevam@nxp.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Shawn Guo <shawnguo@kern>
List-Id: devicetree@vger.kernel.org

On 1/18/2017 2:53 AM, Marc Zyngier wrote:
> Since everybody copied my own mistake from the DT binding example,
> let's address all the offenders in one swift go.
>
> Most of them got the CPU interface size wrong (4kB, while it should
> be 8kB), except for both keystone platforms which got the control
> interface wrong (4kB instead of 8kB).
>
> In the couple of cases were I knew for sure what implementation
> was used, I've added the "arm,gic-400" compatible string. I'm 99%
> sure that this is what everyong is using, but short of having the
> TRM for all the other SoCs, I've let them alone.
>
> Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> ---

>  arch/arm/boot/dts/imx6ul.dtsi        | 4 ++--
>  arch/arm/boot/dts/keystone-k2g.dtsi  | 2 +-
>  arch/arm/boot/dts/keystone.dtsi      | 2 +-

For keystone bits,
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
