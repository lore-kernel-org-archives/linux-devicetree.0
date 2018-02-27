Return-Path: <SRS0=V9/Z=FV=nvidia.com=pchandru@kernel.org>
From: Preetham Chandru <pchandru@nvidia.com>
Subject: RE: [PATCH V7 1/7] dt-bindings: ahci-tegra: add binding documentation
Date: Tue, 27 Feb 2018 12:05:03 +0000
Message-ID: <f0ead054d8e94cf0a3a01b27a64eaa5d@bgmail102.nvidia.com>
References: <1518456406-21564-1-git-send-email-pchandru@nvidia.com>
 <1518456406-21564-2-git-send-email-pchandru@nvidia.com>
 <20180219142733.GC11455@ulmo>
In-Reply-To: <20180219142733.GC11455@ulmo>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "tj@kernel.org" <tj@kernel.org>, "cyndis@kapsi.fi" <cyndis@kapsi.fi>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "preetham260@gmail.com" <preetham260@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>, Venu Byravarasu <vbyravarasu@nvidia.com>, Pavan
List-ID: <devicetree@vger.kernel.org>



>-----Original Message-----
>From: Thierry Reding [mailto:thierry.reding@gmail.com]
>Sent: Monday, February 19, 2018 7:58 PM
>To: Preetham Chandru <pchandru@nvidia.com>
>Cc: tj@kernel.org; cyndis@kapsi.fi; robh+dt@kernel.org;
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
>
>Please avoid lines that are too short. They shouldn't exceed 72 characters=
, but
>you're supposed to make fully use of those. Also the above is a sentence, =
so
>should end with a '.'.
>
okay
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
>> +- reg : Should contain 3 entries:
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
>> +- For T124:
>
>Can we please use TegraXYZ here? I find it useful to be consistent here be=
cause
>those will show up if I grep for "tegra", whereas TXYZ won't.
>
okay
>Thierry
