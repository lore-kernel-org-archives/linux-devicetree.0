From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] MIPS: BMIPS: Add BCM6345 support
Date: Mon, 6 Jun 2016 08:58:34 -0500
Message-ID: <20160606135834.GA28996@rob-hp-laptop>
References: <1464941524-3992-1-git-send-email-noltari@gmail.com>
 <1464941524-3992-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1464941524-3992-2-git-send-email-noltari@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ralf@linux-mips.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, simon@fire.lp0.eu
List-Id: devicetree@vger.kernel.org

On Fri, Jun 03, 2016 at 10:12:03AM +0200, =C1lvaro Fern=E1ndez Rojas wr=
ote:
> BCM6345 has only one CPU, so SMP support must be disabled.
>=20
> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari@gmail.com>
> ---
>  Documentation/devicetree/bindings/mips/brcm/soc.txt | 2 +-
>  arch/mips/bmips/setup.c                             | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/Do=
cumentation/devicetree/bindings/mips/brcm/soc.txt
> index 4a7e030..1936e8a 100644
> --- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
> @@ -4,7 +4,7 @@ Required properties:
> =20
>  - compatible: "brcm,bcm3384", "brcm,bcm33843"
>                "brcm,bcm3384-viper", "brcm,bcm33843-viper"
> -              "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6368",
> +              "brcm,bcm6328", "brcm,bcm6345", "brcm,bcm6358", "brcm,=
bcm6368",
>                "brcm,bcm63168", "brcm,bcm63268",
>                "brcm,bcm7125", "brcm,bcm7346", "brcm,bcm7358", "brcm,=
bcm7360",
>                "brcm,bcm7362", "brcm,bcm7420", "brcm,bcm7425"

Are these all mutually exclusive? Please make that clear.
