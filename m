From: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] MIPS: BMIPS: Add BCM6345 support
Date: Mon, 13 Jun 2016 08:09:12 +0200
Message-ID: <575E4E08.3070801@gmail.com>
References: <1464941524-3992-1-git-send-email-noltari@gmail.com>
 <1464941524-3992-2-git-send-email-noltari@gmail.com>
 <20160606135834.GA28996@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160606135834.GA28996@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org
List-Id: devicetree@vger.kernel.org



El 6/6/16 a las 15:58, Rob Herring escribi=F3:
> On Fri, Jun 03, 2016 at 10:12:03AM +0200, =C1lvaro Fern=E1ndez Rojas =
wrote:
>> BCM6345 has only one CPU, so SMP support must be disabled.
>>
>> Signed-off-by: =C1lvaro Fern=E1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/mips/brcm/soc.txt | 2 +-
>>  arch/mips/bmips/setup.c                             | 9 +++++++++
>>  2 files changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.txt b/D=
ocumentation/devicetree/bindings/mips/brcm/soc.txt
>> index 4a7e030..1936e8a 100644
>> --- a/Documentation/devicetree/bindings/mips/brcm/soc.txt
>> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.txt
>> @@ -4,7 +4,7 @@ Required properties:
>> =20
>>  - compatible: "brcm,bcm3384", "brcm,bcm33843"
>>                "brcm,bcm3384-viper", "brcm,bcm33843-viper"
>> -              "brcm,bcm6328", "brcm,bcm6358", "brcm,bcm6368",
>> +              "brcm,bcm6328", "brcm,bcm6345", "brcm,bcm6358", "brcm=
,bcm6368",
>>                "brcm,bcm63168", "brcm,bcm63268",
>>                "brcm,bcm7125", "brcm,bcm7346", "brcm,bcm7358", "brcm=
,bcm7360",
>>                "brcm,bcm7362", "brcm,bcm7420", "brcm,bcm7425"
>=20
> Are these all mutually exclusive? Please make that clear.
>=20

They are different CPUs so I guess they're are all mutually exclusive.

=C1lvaro.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
