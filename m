From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 01/03] dt-bindings: clock: Add Clock Management Unit
 for Actions Semi S500 SoC
Date: Tue, 25 Sep 2018 14:10:47 -0500
Message-ID: <20180925191047.GA14410@bogus>
References: <CADHB5bBkyE90LVrWjt0ziU+oe=4sc8G_513VGECc++6xQ2ACdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADHB5bBkyE90LVrWjt0ziU+oe=4sc8G_513VGECc++6xQ2ACdA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, linux@armlinux.org.uk, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Guilherme =?iso-8859-1?B?Ry4gU2lt9WVz?= <guilherme.simoes@lsitec.org.br>, Jon maddog Hall <jon.maddog.hall@gmail.com>, mkzuffo@lsi.usp.br, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, sboyd@kernel.org, mark.rutland@arm.com, linux@cubietech.com, support@cubietech.com, catalin.marinas@arm.com, Michael Turquette <mturquette@baylibre.com>, will.deacon@arm.com, thomas liau <thomas.liau@actions-semi.com>, darren@cubietech.com, jeff.chen@actions-semi.com, pn@denx.de, mp-cs@actions-semi.com, Laisa
List-Id: devicetree@vger.kernel.org

On Tue, Sep 04, 2018 at 12:36:36PM -0300, Edgar Bernardi Righi wrote:
> Add Clock Management Unit for Actions Semi S500 SoC. Dt-Bindings
> constants added.
> Tested on a Lemaker Guitar board.
> 
> Signed-off-by: Edgar Bernardi Righi <edgar.righi@lsitec.org.br>
> 
> diff --git a/include/dt-bindings/clock/actions,s500-cmu.h
> b/include/dt-bindings/clock/actions,s500-cmu.h
> new file mode 100644
> index 000000000000..34e5849ffcf1
> --- /dev/null
> +++ b/include/dt-bindings/clock/actions,s500-cmu.h
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0+

Headers should be /* */ style comments.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +//
> +// Device Tree binding constants for Actions Semi S500 Clock Management Unit
> +//
> +// Copyright (c) 2014 Actions Semi Inc.
> +// Copyright (c) 2018 Linaro Ltd.
> +// Copyright (c) 2018 LSI-TEC - Caninos Loucos
