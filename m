Return-Path: <SRS0=+YY4=PX=nvidia.com=skomatineni@kernel.org>
From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: RE: [PATCH V8 1/3] dt-bindings: mmc: tegra: Add supports-cqe property
Date: Tue, 15 Jan 2019 20:06:33 +0000
Message-ID: <BN7PR12MB2836F9781A77332B1C813B04C2810@BN7PR12MB2836.namprd12.prod.outlook.com>
References: <1547176135-2470-1-git-send-email-skomatineni@nvidia.com>
 <20190115200209.GA8473@bogus>
In-Reply-To: <20190115200209.GA8473@bogus>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Mikko Perttunen <mperttunen@nvidia.com>, "chunyan.zhang@unisoc.com" <chunyan.zhang@unisoc.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Aniruddha Tvs Rao <anrao@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1547582767; bh=8dI+2QAF0U3LjTqHgWZ1Gp4eGvtuhVGU38vlx4M4cSI=;
	h=X-PGP-Universal:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
	 x-ms-publictraffictype:x-microsoft-exchange-diagnostics:
	 x-ms-exchange-antispam-srfa-diagnostics:
	 x-forefront-antispam-report:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
	 x-forefront-prvs:received-spf:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam-message-info:spamdiagnosticoutput:
	 spamdiagnosticmetadata:MIME-Version:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	b=Y/I9QoalgPAZF7EC8J1YrU0VjmgUCINkyQW/clat+R0XYz/TLuq9NbuNGpfo0liIX
	 8VWopR1BJ1noS8vRUL+ZgZFS6b1FDe346K/z3tgV0u/ZPUpSaAunmfKVVy0cLeHg/K
	 IfxsTc7dQT38saLfI2E1eizM1RKGsmxiE8/ItGgTH54qGmBI/vqKlkqTWXtQ7KoyKC
	 CQAp+Rxbs9/14Cj42/ouzXYiqTQwDQgKtFqzLjDzH6UAzKEc1jlV4Q4mJyqJAPpyNp
	 7EyhDGK0abFNJsaP/qsYGxdAoI0+uFHPq/2hCz46T5tP6fZDxntjYZvDmT3J3TVpSI
	 sFfSIkSnSIKVg==


>> Add supports-cqe optional property for Tegra SDMMC.
>>=20
>> Tegra186 and Tegra194 supports HW Command queue only on SDMMC4=20
>> controller. This property is used to identify command queue support=20
>> controller in the tegra sdhci driver.
>>=20
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt | 4=20
>> ++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git=20
>> a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt=20
>> b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
>> index 32b4b4e41923..fb14c2c8d7ee 100644
>> --- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
>> +++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
>> @@ -72,6 +72,10 @@ Optional properties for Tegra210 and Tegra186:
>>  - nvidia,default-trim : Specify the default outbound clock trimmer
>>    value.
>>  - nvidia,dqs-trim : Specify DQS trim value for HS400 timing
>> +- supports-cqe : The presence of this property indicates that the
>> +  corresponding controller supports HW command queue feature.
>> +  Tegra186 and Tegra194 has 4 SDMMC Controllers and only SDMMC4
>> +  controller supports HW Command Queue with eMMC device.
>
>Don't SDHCI capability bits do this? If not, this should probably be commo=
n.
>
>Rob

Tegra has 4 SDMMC controllers and HW Command queue is supported only on SDM=
MC4.
There is no bit field specific in SDMMC4 alone to indicate this. So added s=
upports-cqe to
identifying this thru Device tree.

Thanks
Sowjanya
