From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v3 1/3] dt-bindings: Add vendor prefix for Smartlabs LLC
Date: Fri, 9 Nov 2018 19:29:28 +0100
Message-ID: <ae4a4f99-eecc-7a71-5007-d171449c8619@suse.de>
References: <1541691207-24768-1-git-send-email-christianshewitt@gmail.com>
 <1541706240-30036-1-git-send-email-christianshewitt@gmail.com>
 <1541706240-30036-2-git-send-email-christianshewitt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541706240-30036-2-git-send-email-christianshewitt@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am 08.11.18 um 20:43 schrieb Christian Hewitt:
> Smartlabs LLC are a professional integrator of Interactive TV solutions
> and IPTV/VOD devices (https://www.smartlabs.tv/en/about/).
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 4b1a2a8..c424fe0 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -357,6 +357,7 @@ sirf	SiRF Technology, Inc.
>  sis	Silicon Integrated Systems Corp.
>  sitronix	Sitronix Technology Corporation
>  skyworks	Skyworks Solutions, Inc.
> +smartlabs	Smartlabs LLC

You added the LLC but did not upper-case the L - intentional?

Regards,
Andreas

>  smsc	Standard Microsystems Corporation
>  snps	Synopsys, Inc.
>  socionext	Socionext Inc.
> 


-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
