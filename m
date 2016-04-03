From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bmips: rename BCM63168 to BCM63268
Date: Sun, 3 Apr 2016 11:31:55 -0700
Message-ID: <5701619B.3090504@gmail.com>
References: <1459684846-11308-1-git-send-email-noltari@gmail.com>
 <57012B92.6040102@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57012B92.6040102-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 03/04/2016 07:41, Simon Arlott a =C3=A9crit :
> On 03/04/16 13:00, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> BCM63168 and BCM63268 are very similar and Broadcom refers to them a=
s BCM63268
>=20
> They are practically the same but they both exist.
>=20
>> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
>> index 38b5bd5..bfee6ea 100644
>> --- a/arch/mips/bmips/setup.c
>> +++ b/arch/mips/bmips/setup.c
>> @@ -112,10 +112,10 @@ static void bcm6368_quirks(void)
>>  static const struct bmips_quirk bmips_quirk_list[] =3D {
>>  	{ "brcm,bcm3384-viper",		&bcm3384_viper_quirks		},
>>  	{ "brcm,bcm33843-viper",	&bcm3384_viper_quirks		},
>> +	{ "brcm,bcm63268",		&bcm6368_quirks			},
>>  	{ "brcm,bcm6328",		&bcm6328_quirks			},
>>  	{ "brcm,bcm6358",		&bcm6358_quirks			},
>>  	{ "brcm,bcm6368",		&bcm6368_quirks			},
>> -	{ "brcm,bcm63168",		&bcm6368_quirks			},
>=20
> You can add "brcm,bcm63268" but you can't remove support for
> "brcm,bcm63168".

Agreed, this cannot be removed now.
--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
