From: Andy Tang <andy.tang@nxp.com>
Subject: RE: [PATCH 1/2 v2] dt-bindings: qoriq-clock: Add coreclk
Date: Mon, 24 Apr 2017 03:14:44 +0000
Message-ID: <DB6PR0402MB2837F82134ADCBAC53ECC51FF31F0@DB6PR0402MB2837.eurprd04.prod.outlook.com>
References: <1489977443-33582-1-git-send-email-andy.tang@nxp.com>
 <DB6PR0402MB283701D478A1678D28894C77F30A0@DB6PR0402MB2837.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@codeaurora.org" <sboyd@codeaurora.org>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Scott Wood <oss@buserror.net>
List-Id: devicetree@vger.kernel.org

Does anyone give me a clue why this patch set can't be responded after so l=
ong time?

Thanks,
Andy

-----Original Message-----
From: Andy Tang=20
Sent: Monday, April 17, 2017 9:37 AM
To: 'mturquette@baylibre.com' <mturquette@baylibre.com>; 'sboyd@codeaurora.=
org' <sboyd@codeaurora.org>
Cc: 'robh+dt@kernel.org' <robh+dt@kernel.org>; 'mark.rutland@arm.com' <mark=
.rutland@arm.com>; 'linux-clk@vger.kernel.org' <linux-clk@vger.kernel.org>;=
 'devicetree@vger.kernel.org' <devicetree@vger.kernel.org>; 'linux-kernel@v=
ger.kernel.org' <linux-kernel@vger.kernel.org>; 'linux-arm-kernel@lists.inf=
radead.org' <linux-arm-kernel@lists.infradead.org>; 'Scott Wood' <oss@buser=
ror.net>
Subject: RE: [PATCH 1/2 v2] dt-bindings: qoriq-clock: Add coreclk

Hi Stephen and Michael,

This patch set has been pending for more than two months since it was first=
 sent.
I have not received any response from you until now.

Could you give some comments on it?

Regards,
Andy

-----Original Message-----
From: Andy Tang
Sent: Wednesday, April 05, 2017 2:16 PM
To: mturquette@baylibre.com; sboyd@codeaurora.org
Cc: robh+dt@kernel.org; mark.rutland@arm.com; linux-clk@vger.kernel.org; de=
vicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-kernel@li=
sts.infradead.org; Scott Wood <oss@buserror.net>
Subject: RE: [PATCH 1/2 v2] dt-bindings: qoriq-clock: Add coreclk

Hello=20

Do you have any comments on this patch set which was acked by Rob?

Regards,
Andy

> -----Original Message-----
> From: Yuantian Tang [mailto:andy.tang@nxp.com]
> Sent: Monday, March 20, 2017 10:37 AM
> To: mturquette@baylibre.com
> Cc: sboyd@codeaurora.org; robh+dt@kernel.org; mark.rutland@arm.com;=20
> linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-=20
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Scott=20
> Wood <oss@buserror.net>; Andy Tang <andy.tang@nxp.com>
> Subject: [PATCH 1/2 v2] dt-bindings: qoriq-clock: Add coreclk
>=20
> From: Scott Wood <oss@buserror.net>
>=20
> ls1012a has separate input root clocks for core PLLs versus the=20
> platform PLL, with the latter described as sysclk in the hw docs.
> Update the qoriq-clock binding to allow a second input clock, named=20
> "coreclk".  If present, this clock will be used for the core PLLs.
>=20
> Signed-off-by: Scott Wood <oss@buserror.net>
> Signed-off-by: Tang Yuantian <andy.tang@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> v2:
> 	-- change the author to Scott
>  Documentation/devicetree/bindings/clock/qoriq-clock.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> index aa3526f..119cafd 100644
> --- a/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/qoriq-clock.txt
> @@ -56,6 +56,11 @@ Optional properties:
>  - clocks: If clock-frequency is not specified, sysclk may be provided
>  	as an input clock.  Either clock-frequency or clocks must be
>  	provided.
> +	A second input clock, called "coreclk", may be provided if
> +	core PLLs are based on a different input clock from the
> +	platform PLL.
> +- clock-names: Required if a coreclk is present.  Valid names are
> +	"sysclk" and "coreclk".
>=20
>  2. Clock Provider
>=20
> @@ -72,6 +77,7 @@ second cell is the clock index for the specified type.
>  	2	hwaccel		index (n in CLKCGnHWACSR)
>  	3	fman		0 for fm1, 1 for fm2
>  	4	platform pll	0=3Dpll, 1=3Dpll/2, 2=3Dpll/3, 3=3Dpll/4
> +	5	coreclk		must be 0
>=20
>  3. Example
>=20
> --
> 2.1.0.27.g96db324

