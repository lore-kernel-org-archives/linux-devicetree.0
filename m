From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 6/7] ARM: dts: imx7d: Add node for PCIe controller
Date: Wed, 3 May 2017 16:28:19 +0800
Message-ID: <20170503082817.GD18578@dragon>
References: <20170418150133.31679-1-andrew.smirnov@gmail.com>
 <20170418150133.31679-7-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170418150133.31679-7-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: yurovsky@gmail.com, Dong Aisheng <aisheng.dong@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Apr 18, 2017 at 08:01:32AM -0700, Andrey Smirnov wrote:
> Cc: yurovsky@gmail.com
> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  arch/arm/boot/dts/imx7d.dtsi | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
> index f6dee41..f46814a 100644
> --- a/arch/arm/boot/dts/imx7d.dtsi
> +++ b/arch/arm/boot/dts/imx7d.dtsi
> @@ -42,6 +42,7 @@
>   */
>  
>  #include "imx7s.dtsi"
> +#include <dt-bindings/reset/imx7-reset.h>

It has dependency on imx7 reset driver, and I need to wait for
v4.12-rc1 to apply the patch.

Shawn
