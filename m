From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH v1 3/4] drivers: edac: Add EDAC driver support for QCOM SoCs
Date: Fri, 10 Aug 2018 17:14:08 -0700
Message-ID: <CAE=gft5dOURp02K9StHsXySCYCu-nO-44Sw0=+CTxkO-Yra_5A@mail.gmail.com>
References: <1533155615-27929-1-git-send-email-vnkgutta@codeaurora.org>
 <1533155615-27929-4-git-send-email-vnkgutta@codeaurora.org>
 <CAE=gft5-5sVE-ih26KzJdpeth7Hq6QKNrP+oj_1JR=zYrdo0rw@mail.gmail.com> <2f1f8fcb95ed82219817800577ced67d@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2f1f8fcb95ed82219817800577ced67d@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vnkgutta@codeaurora.org
Cc: robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, bp@alien8.de
List-Id: devicetree@vger.kernel.org

On Fri, Aug 10, 2018 at 4:13 PM <vnkgutta@codeaurora.org> wrote:
>
> On 2018-08-10 10:23, Evan Green wrote:
> > On Wed, Aug 1, 2018 at 1:34 PM Venkata Narendra Kumar Gutta
> > <vnkgutta@codeaurora.org> wrote:
> >>
> >> From: Channagoud Kadabi <ckadabi@codeaurora.org>
> >>
> >> Add error reporting driver for SBEs and DBEs. As of now, this driver
> >> supports erp for Last Level Cache Controller (LLCC). This driver takes
> >> care of dumping registers and adding config options to enable and
> >> disable panic when the errors happen in cache.
> >>
> >> Co-developed-by: Venkata Narendra Kumar Gutta
> >> <vnkgutta@codeaurora.org>
> >> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> >> Signed-off-by: Channagoud Kadabi <ckadabi@codeaurora.org>
> >> ---
> >>  MAINTAINERS              |   7 +
> >>  drivers/edac/Kconfig     |  28 +++
> >>  drivers/edac/Makefile    |   1 +
> >>  drivers/edac/qcom_edac.c | 507
> >> +++++++++++++++++++++++++++++++++++++++++++++++
> >>  4 files changed, 543 insertions(+)
> >>  create mode 100644 drivers/edac/qcom_edac.c
> >>
> > ...
> >> diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
> >> new file mode 100644
> >> index 0000000..cf3e2b0
> >> --- /dev/null
> >> +++ b/drivers/edac/qcom_edac.c
> >> @@ -0,0 +1,507 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> >> + */
> >> +
> >> +#include <linux/kernel.h>
> >> +#include <linux/edac.h>
> >> +#include <linux/of_device.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/smp.h>
> >> +#include <linux/regmap.h>
> >> +#include <linux/interrupt.h>
> >> +#include <linux/soc/qcom/llcc-qcom.h>
> >
> > Please alphabetize these includes, and remove any unneeded ones.
> Ok, I'll update it in the next version. I didn't know that it's
> mandatory to have in alphabetic order.
> Is it recommended or a strict rule that we have includes in alphabetize
> order?

You know, I'm not actually sure if it's a strict rule. I'm still
learning many of the conventions here myself. But it seems to get
commented on consistently by reviewers, so it's in my bag of "things I
look out for".
