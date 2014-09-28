From: Jianqun <xjq@rock-chips.com>
Subject: Re: [PATCH 1/2] ASoC: rockchip-max98090: add documentation for rockchip-max98090
 driver
Date: Sun, 28 Sep 2014 19:05:10 +0800
Message-ID: <5427EB66.5090607@rock-chips.com>
References: <1410506806-15327-1-git-send-email-jay.xu@rock-chips.com> <1410507036-15442-1-git-send-email-jay.xu@rock-chips.com> <20140912134446.GT7960@sirena.org.uk> <54275C43.8010205@rock-chips.com> <20140928104851.GR27755@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140928104851.GR27755@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Jianqun <jay.xu@rock-chips.com>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, heiko@sntech.de, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, huangtao@rock-chips.com, cf@rock-chips.com
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 09/28/2014 06:48 PM, Mark Brown =E5=86=99=E9=81=93:
> On Sun, Sep 28, 2014 at 08:54:27AM +0800, Jianqun wrote:
>=20
> Please fix your mailer to word wrap within paragraphs.
>=20
>> =E5=9C=A8 09/12/2014 09:44 PM, Mark Brown =E5=86=99=E9=81=93:
>>> On Fri, Sep 12, 2014 at 03:30:36PM +0800, Jianqun wrote:
>>>> Add documentation for rockchip-max98090 driver, which is need by r=
ockchip
>>>> board using a max98090.
>=20
>>> Can this use simple-card (perhaps after a bit of extension)?
>> I haven't ever try simple-card, is there any sample usage for me fro=
m other vendor ?
>=20
> $ git grep -l simple-audio-card
> Documentation/devicetree/bindings/sound/simple-card.txt
> arch/arm/boot/dts/kirkwood-openrd-client.dts
> arch/arm/boot/dts/kirkwood-t5325.dts
> arch/arm/boot/dts/r8a7740-armadillo800eva-reference.dts
> arch/arm/boot/dts/sh73a0-kzm9g-reference.dts
> arch/arm/boot/dts/vf610-twr.dts
> sound/soc/generic/simple-card.c
>=20
thanks
>>>> +- rockchip,audio-codec : The phandle of the MAX98090 audio codec.
>=20
>>> Is the driver really specific to this CODEC?
>=20
>> I think yes, we need to add two gpio for mic and hp detect, but simp=
le-card driver hasn't them
>=20
> That'd be the "possibly with some extensions" bit then...  if they're
> just isolated GPIOs there's not really much board specific about havi=
ng
> them.
>=20
I'll try it first, thanks Mark

--=20
Jianqun Xu

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
