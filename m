From: Jianqun <xjq@rock-chips.com>
Subject: Re: [PATCH 1/2] ASoC: rockchip-max98090: add documentation for rockchip-max98090
 driver
Date: Fri, 12 Sep 2014 18:12:10 +0800
Message-ID: <5412C6FA.9020308@rock-chips.com>
References: <1410507036-15442-1-git-send-email-jay.xu@rock-chips.com> <1410513055-17775-1-git-send-email-jay.xu@rock-chips.com> <3774516.jOvxH1lgyQ@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3774516.jOvxH1lgyQ@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Jianqun <jay.xu@rock-chips.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, huangtao@rock-chips.com, cf@rock-chips.com
List-Id: devicetree@vger.kernel.org



=E5=9C=A8 09/12/2014 06:04 PM, Heiko St=C3=BCbner =E5=86=99=E9=81=93:
> Hi Jianqun,
>=20
> Am Freitag, 12. September 2014, 17:10:55 schrieb Jianqun:
>> Add documentation for rockchip-max98090 driver, which is need by roc=
kchip
>> board using a max98090.
>>
>> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
>> ---
>> changes since v1:
>=20
> please make sure to also include the version in the patch subject, so=
 that
> people can always see which is which. This one should've been
>=20
> [PATCH v2 1/2] ASoC: rockchip-max98090: add documentation for rockchi=
p-max98090 driver
>=20
> Because without this identification, people can only try to guess whi=
ch one is the
> newest version.
>=20
ok, thanks, I will notice this in the future
>=20
> Heiko
>=20
>> - modify error text from "Tegra" to "rockchip"
>>
>>  .../sound/rockchip,rockchip-audio-max98090.txt     | 23
>> ++++++++++++++++++++++ 1 file changed, 23 insertions(+)
>>  create mode 100644
>> Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-max9=
8090.tx
>> t
>>
>> diff --git
>> a/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-ma=
x98090.
>> txt
>> b/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-ma=
x98090.
>> txt new file mode 100644
>> index 0000000..e12d1a0
>> --- /dev/null
>> +++
>> b/Documentation/devicetree/bindings/sound/rockchip,rockchip-audio-ma=
x98090.
>> txt @@ -0,0 +1,23 @@
>> +ROCKCHIP audio complex, with MAX98090 CODEC
>> +
>> +Required properties:
>> +- compatible : must be "rockchip,rockchip-audio-max98090"
>> +- rockchip,model : the user-visible name of this sound complex
>> +- rockchip,i2s-controller : The phandle of the rockchip I2S control=
ler
>> +  that's connected to the CODEC.
>> +- rockchip,audio-codec : The phandle of the MAX98090 audio codec.
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
>=20
>=20
>=20
>=20
