From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH] of: add vendor prefix for Silicon Storage Technology Inc.
Date: Mon, 11 Sep 2017 12:18:08 +0200
Message-ID: <0cd76127-0463-701d-6db8-8b752fb17032@suse.de>
References: <1505118623-3844-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1505118623-3844-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, SZ Lin <sz.lin@moxa.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

Hi,

Nit: $subject should use "dt-bindings:" prefix.

Am 11.09.2017 um 10:30 schrieb Fabrizio Castro:
> Add Silicon Storage Technology Inc. to the list of devicetree
> vendor prefixes.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 9f9a3d6..900c993 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -316,6 +316,7 @@ solomon        Solomon Systech Limited
>  sony	Sony Corporation
>  spansion	Spansion Inc.
>  sprd	Spreadtrum Communications Inc.
> +sst	Silicon Storage Technology, Inc.

Recurring question: What is this prefix being used for? This patch is
apparently not part of any series.

Otherwise looks okay,

Reviewed-by: Andreas Färber <afaerber@suse.de>

Regards,
Andreas

>  st	STMicroelectronics
>  starry	Starry Electronic Technology (ShenZhen) Co., LTD
>  startek	Startek

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
