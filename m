From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2 08/12] ARM: allow MULTIPLATFORM with !MMU
Date: Tue, 30 Dec 2014 15:42:29 -0600
Message-ID: <CAL_JsqK94Pk2xPF1MMX0GU0CQEiwiDD2qv9v3k4WLg2znDVjgA@mail.gmail.com>
References: <1419895935-22966-1-git-send-email-stefan@agner.ch>
 <1419895935-22966-9-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1419895935-22966-9-git-send-email-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Agner <stefan@agner.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Olof Johansson <olof@lixom.net>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo <shawn.guo@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 29, 2014 at 5:32 PM, Stefan Agner <stefan@agner.ch> wrote:
> In order to support SoC with heterogenous CPU architectures (such
> as Freescale Vybrid/i.MXSX) it is preferable to use the same
> architecture (ARCH_MXC in this case) for the MMU enabled and !MMU
> CPU. Hence allow to select MULTIPLATFORM even without MMU.

This has been submitted before[1], but you obviously have a better
reason now. I also need this for my Versatile series to fix
allnoconfig. However, there are some issues with your implementation.

> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  arch/arm/Kconfig | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 97d07ed..95007b9 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -228,7 +228,7 @@ config VECTORS_BASE
>           in size.
>
>  config ARM_PATCH_PHYS_VIRT
> -       bool "Patch physical to virtual translations at runtime" if EMBEDDED
> +       bool "Patch physical to virtual translations at runtime" if EMBEDDED || (ARCH_MULTIPLATFORM && MMU)
>         default y
>         depends on !XIP_KERNEL && MMU
>         depends on !ARCH_REALVIEW || !SPARSEMEM
> @@ -303,15 +303,12 @@ config MMU
>  #
>  choice
>         prompt "ARM system type"
> -       default ARCH_VERSATILE if !MMU
> -       default ARCH_MULTIPLATFORM if MMU
> +       default ARCH_MULTIPLATFORM
>
>  config ARCH_MULTIPLATFORM
>         bool "Allow multiple platforms to be selected"
> -       depends on MMU
>         select ARCH_WANT_OPTIONAL_GPIOLIB
>         select ARM_HAS_SG_CHAIN
> -       select ARM_PATCH_PHYS_VIRT
>         select AUTO_ZRELADDR
>         select CLKSRC_OF
>         select COMMON_CLK
> @@ -783,13 +780,13 @@ comment "CPU Core family selection"
>
>  config ARCH_MULTI_V4
>         bool "ARMv4 based platforms (FA526)"
> -       depends on !ARCH_MULTI_V6_V7
> +       depends on !ARCH_MULTI_V6_V7 && MMU

This is not right. !MMU does not mean the ARM arch does not have an
MMU, but rather the MMU is already setup with identity mapping (or
some other static mapping).

Rob

[1] http://patchwork.ozlabs.org/patch/278996/
