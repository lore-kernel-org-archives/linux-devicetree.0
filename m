From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v3] dmaengine: mv_xor_v2: Fix clock resource by adding a
 register clock
Date: Sun, 11 Mar 2018 20:34:23 +0530
Message-ID: <20180311150423.GC15443@localhost>
References: <20180307154010.10430-1-gregory.clement@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180307154010.10430-1-gregory.clement@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Hanna Hawa <hannah@marvell.com>, Omri Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Rob Herring <robh+dt@kernel.org>, Shadi Ammouri <shadi@marvell.com>, Igal Liberman <igall@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>, dmaengine@vger.kernel.org, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 07, 2018 at 04:40:10PM +0100, Gregory CLEMENT wrote:
> On the CP110 components which are present on the Armada 7K/8K SoC we need
> to explicitly enable the clock for the registers. However it is not
> needed for the AP8xx component, that's why this clock is optional.
> 
> With this patch both clock have now a name, but in order to be backward
> compatible, the name of the first clock is not used. It allows to still
> use this clock with a device tree using the old binding.

Applied, thanks

-- 
~Vinod
