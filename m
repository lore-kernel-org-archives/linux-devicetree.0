From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: cache-l2x0: Parse properties from DT for PL310 cache controller
Date: Tue, 07 Jan 2014 12:57:36 +0100
Message-ID: <3479510.EFrgCqQWpu@wuerfel>
References: <1389094888-24348-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1389094888-24348-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

On Tuesday 07 January 2014 17:11:28 Tushar Behera wrote:
> Parsed auxiliary control properties for PL310 cache controller.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> ---
> These properties are set for Exynos4 platform. If we can pass these properties
> through device tree for Exynos4, then we can remove the hard-coded L2_AUX_VAL.


The explanation would be good to have in the actual changeset
comment above the '---' line. Are all of them actually needed?
You shouldn't havet o set the ones that are already turned on
by the boot loader.
> 
> diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
> index b513cb8..213546d 100644
> --- a/Documentation/devicetree/bindings/arm/l2cc.txt
> +++ b/Documentation/devicetree/bindings/arm/l2cc.txt
> @@ -44,6 +44,16 @@ Optional properties:
>  - cache-id-part: cache id part number to be used if it is not present
>    on hardware
>  - wt-override: If present then L2 is forced to Write through mode
> +- arm,early-write: If present then BRSEP mode (early write response) is enabled.
> +- arm,data-prefetch: If present then data prefetching is enabled.
> +- arm,instruction-prefetch: If present then instruction prefetching is enabled.
> +- arm,ns-interrupt-access: If present then interrupt mask and interrupt clear
> +  registers can be read or modified in both secure or non-secure accesses.
> +- arm,ns-lockdown: If present then non-secure accesses can write to lockdown
> +  register.
> +- arm,share-override: If present then shared attribute is ignored internally.
> +- arm,full-line-of-zero: If present then 'full line of write zero' behaviour is
> +  enabled.

Is it intentional that you have the "arm," prefix for the new ones, while
it's not there for the existing ones? Should we drop it for consistency?

	Arnd
