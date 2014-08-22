MIME-Version: 1.0
In-Reply-To: <1408542259-415-9-git-send-email-j.anaszewski@samsung.com>
References: <1408542259-415-1-git-send-email-j.anaszewski@samsung.com>
	<1408542259-415-9-git-send-email-j.anaszewski@samsung.com>
Date: Thu, 21 Aug 2014 22:11:02 -0500
Message-ID: <CAL_Jsq+CWXKRtssRYNs7XOsFUFs7XX+k99=MnpHuvCt-wBk2Yg@mail.gmail.com>
Subject: Re: [PATCH/RFC v5 08/10] of: Add Skyworks Solutions, Inc. vendor prefix
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Aug 20, 2014 at 8:44 AM, Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
> Use "skyworks" as the vendor prefix for the
> Skyworks Solutions, Inc.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 34cc1bf..e1c6317 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -118,6 +118,7 @@ renesas     Renesas Electronics Corporation
>  ricoh  Ricoh Co. Ltd.
>  rockchip       Fuzhou Rockchip Electronics Co., Ltd
>  samsung        Samsung Semiconductor
> +skyworks       Skyworks Solutions, Inc.
>  sbs    Smart Battery System

Alphabetical order by prefix please.

Rob

>  schindler      Schindler
>  seagate        Seagate Technology PLC
> --
> 1.7.9.5
>
