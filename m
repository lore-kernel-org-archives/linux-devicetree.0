From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson-g12b-ugoos-am6: add initial device-tree
Date: Fri, 23 Aug 2019 13:55:22 -0700
Message-ID: <7hv9uny539.fsf@baylibre.com>
References: <1566565717-5182-1-git-send-email-christianshewitt@gmail.com> <1566565717-5182-4-git-send-email-christianshewitt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566565717-5182-4-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>, Oleg Ivanov <balbes-150@yandex.ru>
List-Id: devicetree@vger.kernel.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> Tested-by: Oleg Ivanov <balbes-150@yandex.ru>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

nit: empty changelog.  I'd rather see the changelog from patch2 here.

> ---
>  arch/arm64/boot/dts/amlogic/Makefile               |   1 +
>  .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      | 567 +++++++++++++++++++++
>  2 files changed, 568 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
>
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 07b861f..21e2810 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> new file mode 100644
> index 0000000..27d1d62
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> @@ -0,0 +1,567 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>

This is a bit confusing.

I'm assuming you kept Neil's authorship because you copied from another
g12b board.  If so, it would be helpful in the changelog to describe the
origins of this file.  I'm assuming it was copied from odroid-n2 and
then tweaked.  That's fine, just note that as "originally based on
meson-g12b-odroid-c2".

Other than that, thanks a lot for your work on adding these new boards!

Neil, I'm starting to see a lot of duplication in the g12b .dtb files.
Should we start thinking about factoring out some of the common stuff
that's standard across all these boards?

Kevin
