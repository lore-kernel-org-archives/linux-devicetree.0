Return-Path: <SRS0=WSjT=TD=linaro.org=ulf.hansson@kernel.org>
MIME-Version: 1.0
References: <20190429090310.25484-1-haibo.chen@nxp.com>
In-Reply-To: <20190429090310.25484-1-haibo.chen@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 3 May 2019 15:29:01 +0200
Message-ID: <CAPDyKFqi=v6WBR5+n_U6ngQDgeDtrdHwS2xBgntqqLmNMPuK=A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add struct esdhc_soc_data for i.MX7ULP
Content-Type: text/plain; charset="UTF-8"
To: BOUGH CHEN <haibo.chen@nxp.com>
Cc: "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, 29 Apr 2019 at 10:55, BOUGH CHEN <haibo.chen@nxp.com> wrote:
>
> ---
> Changes for V2:
> -remove the request on the subsequent error paths in pm_runtime_resume
>
> Haibo Chen (3):
>   dt-bindings: mmc: fsl-imx-esdhc: add imx7ulp compatible string
>   mmc: sdhci-esdhc-imx: add pm_qos to interact with cpuidle
>   mmc: add HS400 support for iMX7ULP
>
>  .../devicetree/bindings/mmc/fsl-imx-esdhc.txt |  1 +
>  drivers/mmc/host/sdhci-esdhc-imx.c            | 41 +++++++++++++++++--
>  2 files changed, 39 insertions(+), 3 deletions(-)
>
> --
> 2.17.1
>

Applied for next, thanks!

Kind regards
Uffe
