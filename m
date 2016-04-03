From: Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH] bmips: rename BCM63168 to BCM63268
Date: Sun, 3 Apr 2016 15:41:22 +0100
Message-ID: <57012B92.6040102@simon.arlott.org.uk>
References: <1459684846-11308-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1459684846-11308-1-git-send-email-noltari@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com
List-Id: devicetree@vger.kernel.org

On 03/04/16 13:00, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> BCM63168 and BCM63268 are very similar and Broadcom refers to them as=
 BCM63268

They are practically the same but they both exist.

> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> index 38b5bd5..bfee6ea 100644
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -112,10 +112,10 @@ static void bcm6368_quirks(void)
>  static const struct bmips_quirk bmips_quirk_list[] =3D {
>  	{ "brcm,bcm3384-viper",		&bcm3384_viper_quirks		},
>  	{ "brcm,bcm33843-viper",	&bcm3384_viper_quirks		},
> +	{ "brcm,bcm63268",		&bcm6368_quirks			},
>  	{ "brcm,bcm6328",		&bcm6328_quirks			},
>  	{ "brcm,bcm6358",		&bcm6358_quirks			},
>  	{ "brcm,bcm6368",		&bcm6368_quirks			},
> -	{ "brcm,bcm63168",		&bcm6368_quirks			},

You can add "brcm,bcm63268" but you can't remove support for
"brcm,bcm63168".

>  	{ },
>  };
> =20
>=20

--=20
Simon Arlott
