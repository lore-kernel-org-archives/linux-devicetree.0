From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH] ARM: dts: qcom: Update msm8960 device trees
Date: Wed, 28 May 2014 15:18:51 -0500
Message-ID: <7C29E7CF-F9A4-4BCE-99AC-2C12FD22258F@codeaurora.org>
References: <1401301643-20191-1-git-send-email-galak@codeaurora.org> <20140528200948.GI2012@joshc.qualcomm.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20140528200948.GI2012@joshc.qualcomm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Josh Cartwright <joshc@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, David Brown <davidb@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On May 28, 2014, at 3:09 PM, Josh Cartwright <joshc@codeaurora.org> wro=
te:

> On Wed, May 28, 2014 at 01:27:23PM -0500, Kumar Gala wrote:
>> * Move SoC peripherals into an SoC container node
>> * Move serial enabling into board file (qcom-msm8960-cdp.dts)
>> * Cleanup cpu node to match binding spec, enable-method and compatib=
le
>>  should be per cpu, not part of the container
>> * Drop interrupts property from l2-cache node as its not part of the
>>  binding spec
>>=20
>> Signed-off-by: Kumar Gala <galak@codeaurora.org>
>> ---
>> arch/arm/boot/dts/qcom-msm8960-cdp.dts |   6 ++
>> arch/arm/boot/dts/qcom-msm8960.dtsi    | 165 +++++++++++++++++------=
----------
>> 2 files changed, 93 insertions(+), 78 deletions(-)
>>=20
>> diff --git a/arch/arm/boot/dts/qcom-msm8960-cdp.dts b/arch/arm/boot/=
dts/qcom-msm8960-cdp.dts
>> index a58fb88..8e77ed7 100644
>> --- a/arch/arm/boot/dts/qcom-msm8960-cdp.dts
>> +++ b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
>> @@ -3,4 +3,10 @@
>> / {
>> 	model =3D "Qualcomm MSM8960 CDP";
>> 	compatible =3D "qcom,msm8960-cdp", "qcom,msm8960";
>> +
>> +	soc {
>> +		serial@16440000 {
>> +			status =3D "ok";
>> +		};
>> +	};
>> };
>=20
> Is now the time put these serial nodes under a GSBI parent node?

Yeah, I=92ll make the change to the 8960 & 8660 dts

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
