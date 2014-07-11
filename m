From: Jianqun <xjq@rock-chips.com>
Subject: Re: randconfig build error with next-20140710, in sound/soc/rockchip/rockchip_i2s.c
Date: Fri, 11 Jul 2014 08:13:12 +0800
Message-ID: <53BF2C18.10808@rock-chips.com>
References: <CA+r1ZhgB=BG5jsSaWBLMvRUjZ=X4gKJzv6KysyvPSOtFuUTbng@mail.gmail.com> <53BF2AB8.7050307@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <53BF2AB8.7050307@rock-chips.com>
Sender: linux-next-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>, sfr@canb.auug.org.au, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, Heiko <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

Dear Heiko:

=46YI

On 2014=E5=B9=B407=E6=9C=8811=E6=97=A5 08:07, Jianqun wrote:
> Hi Heiko:
>=20
> Is it caused by the headfile ?
> #include <linux/module.h>
>=20
> Adviced by the maintainers, I tried not to include the headfile one b=
y one, then to compile
> driver each time, I found that is success to compile it without modul=
e.h, of course
> I just compiled driver with command "ARCH=3Darm".
>=20
> Look up the codes, I found the functions like
> 	MODULE_DESCRIPTION
> will be defined as
> 	#define MODULE_DESCRIPTION(x)	/* x */
> so the code in rockchip iis driver
> 	"MODULE_DESCRIPTION("ROCKCHIP IIS ASoC Interface") "
> will be defined as
> 	"ROCKCHIP IIS ASoC Interface"
> that should cause the error while robot to compile.
>=20
> Am I right ?
>=20
> If it is, do I need to make a new patch or just reply to the mail ? o=
r how ...
>=20
>=20
> On 2014=E5=B9=B407=E6=9C=8810=E6=97=A5 21:53, Jim Davis wrote:
>> Building with the attached random configuration file,
>>
>> sound/soc/rockchip/rockchip_i2s.c:526:20: error: expected declaratio=
n specifiers
>>  or =E2=80=98...=E2=80=99 before string constant
>>  MODULE_DESCRIPTION("ROCKCHIP IIS ASoC Interface");
>>                     ^
>> sound/soc/rockchip/rockchip_i2s.c:527:15: error: expected declaratio=
n specifiers
>>  or =E2=80=98...=E2=80=99 before string constant
>>  MODULE_AUTHOR("jianqun <jay.xu@rock-chips.com>");
>>                ^
>> sound/soc/rockchip/rockchip_i2s.c:528:16: error: expected declaratio=
n specifiers
>>  or =E2=80=98...=E2=80=99 before string constant
>>  MODULE_LICENSE("GPL v2");
>>                 ^
>> sound/soc/rockchip/rockchip_i2s.c:529:14: error: expected declaratio=
n specifiers
>>  or =E2=80=98...=E2=80=99 before string constant
>>  MODULE_ALIAS("platform:" DRV_NAME);
>>               ^
>> sound/soc/rockchip/rockchip_i2s.c:530:1: warning: data definition ha=
s no type or
>>  storage class [enabled by default]
>>  MODULE_DEVICE_TABLE(of, rockchip_i2s_match);
>>  ^
>> sound/soc/rockchip/rockchip_i2s.c:530:1: error: type defaults to =E2=
=80=98int=E2=80=99
>> in declaration of =E2=80=98MODULE_DEVICE_TABLE=E2=80=99 [-Werror=3Di=
mplicit-int]
>> sound/soc/rockchip/rockchip_i2s.c:530:1: warning: parameter names (w=
ithout types
>> ) in function declaration [enabled by default]
>> cc1: some warnings being treated as errors
>> make[3]: *** [sound/soc/rockchip/rockchip_i2s.o] Error 1
>>
>=20

--=20
-------------
=E8=AE=B8 =E5=89=91 =E7=BE=A4 Jay
Rockchip Electronics Co.Ltd
***********************************************************************=
*****
*IMPORTANT NOTICE:*This email is from Fuzhou Rockchip Electronics Co.,
Ltd .The contents of this email and any attachments may contain
information that is privileged, confidential and/or exempt from
disclosure under applicable law and relevant NDA. If you are not the
intended recipient, you are hereby notified that any disclosure,
copying, distribution, or use of the information is STRICTLY PROHIBITED=
=2E
Please immediately contact the sender as soon as possible and destroy
the material in its entirety in any format. Thank you.
***********************************************************************=
*****
