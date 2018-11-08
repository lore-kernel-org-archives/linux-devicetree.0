From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add vendor prefix for Smartlabs
Date: Thu, 8 Nov 2018 18:07:13 +0100
Message-ID: <c3c6ecbb-13c3-79ac-7587-c41b1d49bc42@suse.de>
References: <1541691207-24768-1-git-send-email-christianshewitt@gmail.com>
 <1541696475-27454-1-git-send-email-christianshewitt@gmail.com>
 <1541696475-27454-2-git-send-email-christianshewitt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541696475-27454-2-git-send-email-christianshewitt@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am 08.11.18 um 18:01 schrieb Christian Hewitt:
> Smartlabs are a professional integrator of Interactive TV solutions
> and IPTV/VOD devices.
> 
> [1] (https://www.smartlabs.tv/en/about/)

"[1]" is not referenced anywhere, so you could just as well use a plain
link?

> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 4b1a2a8..4e087f9 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -357,6 +357,7 @@ sirf	SiRF Technology, Inc.
>  sis	Silicon Integrated Systems Corp.
>  sitronix	Sitronix Technology Corporation
>  skyworks	Skyworks Solutions, Inc.
> +smartlabs	Smartlabs

"SmartLabs LLC" according to your link above!

Otherwise looks okay.

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
