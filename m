Return-Path: <SRS0=V9/Z=FV=nvidia.com=pchandru@kernel.org>
From: Preetham Chandru <pchandru@nvidia.com>
Subject: RE: [PATCH V7 1/7] dt-bindings: ahci-tegra: add binding documentation
Date: Tue, 27 Feb 2018 12:02:27 +0000
Message-ID: <2df3d2a9ba92468eb26748d89dbac066@bgmail102.nvidia.com>
References: <1518456406-21564-1-git-send-email-pchandru@nvidia.com>
 <1518456406-21564-2-git-send-email-pchandru@nvidia.com>
 <20180219024635.n6yaussnqdxuop5x@rob-hp-laptop>
In-Reply-To: <20180219024635.n6yaussnqdxuop5x@rob-hp-laptop>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: Rob Herring <robh@kernel.org>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "tj@kernel.org" <tj@kernel.org>, "cyndis@kapsi.fi" <cyndis@kapsi.fi>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "preetham260@gmail.com" <preetham260@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>, Venu Byravarasu <vbyravarasu@nvidia.com>, Pavan
List-ID: <devicetree@vger.kernel.org>



>-----Original Message-----
>From: Rob Herring [mailto:robh@kernel.org]
>Sent: Monday, February 19, 2018 8:17 AM
>To: Preetham Chandru <pchandru@nvidia.com>
>Cc: thierry.reding@gmail.com; tj@kernel.org; cyndis@kapsi.fi;
>mark.rutland@arm.com; devicetree@vger.kernel.org; preetham260@gmail.com;
>linux-tegra@vger.kernel.org; linux-ide@vger.kernel.org; Venu Byravarasu
><vbyravarasu@nvidia.com>; Pavan Kunapuli <pkunapuli@nvidia.com>
>Subject: Re: [PATCH V7 1/7] dt-bindings: ahci-tegra: add binding documenta=
tion
>
>On Mon, Feb 12, 2018 at 10:56:40PM +0530, Preetham Chandru Ramchandra
>wrote:
>> From: Preetham Ramchandra <pchandru@nvidia.com>
>>
>> This adds bindings documentation for the AHCI controller on Tegra210
>>
>> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
>> ---
>> v7:
>> * For Aux register set drop the Tegra210 since this register
>>   set also works on Tegra124
>> * rephrase the sentence for cml1 clock
>> * change the commit subject to include ahci-tegra
>> * drop pll_e since CCF handles it automatically as
>>   CML1 is a child clock of it.
>> v4:
>> * changed the commit message
>> * changed 'sata-cold' reset to mandatory for t210 and t124
>> * Removed the regulators for T210 since these regulators
>>   will be enabled in phy driver.
>> v3:
>> * Add AUX register.
>> v2:
>> * change cml1, pll_e and phy regulators as optional
>>   for T210.
>> ---
>>  .../bindings/ata/nvidia,tegra124-ahci.txt          | 35 ++++++++++++++-=
-------
>>  1 file changed, 22 insertions(+), 13 deletions(-)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
>> b/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
>> index 66c83c3e8915..0f4520a00716 100644
>> --- a/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
>> +++ b/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
>> @@ -1,20 +1,19 @@
>> -Tegra124 SoC SATA AHCI controller
>> +Tegra SoC SATA AHCI controller
>>
>>  Required properties :
>> -- compatible : For Tegra124, must contain "nvidia,tegra124-ahci".
>> Otherwise,
>> -  must contain '"nvidia,<chip>-ahci", "nvidia,tegra124-ahci"', where
>> <chip>
>> -  is tegra132.
>> -- reg : Should contain 2 entries:
>> +- compatible : Must be one of:
>> +  - Tegra124 : "nvidia,tegra124-ahci"
>> +  - Tegra210 : "nvidia,tegra210-ahci"
>
>Are you dropping T132?
>
Okay will add.

>> +- reg : Should contain 3 entries:
>
>You can't just add more entries to existing compatibles. Does this apply t=
o T124?
>
Will keep this as per Thierry's suggestion.

>>    - AHCI register set (SATA BAR5)
>>    - SATA register set
>> +  - AUX register set
>>  - interrupts : Defines the interrupt used by SATA
>>  - clocks : Must contain an entry for each entry in clock-names.
>>    See ../clocks/clock-bindings.txt for details.
>>  - clock-names : Must include the following entries:
>>    - sata
>>    - sata-oob
>> -  - cml1
>> -  - pll_e
>>  - resets : Must contain an entry for each entry in reset-names.
>>    See ../reset/reset.txt for details.
>>  - reset-names : Must include the following entries:
>> @@ -24,9 +23,19 @@ Required properties :
>>  - phys : Must contain an entry for each entry in phy-names.
>>    See ../phy/phy-bindings.txt for details.
>>  - phy-names : Must include the following entries:
>> -  - sata-phy : XUSB PADCTL SATA PHY
>> -- hvdd-supply : Defines the SATA HVDD regulator
>> -- vddio-supply : Defines the SATA VDDIO regulator
>> -- avdd-supply : Defines the SATA AVDD regulator
>> -- target-5v-supply : Defines the SATA 5V power regulator
>> -- target-12v-supply : Defines the SATA 12V power regulator
>> +  - For T124:
>> +    - sata-phy : XUSB PADCTL SATA PHY
>> +  - For T210:
>> +    - sata-0
>
>-names is kind of pointless for a single entry. Differing names is even mo=
re
>pointless.
>
Okay, will keep the name same as Tegra124 and move this to optional for T21=
0 alone . Will not try to change the t124 part to optional since it is alre=
ady present.

>> +- For T124:
>> +  - hvdd-supply : Defines the SATA HVDD regulator
>> +  - vddio-supply : Defines the SATA VDDIO regulator
>> +  - avdd-supply : Defines the SATA AVDD regulator
>> +  - target-5v-supply : Defines the SATA 5V power regulator
>> +  - target-12v-supply : Defines the SATA 12V power regulator
>
>No supplies on T210? The last 2 sound like board level supplies to the dri=
ve.
>
This first 3 are related to phy and will be taken care by uphy driver for t=
210 and the last two are going to the SATA connectors. These two are always=
 on for tegra210.
>> +
>> +Optional properties:
>> +- clock-names :
>> +  - cml1 :
>> +    cml1 clock should be defined here if the PHY driver
>> +    doesn't manage them. If it does, they should not be.
>> --
>> 2.7.4
>>
