From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 1/2] ARM: dt-bindings: aspeed: Facebook TiogaPass BMC
Date: Wed, 19 Sep 2018 18:34:07 +0200
Message-ID: <09e425e4-9199-dccd-a8ab-4fbd9f384677@suse.de>
References: <20180919162918.3994257-1-vijaykhemka@fb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919162918.3994257-1-vijaykhemka@fb.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, Florian Fainelli <f.fainelli@gmail.com>, Johan Hovold <johan@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi,

Subject should be "dt-bindings: Add vendor prefix for Facebook" or so.
Please compare other commits for that file.

Am 19.09.18 um 18:29 schrieb Vijay Khemka:
> Initial introduction of Facebook TiogaPass family equipped with
> Aspeed 2500 BMC SoC. TiogaPass is a x86 server development kit
> with a ASPEED ast2500 BMC manufactured by Facebook.
> 
> This adds an entry of Facebook in Documentation for vendor prefix

Lacking Signed-off-by.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 2c3fc512e746..0520303ee5b8 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -127,6 +127,7 @@ everspin	Everspin Technologies, Inc.
>  exar	Exar Corporation
>  excito	Excito
>  ezchip	EZchip Semiconductor
> +facebook	Facebook
>  fairphone	Fairphone B.V.
>  faraday	Faraday Technology Corporation
>  fastrax	Fastrax Oy

Otherwise looking better.

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
