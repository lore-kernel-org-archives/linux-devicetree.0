From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: qcom-smsm: Add driver for Qualcomm SMSM
Date: Tue, 8 Sep 2015 14:58:31 +0200
Message-ID: <CACRpkdZv02gUrc-rOaO9HpygmHu-6=s5ABQaqPwyhLYJw_LJtg@mail.gmail.com>
References: <1440697078-4106-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1440697078-4106-3-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440697078-4106-3-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 27, 2015 at 7:37 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:

> This driver exposed the Qualcomm Shared Memory State Machine bits as
> GPIOs to the system.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
(...)
> +/*
> + * This driver implements the Qualcomm Shared Memory State Machine, a mechanism
> + * for communicating single bit state information to remote processors.
> + *
> + * The implementation is based on two sections of shared memory; the first
> + * holding the state bits and the second holding a matrix of subscription bits.
> + *
> + * The state bits are structured in entries of 32 bits, each belonging to one
> + * system in the SoC. The entry belonging to the local system is considered
> + * read-write, while the rest should be considered read-only.
> + *
> + * The subscription matrix consists of N bitmaps per entry, denoting interest
> + * in updates of the entry for each of the N hosts. Upon updating a state bit
> + * each host's subscription bitmap should be queried and the remote system
> + * should be interrupted if they request so.
> + *
> + * The subscription matrix is laid out in entry-major order:
> + * entry0: [host0 ... hostN]
> + *     .
> + *     .
> + * entryM: [host0 ... hostN]
> + *
> + * A third, optional, shared memory region might contain information regarding
> + * the number of entries in the state bitmap as well as number of columns in
> + * the subscription matrix.
> + */

This does seem like a real bad fit to GPIO for me, sorry.

IMO this is drivers/soc/qcom, using regmap and possibly
regmap IRQs-material.

Yours,
Linus Walleij
