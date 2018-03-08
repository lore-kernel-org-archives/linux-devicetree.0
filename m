From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dmaengine: mv_xor_v2: Fix clock resource by adding a
 register clock
Date: Wed, 7 Mar 2018 20:38:29 -0600
Message-ID: <20180308023829.zullrqsara6epirv@rob-hp-laptop>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, devicetree@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Hanna Hawa <hannah@marvell.com>, Omri Itach <omrii@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Shadi Ammouri <shadi@marvell.com>, Igal Liberman <igall@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>, dmaengine@vger.kernel.org, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 07, 2018 at 04:40:10PM +0100, Gregory CLEMENT wrote:
> On the CP110 components which are present on the Armada 7K/8K SoC we need
> to explicitly enable the clock for the registers. However it is not
> needed for the AP8xx component, that's why this clock is optional.
> 
> With this patch both clock have now a name, but in order to be backward
> compatible, the name of the first clock is not used. It allows to still
> use this clock with a device tree using the old binding.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
> Changelog:
> 
> v1 -> v2
> 
>  - Fix typos in the commit log
>  - Add more explanation in te commit log
>  - Only skip the reg clock usage if the clock is not presetn in the
>    device tree (-ENOENT)
>  - Add dt list in CC
> 
> v2 -> v3
> 
>  - Fix the ENOENT test
> 
>  .../devicetree/bindings/dma/mv-xor-v2.txt          |  6 +++++-

Reviewed-by: Rob Herring <robh@kernel.org>

>  drivers/dma/mv_xor_v2.c                            | 25 +++++++++++++++++-----
>  2 files changed, 25 insertions(+), 6 deletions(-)
