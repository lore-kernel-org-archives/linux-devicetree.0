From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] ARM: at91/dt: ov2640: add hsync/vsync-active property
Date: Mon, 21 Sep 2015 16:20:17 +0200
Message-ID: <56001221.6020604@atmel.com>
References: <1442575702-22315-1-git-send-email-josh.wu@atmel.com>
 <55FC1B12.8000703@atmel.com> <55FF5B34.8040500@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55FF5B34.8040500@atmel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Wu <josh.wu@atmel.com>
Cc: linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Kumar Gala <galak@codeaurora.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Le 21/09/2015 03:19, Josh Wu a =E9crit :
> Hi, Nicolas
>=20
> On 9/18/2015 10:09 PM, Nicolas Ferre wrote:
>> Le 18/09/2015 13:28, Josh Wu a =E9crit :
>>> On at91sam9x5ek/at91sam9m10g45ek/sama5d3xek boards, we use the para=
llel
>>> connection for ov2640. So we must set the hsync/vsync property (1 m=
eans
>>> active high).
>>> Otherwise, the connection would be seen as BT.656 or BT.1120.
>>>
>>> Signed-off-by: Josh Wu <josh.wu@atmel.com>
>> Hi Josh,
>>
>> Does this patch apply because of the new enhancement that you had
>> proposed in "media: atmel-isi: parse the DT parameters for
>> vsync/hsync/pixclock polarity" or does it apply even before?
>> Is it a fix that applies to older kernels?
> It's is a fix, according to the dt binding of video interface.
> So it should be applied before:
>=20
> "media: atmel-isi: parse the DT parameters for
> vsync/hsync/pixclock polarity".
>=20
>=20
> it has no impact in older kernel as the driver doesn't parse that=20
> property yet.
>=20
>>
>> So, should I wait for the enhancements to enter media git tree or ca=
n I
>> take them anyway?
>=20
> yes, you can take it without waiting for the media tree. Thanks.

=46air enough.

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Thanks for the information. Bye,

> Best Regards,
> Josh Wu
>=20
>>
>> Bye,
>>
>>> ---
>>>
>>>   arch/arm/boot/dts/at91sam9m10g45ek.dts | 2 ++
>>>   arch/arm/boot/dts/at91sam9x5ek.dtsi    | 2 ++
>>>   arch/arm/boot/dts/sama5d3xmb.dtsi      | 2 ++
>>>   3 files changed, 6 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/at91sam9m10g45ek.dts b/arch/arm/boot=
/dts/at91sam9m10g45ek.dts
>>> index d1ae60a..9d16ef8 100644
>>> --- a/arch/arm/boot/dts/at91sam9m10g45ek.dts
>>> +++ b/arch/arm/boot/dts/at91sam9m10g45ek.dts
>>> @@ -198,6 +198,8 @@
>>>   					isi_0: endpoint {
>>>   						remote-endpoint =3D <&ov2640_0>;
>>>   						bus-width =3D <8>;
>>> +						vsync-active =3D <1>;
>>> +						hsync-active =3D <1>;
>>>   					};
>>>   				};
>>>   			};
>>> diff --git a/arch/arm/boot/dts/at91sam9x5ek.dtsi b/arch/arm/boot/dt=
s/at91sam9x5ek.dtsi
>>> index d237c46..479f200 100644
>>> --- a/arch/arm/boot/dts/at91sam9x5ek.dtsi
>>> +++ b/arch/arm/boot/dts/at91sam9x5ek.dtsi
>>> @@ -66,6 +66,8 @@
>>>   					isi_0: endpoint@0 {
>>>   						remote-endpoint =3D <&ov2640_0>;
>>>   						bus-width =3D <8>;
>>> +						vsync-active =3D <1>;
>>> +						hsync-active =3D <1>;
>>>   					};
>>>   				};
>>>   			};
>>> diff --git a/arch/arm/boot/dts/sama5d3xmb.dtsi b/arch/arm/boot/dts/=
sama5d3xmb.dtsi
>>> index 83bee7a..8901042 100644
>>> --- a/arch/arm/boot/dts/sama5d3xmb.dtsi
>>> +++ b/arch/arm/boot/dts/sama5d3xmb.dtsi
>>> @@ -87,6 +87,8 @@
>>>   					isi_0: endpoint {
>>>   						remote-endpoint =3D <&ov2640_0>;
>>>   						bus-width =3D <8>;
>>> +						vsync-active =3D <1>;
>>> +						hsync-active =3D <1>;
>>>   					};
>>>   				};
>>>   			};
>>>
>>
>=20
>=20


--=20
Nicolas Ferre
