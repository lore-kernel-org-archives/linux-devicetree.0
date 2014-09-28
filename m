From: Jianqun <xjq@rock-chips.com>
Subject: Re: [PATCH 1/2] ASoC: rockchip-max98090: add documentation for rockchip-max98090
 driver
Date: Sun, 28 Sep 2014 08:54:27 +0800
Message-ID: <54275C43.8010205@rock-chips.com>
References: <1410506806-15327-1-git-send-email-jay.xu@rock-chips.com> <1410507036-15442-1-git-send-email-jay.xu@rock-chips.com> <20140912134446.GT7960@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140912134446.GT7960@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Jianqun <jay.xu@rock-chips.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, heiko@sntech.de, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, huangtao@rock-chips.com, cf@rock-chips.com
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 09/12/2014 09:44 PM, Mark Brown =E5=86=99=E9=81=93:
> On Fri, Sep 12, 2014 at 03:30:36PM +0800, Jianqun wrote:
>> Add documentation for rockchip-max98090 driver, which is need by roc=
kchip
>> board using a max98090.
>=20
> Can this use simple-card (perhaps after a bit of extension)?
I haven't ever try simple-card, is there any sample usage for me from o=
ther vendor ?
>=20
>> +- rockchip,audio-codec : The phandle of the MAX98090 audio codec.
>=20
> Is the driver really specific to this CODEC?
I think yes, we need to add two gpio for mic and hp detect, but simple-=
card driver hasn't them
>=20
>> +
>> +Optional properties:
>> +- rockchip,hp-det-gpios : The GPIO that detect headphones are plugg=
ed in
>> +- rockchip,mic-det-gpios : The GPIO that detect micphones are plugg=
ed in
>> +
>> +Example:
>> +
>> +sound {
>> +	compatible =3D "rockchip,rockchip-audio-max98090";
>> +	rockchip,model =3D "ROCKCHIP-I2S";
>> +	rockchip,i2s-controller =3D <&i2s>;
>> +	rockchip,audio-codec =3D <&max98090>;
>> +	rockchip,hp-det-gpios =3D <&gpio6 5 GPIO_ACTIVE_HIGH>;
>> +	rockchip,mic-det-gpios =3D <&gpio6 11 GPIO_ACTIVE_HIGH>;
>> +};
>> --=20
>> 1.9.1
>>
>>
>>

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
