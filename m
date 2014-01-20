From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH] dt-bindings: add rockchip vendor prefix
Date: Mon, 20 Jan 2014 15:23:14 +0100
Message-ID: <2229282.4AAJ7iLdU7@phil>
References: <201312201626.48119.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201312201626.48119.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, arm@kernel.org
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Freitag, 20. Dezember 2013, 16:26:47 schrieb Heiko St=FCbner:
> It seems I forgot to add the vendor prefix for rockchip to the vendor=
-prefix
> list. Therefore add it now.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

not sure, where this should go through
arm-soc? or is there a special dt-tree around?


Thanks
Heiko

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> b/Documentation/devicetree/bindings/vendor-prefixes.txt index
> ca2c190..2dc3b75 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -65,6 +65,7 @@ ralink	Mediatek/Ralink Technology Corp.
>  ramtron	Ramtron International
>  realtek Realtek Semiconductor Corp.
>  renesas	Renesas Electronics Corporation
> +rockchip	Fuzhou Rockchip Electronics Co., Ltd
>  samsung	Samsung Semiconductor
>  sbs	Smart Battery System
>  schindler	Schindler
