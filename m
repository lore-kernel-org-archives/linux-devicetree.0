From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v2 1/2] of: Add prompt for OF_OVERLAY config
Date: Fri, 13 Mar 2015 10:24:56 -0500
Message-ID: <CAL_JsqL5Z9v3ohZE3Fm6c1kpTyzRH5mLVvQ-X7=sDL=JfwT_DA@mail.gmail.com>
References: <1424068044-3457-1-git-send-email-matwey@sai.msu.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1424068044-3457-1-git-send-email-matwey@sai.msu.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: "Matwey V. Kornilov" <matwey@sai.msu.ru>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Bolle <pebolle@tiscali.nl>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 16, 2015 at 12:27 AM, Matwey V. Kornilov <matwey@sai.msu.ru> wrote:
> Add prompt for OF_OVERLAY config option to make in visible in menuconfig/xconfig
> to make user be able to set or unset this option.
>
> Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>

Applied for 4.0. Thanks.

Rob

> ---
> Changes from v1:
>  - Explanation commit message has been added to 1/2
>  - Add 2/2 (drop depends on OF) as suggested by <pebolle@tiscali.nl>
>
>  drivers/of/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index b5e0c87..fdca685 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -85,7 +85,7 @@ config OF_RESOLVE
>         bool
>
>  config OF_OVERLAY
> -       bool
> +       bool "Device Tree overlays"
>         depends on OF
>         select OF_DYNAMIC
>         select OF_RESOLVE
> --
> 2.1.4
>
