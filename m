From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH] ARM: DT: ifc6410: Add board memory range.
Date: Wed, 17 Sep 2014 12:03:37 -0700
Message-ID: <FA9D8682-DB0E-48CF-A519-86A0465300E1@codeaurora.org>
References: <1410932179-4652-1-git-send-email-srinivas.kandagatla@linaro.org> <54192B64.6070604@smartplayin.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <54192B64.6070604@smartplayin.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Sep 16, 2014, at 11:34 PM, Pramod Gurav <pramod.gurav@smartplayin.co=
m> wrote:

> Hi Srini,
>=20
> Thanks for the patch.
> Tested-by: Pramod Gurav <pramod.gurav@smartplayin.com>
>=20
> A minor nit.
> On Wednesday 17 September 2014 11:06 AM, Srinivas Kandagatla wrote:
>> This patch adds memory details of IFC6410 as this is necessary to
>> fix the in-correct memory start comming from ATAGs.
>>=20
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>> arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 5 +++++
>> 1 file changed, 5 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/b=
oot/dts/qcom-apq8064-ifc6410.dts
>> index 90db8af..3287f12 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
>> @@ -4,6 +4,11 @@
>> 	model =3D "Qualcomm APQ8064/IFC6410";
>> 	compatible =3D "qcom,apq8064-ifc6410", "qcom,apq8064";
>>=20
>> +	memory{
> Space before {?
>> +		device_type =3D "memory";
>> +		reg =3D <0x80000000 0x80000000>;
>> +	};
>> +
>> 	soc {
>> 		gsbi@16600000 {
>> 			status =3D "ok=94;

Hmm, this doesn=92t seem to work for me.

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
