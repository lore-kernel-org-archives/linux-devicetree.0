From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 4/4] dt-bindings: mfd: s2mps11: Add support S2MPU02 PMIC
Date: Thu, 29 May 2014 10:55:29 +0200
Message-ID: <1401353729.25628.13.camel@AMDC1943>
References: <1401275411-21947-5-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1401275411-21947-5-git-send-email-cw00.choi@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: sbkim73@samsung.com, sameo@linux.intel.com, lee.jones@linaro.org, broonie@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, myungjoo.ham@samsung.com, kyungmin.park@samsung.com, jonghwa3.lee@samsung.com, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On =C5=9Bro, 2014-05-28 at 20:10 +0900, Chanwoo Choi wrote:
> This patch add documentation for S2MPU02 PMIC device. S2MPU02 has a l=
ittle
> difference from S2MPS11/S2MPS14 PMIC and has LDO[1-28]/Buck[1-7].
>=20
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: Kumar Gala <galak@codeaurora.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Mark Brown <broonie@linaro.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Yadwinder Singh Brar <yadi.brar@samsung.com>
> Cc: Tomasz Figa <t.figa@samsung.com>
> Cc: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
>=20
> ---
> Documentation/devicetree/bindings/mfd/s2mps11.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Although I'm not a DT maintainer but this looks fine to me, so:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

>=20
> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Docu=
mentation/devicetree/bindings/mfd/s2mps11.txt
> index d81ba30..f7c9180 100644
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> @@ -1,5 +1,5 @@
> =20
> -* Samsung S2MPS11 and S2MPS14 Voltage and Current Regulator
> +* Samsung S2MPS11, S2MPS14 and S2MPU02 Voltage and Current Regulator
> =20
>  The Samsung S2MPS11 is a multi-function device which includes voltag=
e and
>  current regulators, RTC, charger controller and other sub-blocks. It=
 is
> @@ -7,7 +7,8 @@ interfaced to the host controller using an I2C interf=
ace. Each sub-block is
>  addressed by the host system using different I2C slave addresses.
> =20
>  Required properties:
> -- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps14-p=
mic".
> +- compatible: Should be "samsung,s2mps11-pmic" or "samsung,s2mps14-p=
mic"
> +              or "samsung,s2mpu02-pmic".
>  - reg: Specifies the I2C slave address of the pmic block. It should =
be 0x66.
> =20
>  Optional properties:
> @@ -81,11 +82,13 @@ as per the datasheet of s2mps11.
>  		  - valid values for n are:
>  			- S2MPS11: 1 to 38
>  			- S2MPS14: 1 to 25
> +			- S2MPU02: 1 to 28
>  		  - Example: LDO1, LD02, LDO28
>  	- BUCKn
>  		  - valid values for n are:
>  			- S2MPS11: 1 to 10
>  			- S2MPS14: 1 to 5
> +			- S2MPU02: 1 to 7
>  		  - Example: BUCK1, BUCK2, BUCK9
> =20
>  Example:

