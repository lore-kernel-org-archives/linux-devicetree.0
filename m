Return-Path: <SRS0=PXDS=QE=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <1548152509-25300-1-git-send-email-ping.bai@nxp.com> <1548152509-25300-2-git-send-email-ping.bai@nxp.com>
In-Reply-To: <1548152509-25300-2-git-send-email-ping.bai@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Jan 2019 14:17:50 +0100
Message-ID: <CACRpkdZwEKew1SLAkCEr-yxUt_m6Hzh6COVjCfM703ufcdHXiQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: freescale: Add imx8mm pinctrl driver support
Content-Type: text/plain; charset="UTF-8"
To: Jacky Bai <ping.bai@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Jan 22, 2019 at 11:17 AM Jacky Bai <ping.bai@nxp.com> wrote:

> From: Bai Ping <ping.bai@nxp.com>
>
> Add the pinctrl driver support for i.MX8MM.
>
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> Acked-by: Aisheng Dong <aisheng.dong@nxp.com>
> ---
>  change v1->v2:
>  - remove unnecessary header file include.

This doesn't apply on the current pinctrl devel branch,
I suppose it's the imx8qm patch that disturbs it.
Can you check and possibly respin on my branch?
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Yours,
Linus Walleij
