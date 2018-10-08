From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 0/4] Enable ath10k wcn3990 wifi driver support on sdm845
Date: Mon, 8 Oct 2018 12:45:14 -0700
Message-ID: <CA+ASDXNvGG34eSsupr95p-O-CUUui2bU63LUjn6cbKiXwKhTYw@mail.gmail.com>
References: <20181001112636.31715-1-govinds@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20181001112636.31715-1-govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ath10k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

+ linux-arm-msm, linux-soc

The MSM list should definitely be included for updates to Qualcomm DTS
files. Probably linux-soc too, if I'm reading MAINTAINERS correctly.

Brian

On Mon, Oct 1, 2018 at 4:26 AM Govind Singh <govinds-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
> This series enables ath10k wifi driver support for WCN3990 target
> on sdm845 SOC. This series also updates the missing dt binding documentation
> and adds optional iommu property.
>
> sdm845 dtsi changes in this series are based on top of
> https://patchwork.kernel.org/cover/10573121/ change.
>
> Changes since v1:
>         Listed no of interrupts/clocks for each set of compatible.
>         Added missing 'wifi' label to sdm845.dtsi.
>
> Govind Singh (4):
>   dt: bindings: add missing dt properties for WCN3990 wifi node
>   dts: arm64/sdm845: Add WCN3990 WLAN module device node
>   dt: bindings: add bindings for wifi iommu node
>   dts: arm64/sdm845: Enable iommu for WCN3990 wifi module device node
>
>  .../bindings/net/wireless/qcom,ath10k.txt     | 34 +++++++++++++++----
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  7 ++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 27 +++++++++++++++
>  3 files changed, 61 insertions(+), 7 deletions(-)
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
