From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/3] soc: Support for NPS HW scheduling
Date: Fri, 21 Oct 2016 15:52:11 +0200
Message-ID: <20161021135211.GD1636@mai>
References: <1476370350-3853-1-git-send-email-noamca@mellanox.com>
 <1476370350-3853-2-git-send-email-noamca@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476370350-3853-2-git-send-email-noamca@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Noam Camus <noamca@mellanox.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 13, 2016 at 05:52:28PM +0300, Noam Camus wrote:
> From: Noam Camus <noamca@mellanox.com>
> 
> This header file is for NPS400 SoC.
> It includes macros for save/restore of HW scheduling.
> Control is done by writing core functional registers.
> This code was moved from arc/plat-eznps so it can be used
> from driver/clocksourec/, available only for CONFIG_EZNPS_MTM_EXT.

drivers/clocksource

> Signed-off-by: Noam Camus <noamca@mellanox.com>
> ---
>  include/soc/nps/mtm.h |   61 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 61 insertions(+), 0 deletions(-)
>  create mode 100644 include/soc/nps/mtm.h
> 
> diff --git a/include/soc/nps/mtm.h b/include/soc/nps/mtm.h
> new file mode 100644
> index 0000000..9327010
> --- /dev/null
> +++ b/include/soc/nps/mtm.h
> @@ -0,0 +1,61 @@
> +/*
> + * Copyright (c) 2016, Mellanox Technologies. All rights reserved.
> + *
> + * This software is available to you under a choice of one of two
> + * licenses.  You may choose to be licensed under the terms of the GNU
> + * General Public License (GPL) Version 2, available from the file
> + * COPYING in the main directory of this source tree, or the
> + * OpenIB.org BSD license below:
> + *
> + *     Redistribution and use in source and binary forms, with or
> + *     without modification, are permitted provided that the following
> + *     conditions are met:
> + *
> + *      - Redistributions of source code must retain the above
> + *        copyright notice, this list of conditions and the following
> + *        disclaimer.
> + *
> + *      - Redistributions in binary form must reproduce the above
> + *        copyright notice, this list of conditions and the following
> + *        disclaimer in the documentation and/or other materials
> + *        provided with the distribution.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> + * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> + * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> + * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> + * SOFTWARE.
> + */
> +
> +#ifndef SOC_NPS_MTM_H
> +#define SOC_NPS_MTM_H
> +
> +#define CTOP_INST_HWSCHD_OFF_R3                 0x3B6F00BF
> +#define CTOP_INST_HWSCHD_RESTORE_R3             0x3E6F70C3
> +
> +#define DEFINE_SCHD_FLAG(type, name)    type name

What is the purpose of this macro ?

> +static inline void hw_schd_save(unsigned int *flags)
> +{
> +	__asm__ __volatile__(
> +	"       .word %1\n"
> +	"       st r3,[%0]\n"
> +	:
> +	: "r"(flags), "i"(CTOP_INST_HWSCHD_OFF_R3)
> +	: "r3", "memory");
> +}
> +
> +static inline void hw_schd_restore(unsigned int flags)
> +{
> +	__asm__ __volatile__(
> +	"       mov r3, %0\n"
> +	"       .word %1\n"
> +	:
> +	: "r"(flags), "i"(CTOP_INST_HWSCHD_RESTORE_R3)
> +	: "r3");
> +}
> +
> +#endif /* SOC_NPS_MTM_H */
> -- 
> 1.7.1
> 
