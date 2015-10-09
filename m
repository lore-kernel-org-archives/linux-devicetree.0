From: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH v4 4/6] pinctrl: dt-binding: document berlin4ct SoC
 pinctrl
Date: Fri, 9 Oct 2015 11:05:47 +0200
Message-ID: <20151009090547.GD2842@kwain>
References: <1444378629-3057-1-git-send-email-jszhang@marvell.com>
 <1444378629-3057-5-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444378629-3057-5-git-send-email-jszhang@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>
Cc: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org, antoine.tenart@free-electrons.com, catalin.marinas@arm.com, will.deacon@arm.com, mark.rutland@arm.com, robh+dt@kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 04:17:07PM +0800, Jisheng Zhang wrote:
> Add berlin4ct to existing berlin pinctrl device tree binding.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>

Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>

> ---
>  Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt | 5 +++=
+-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl=
=2Etxt b/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
> index a8bb5e2..f8fa28c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/berlin,pinctrl.txt
> @@ -20,7 +20,10 @@ Required properties:
>  	"marvell,berlin2cd-soc-pinctrl",
>  	"marvell,berlin2cd-system-pinctrl",
>  	"marvell,berlin2q-soc-pinctrl",
> -	"marvell,berlin2q-system-pinctrl"
> +	"marvell,berlin2q-system-pinctrl",
> +	"marvell,berlin4ct-avio-pinctrl",
> +	"marvell,berlin4ct-soc-pinctrl",
> +	"marvell,berlin4ct-system-pinctrl"
> =20
>  Required subnode-properties:
>  - groups: a list of strings describing the group names.
> --=20
> 2.6.1
>=20

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
