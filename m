From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: Re: [PATCH 05/20] arm64: dts: marvell: Prepare the introduction of
 AP807 based SoCs
Date: Tue, 27 Aug 2019 17:20:55 +0200
Message-ID: <87d0gqzlbc.fsf@FE-laptop>
References: <20190806145500.24109-1-miquel.raynal@bootlin.com>
 <20190806145500.24109-6-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190806145500.24109-6-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Yan Markman <ymarkman@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Konstantin Porotchkin <kostap@marvell.com>, Stefan Chulski <stefanc@marvell.com>, Marcin Wojtas <mw@semihalf.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Miquel,

> From: Konstantin Porotchkin <kostap@marvell.com>
>
> Prepare the support for Marvell AP807 die. This die is very similar to
> AP806 but uses different DDR PHY. AP807 is a major component of CN9130
> SoC series.
>
> Signed-off-by: Konstantin Porotchkin <kostap@marvell.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 448 +----------------
>  arch/arm64/boot/dts/marvell/armada-ap80x.dtsi | 456 ++++++++++++++++++
>  2 files changed, 458 insertions(+), 446 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> index a23ddd46efc5..cdadb28f287e 100644
> --- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
> @@ -5,454 +5,10 @@
>   * Device Tree file for Marvell Armada AP806.
>   */
>  
> -#include <dt-bindings/interrupt-controller/arm-gic.h>
> -#include <dt-bindings/thermal/thermal.h>
> -
> -/dts-v1/;
> +#define AP_NAME		ap806

I didn't find where AP_NAME is used.

> +#include "armada-ap80x.dtsi"
[...]

> diff --git a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
> new file mode 100644
> index 000000000000..c44cd7c64bf6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi

[...]


> +	ap806 {

This file will be used for ap806 and for ap807 but the ap name will be
the same for both varirant?

Shouldn't you use the AP_NAME here?

Gregory

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
