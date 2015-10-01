From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH linux-next v11 1/3] mfd: atmel-flexcom: create include
 file with macros used by DT bindings
Date: Thu, 1 Oct 2015 12:55:46 +0100
Message-ID: <20151001115546.GS3214@x1>
References: <cover.1443431309.git.cyrille.pitchen@atmel.com>
 <97f3621def8ca996e6e5ca48870e29d452e252d9.1443431309.git.cyrille.pitchen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <97f3621def8ca996e6e5ca48870e29d452e252d9.1443431309.git.cyrille.pitchen@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: nicolas.ferre@atmel.com, boris.brezillon@free-electrons.com, alexandre.belloni@free-electrons.com, sameo@linux.intel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, akpm@linux-foundation.org
List-Id: devicetree@vger.kernel.org

On Mon, 28 Sep 2015, Cyrille Pitchen wrote:

> This patch defines some macros to be used as value for the
> "atmel,flexcom-mode" DT property. This value is then written into
> the Operating Mode (OPMODE) bit field of the Flexcom Mode Register.
>=20
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---
>  include/dt-bindings/mfd/atmel-flexcom.h | 26 +++++++++++++++++++++++=
+++
>  1 file changed, 26 insertions(+)
>  create mode 100644 include/dt-bindings/mfd/atmel-flexcom.h

Applied, thanks.

> diff --git a/include/dt-bindings/mfd/atmel-flexcom.h b/include/dt-bin=
dings/mfd/atmel-flexcom.h
> new file mode 100644
> index 000000000000..a266fe4ee945
> --- /dev/null
> +++ b/include/dt-bindings/mfd/atmel-flexcom.h
> @@ -0,0 +1,26 @@
> +/*
> + * This header provides macros for Atmel Flexcom DT bindings.
> + *
> + * Copyright (C) 2015 Cyrille Pitchen <cyrille.pitchen@atmel.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, b=
ut
> + * WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License=
 along with
> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __DT_BINDINGS_ATMEL_FLEXCOM_H__
> +#define __DT_BINDINGS_ATMEL_FLEXCOM_H__
> +
> +#define ATMEL_FLEXCOM_MODE_USART	1
> +#define ATMEL_FLEXCOM_MODE_SPI		2
> +#define ATMEL_FLEXCOM_MODE_TWI		3
> +
> +#endif /* __DT_BINDINGS_ATMEL_FLEXCOM_H__ */

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
