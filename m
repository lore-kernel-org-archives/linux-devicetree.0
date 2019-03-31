From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ARCH: Use the correct style for SPDX License Identifier
Date: Sun, 31 Mar 2019 01:41:26 -0500
Message-ID: <20190331010549.GA17669@bogus>
References: <20190323132808.GA10547@nishad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190323132808.GA10547@nishad>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishad Kamdar <nishadkamdar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Mar 23, 2019 at 06:58:14PM +0530, Nishad Kamdar wrote:
> This patch corrects the SPDX License Identifier style
> in the Hardware Architecture subsystem.
> 
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46
> and making some manual changes.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt2712-pinfunc.h     | 2 +-
>  arch/arm64/include/asm/pointer_auth.h             | 2 +-
>  arch/arm64/include/asm/sdei.h                     | 2 +-
>  arch/arm64/include/asm/vmap_stack.h               | 2 +-
>  arch/nds32/include/asm/assembler.h                | 2 +-

No reason to put all arches in one patch. Please split by arch for 
maintainers to take.

Rob
