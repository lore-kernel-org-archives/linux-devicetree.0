From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add vendor prefix for Catalyst
 Semiconductor
Date: Sat, 19 Jan 2019 12:30:14 +0100
Message-ID: <a5349edd-015f-75da-c47d-90e931f99d43@suse.de>
References: <20190118194812.3319-1-martyn.welch@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190118194812.3319-1-martyn.welch@collabora.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Christian Hemp <c.hemp@phytec.de>, =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <s.riedmueller@phytec.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Martyn,

Am 18.01.19 um 20:48 schrieb Martyn Welch:
> Add vendor prefix "catalyst" for Catalyst Semiconductor which is
> already in use but undocumented.
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes in v2: None
> 
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 389508584f48..d80b23b7771f 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -65,6 +65,7 @@ bticino Bticino International
>  calxeda	Calxeda
>  capella	Capella Microsystems, Inc
>  cascoda	Cascoda, Ltd.
> +catalyst	Catalyst Semiconductor, Inc

"Inc" surely is an abbreviation for "Incorporated", so can you please
follow the below examples of writing "Inc." with trailing dot?

>  cavium	Cavium, Inc.
>  cdns	Cadence Design Systems Inc.
>  cdtech	CDTech(H.K.) Electronics Limited

Otherwise looks good. Thanks for fixing the undocumented use.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
