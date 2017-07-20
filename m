From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH 0/5] AXP803 regulator support for Pine64 and SoPine
Date: Thu, 20 Jul 2017 21:12:27 +0800
Message-ID: <cf799802f412ad51a14091f4ee2bbaee@aosc.io>
References: <20170719161019.62133-1-icenowy@aosc.io>
 <CAGb2v67hcD=uihh8CCwiNEm-29vc=d4nrqJTm+CAtmg_sWu8Qw@mail.gmail.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBPOYYLFQKGQEZ5EMBDI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v67hcD=uihh8CCwiNEm-29vc=d4nrqJTm+CAtmg_sWu8Qw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: wens-jdAy2FN1RRM@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2017-07-20 12:11=EF=BC=8CChen-Yu Tsai =E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Jul 20, 2017 at 12:10 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>=20
> wrote:
>> The Pine64 and SoPine w/ baseboard boards have an AXP803 PMIC, and the
>> regulators of the PMIC are used.
>>=20
>> This patchset adds the regulators to the device tree of these two=20
>> boards.
>>=20
>> The first patch introduces proper AXP803 regulators to Pine64 DT, and=20
>> the
>> second patch removed dummy regulators in the Pine64 DT.
>>=20
>> The third patch enables AXP803 PMIC for SoPine.
>>=20
>> The fourth patch and fifth patch are like the first and the second,=20
>> but
>> they're for SoPine w/ baseboard.
>>=20
>> Icenowy Zheng (5):
>>   arm64: allwinner: a64: enable AXP803 regulators for Pine64
>>   arm: allwinner: a64: drop the dummy vcc3v3 regulator in Pine64 DT
>>   arm64: allwinner: a64: add AXP803 PMIC to SoPine DTSI
>>   arm64: allwinner: a64: add AXP803 regulators support for SoPine
>>   arm: allwinner: a64: drop vcc3v3 and vcc1v8 dummy regulators for
>>     SoPine
>=20
> The related drivers are all merged. There's really no reason to split
> these into separate patches. Patch 1 & 2 can be squashed together.
> Patch 3, 4 & 5 can be squashed together.
>=20
> The patches themselves look good, though I have not checked them
> against the schematics.

In fact I prefer to split out the patch that removes the dummy
regulators, but if you think squashing them is better, I will
do it.

Squash 3 into 4 is of course okay.

>=20
> ChenYu
>=20
>>=20
>>  .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 105=20
>> +++++++++++++++++++--
>>  .../dts/allwinner/sun50i-a64-sopine-baseboard.dts  |  34 +++++--
>>  .../boot/dts/allwinner/sun50i-a64-sopine.dtsi      |  91=20
>> ++++++++++++++++--
>>  3 files changed, 203 insertions(+), 27 deletions(-)
>>=20
>> --
>> 2.13.0
>>=20
>> --
>> You received this message because you are subscribed to the Google=20
>> Groups "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it, send=
=20
>> an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
