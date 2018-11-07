From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 07/12] soc: qcom: ipa: IPA register abstraction
Date: Wed, 7 Nov 2018 16:00:58 +0100
Message-ID: <CAK8P3a2FsgR=SYAWsgFURVni1ReiCugKs1iUAfQzZhPkbW8aOA@mail.gmail.com>
References: <20181107003250.5832-1-elder@linaro.org> <20181107003250.5832-8-elder@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107003250.5832-8-elder@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Elder <elder@linaro.org>
Cc: David Miller <davem@davemloft.net>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Networking <netdev@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, syadagir@codeaurora.org, mjavid@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 7, 2018 at 1:33 AM Alex Elder <elder@linaro.org> wrote:
> diff --git a/drivers/net/ipa/ipa_reg.c b/drivers/net/ipa/ipa_reg.c
> new file mode 100644
> index 000000000000..5e0aa6163235
> --- /dev/null
> +++ b/drivers/net/ipa/ipa_reg.c
> @@ -0,0 +1,972 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
> + * Copyright (C) 2018 Linaro Ltd.
> + */
> +
> +#include <linux/types.h>
> +#include <linux/io.h>
> +#include <linux/bitfield.h>
> +
> +#include "ipa_reg.h"
> +
> +/* I/O remapped base address of IPA register space */
> +static void __iomem *ipa_reg_virt;

This should of course be part of the device structure.

> +/* struct ipa_reg_desc - descriptor for an abstracted hardware register
> + *
> + * @construct - fn to construct the register value from its field structure
> + * @parse - function to parse register field values into its field structure
> + * @offset - register offset relative to base address
> + * @n_ofst - size multiplier for "N-parameterized" registers
> + */
> +struct ipa_reg_desc {
> +       u32 (*construct)(enum ipa_reg reg, const void *fields);
> +       void (*parse)(enum ipa_reg reg, void *fields, u32 val);
> +       u32 offset;
> +       u16 n_ofst;
> +};

Indirect function pointers can be a bit expensive in the post-spectre
days. It's probably not overly important if these are always part of
an MMIO access function, but you should be careful about using
these in the data path.

How many different versions do we have to support in practice?

       Arnd
