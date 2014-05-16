From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH v2 1/2] of: add mundoreader and radxa vendor prefixes
Date: Fri, 16 May 2014 12:09:04 +0200
Message-ID: <2536935.asXUKXC7IY@phil>
References: <1399396211-25353-1-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1399396211-25353-1-git-send-email-b.galvani@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Beniamino Galvani <b.galvani@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Beniamino,

Am Dienstag, 6. Mai 2014, 19:10:10 schrieb Beniamino Galvani:
> Add new vendor prefixes for:
> 
>     * Mundo Reader S.L., a company that produces tablets and e-readers
>     * Radxa, manufacturer of ARM boards
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>

Just FYI, I've sent both patches off, as part of my dt changes pull request on 
monday.


Heiko

> ---
> 
> v2:
>  - use mundoreader prefix instead of bq as suggested by Heiko Stuebner
> 
>  Documentation/devicetree/bindings/vendor-prefixes.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> b/Documentation/devicetree/bindings/vendor-prefixes.txt index
> abc3080..53bd92f 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -79,6 +79,7 @@ microchip	Microchip Technology Inc.
>  mosaixtech	Mosaix Technologies, Inc.
>  moxa	Moxa
>  mpl	MPL AG
> +mundoreader	Mundo Reader S.L.
>  mxicy	Macronix International Co., Ltd.
>  national	National Semiconductor
>  neonode		Neonode Inc.
> @@ -98,6 +99,7 @@ powervr	PowerVR (deprecated, use img)
>  qca	Qualcomm Atheros, Inc.
>  qcom	Qualcomm Technologies, Inc
>  qnap	QNAP Systems, Inc.
> +radxa	Radxa
>  raidsonic	RaidSonic Technology GmbH
>  ralink	Mediatek/Ralink Technology Corp.
>  ramtron	Ramtron International

