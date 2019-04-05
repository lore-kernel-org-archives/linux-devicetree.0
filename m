From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 4/5] dt-bindings: vendor-prefixes: add AZW
Date: Fri, 5 Apr 2019 13:42:08 +0100
Message-ID: <3c59976a-6155-5eb2-b922-1fa53e78ebab@arm.com>
References: <20190405122446.2101-1-peron.clem@gmail.com>
 <20190405122446.2101-4-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405122446.2101-4-peron.clem@gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 05/04/2019 13:24, Clément Péron wrote:
> Shenzhen AZW Technology Co. Ltd. is a manufacturer specialized in Android
> smart TV boxes, Intel mini PCs and home cloud TV boxes with NAS.
> 
> Add the vendor prefix for AZW.

Yay, I've been hacking on a Beelink A1 so this will be one less patch to 
worry about if I ever get it finished enough to upstream :)

(I had picked "beelink" as a prefix, but I guess "azw" does seem more 
appropriate to cover their OEM stuff as well, so there's no good reason 
to treat the in-house brand specially)

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>   Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 8b4ae37629b2..8313edbaf52e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -54,6 +54,7 @@ avic	Shanghai AVIC Optoelectronics Co., Ltd.
>   avnet	Avnet, Inc.
>   axentia	Axentia Technologies AB
>   axis	Axis Communications AB
> +azw     Shenzhen AZW Technology Co., Ltd.
>   bananapi BIPAI KEJI LIMITED
>   bhf	Beckhoff Automation GmbH & Co. KG
>   bitmain	Bitmain Technologies
> 
