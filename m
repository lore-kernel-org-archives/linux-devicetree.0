Return-Path: <SRS0=/zWI=L3=hxt-semitech.com=dongsheng.wang@kernel.org>
From: "Wang, Dongsheng" <dongsheng.wang@hxt-semitech.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: qcom: Add binding for shared mdio
 bus
Date: Thu, 13 Sep 2018 15:19:37 +0000
Message-ID: <ac26ee89cb294ac6b656c47a45e52024@HXTBJIDCEMVIW02.hxtcorp.net>
References: <1536829493-10088-1-git-send-email-dongsheng.wang@hxt-semitech.com>
 <1536829493-10088-2-git-send-email-dongsheng.wang@hxt-semitech.com>
 <8b593839-2e81-e4d1-6574-5c4f66cf7b9c@kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Timur Tabi <timur@kernel.org>
Cc: "davem@davemloft.net" <davem@davemloft.net>, "Zheng, Joey" <yu.zheng@hxt-semitech.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On 9/13/2018 11:02 PM, Timur Tabi wrote:=0A=
> On 9/13/18 4:04 AM, Wang Dongsheng wrote:=0A=
>> This property copy from "ibm,emac.txt" to describe a shared MIDO bus.=0A=
>> Since QDF2400 emac include MDIO, so If the motherboard has more than one=
=0A=
>> PHY connected to an MDIO bus, this property will point to the MAC device=
=0A=
>> that has the MDIO bus.=0A=
>>=0A=
>> Signed-off-by: Wang Dongsheng<dongsheng.wang@hxt-semitech.com>=0A=
> The QDF2400 does not support device trees, so please don't talk about DT =
=0A=
> support in the context of the QDF2400.=0A=
>=0A=
Ok, remove QDF2400.=0A=
=0A=
s/QDF2400 emac/emac/=0A=
=0A=
=0A=
Cheers,=0A=
=0A=
-Dongsheng=0A=
=0A=
