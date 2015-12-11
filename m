From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/2] arm: pxa27x: support for ICP DAS LP-8x4x w/ DT
Date: Thu, 10 Dec 2015 20:53:18 -0600
Message-ID: <20151211025318.GA1000@rob-hp-laptop>
References: <1387309071-22382-1-git-send-email-ynvich@gmail.com>
 <1449700088-28076-1-git-send-email-ynvich@gmail.com>
 <1449700088-28076-3-git-send-email-ynvich@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449700088-28076-3-git-send-email-ynvich@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Ianovich <ynvich@gmail.com>
Cc: linux-kernel@vger.kernel.org, Daniel Mack <zonque@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Arnaud Ebalard <arno@natisbad.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 10, 2015 at 01:28:08AM +0300, Sergei Ianovich wrote:
> ICP DAS calls LP-8x4x 'programmable automation controller'. It is
> an industrial computer based on PXA270 SoC. They ship it with a 2.6.19
> kernel and proprietary kernel module and userspace library to access
> its industrial IO.

2 comments, otherwise:

Acked-by: Rob Herring <robh@kernel.org>

> diff --git a/arch/arm/boot/dts/pxa27x-lp8x4x.dts b/arch/arm/boot/dts/pxa27x-lp8x4x.dts
> new file mode 100644
> index 0000000..bbb5b75
> --- /dev/null
> +++ b/arch/arm/boot/dts/pxa27x-lp8x4x.dts
> @@ -0,0 +1,260 @@
> +/* Device tree for ICP DAS LP-8x4x */
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>

Pretty sure this does not have a GIC.

> +#include "pxa27x.dtsi"
> +
> +/ {
> +	model = "ICP DAS LP-8x4x programmable automation controller";
> +	compatible = "marvell,pxa270";

You should have a compatible string for this board.

Rob
