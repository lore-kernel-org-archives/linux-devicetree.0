From: Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 1/2 v2] dt-bindings: qoriq-clock: Add coreclk
Date: Mon, 27 Mar 2017 03:39:42 +0000
Message-ID: <DB6PR0402MB2837A1C0A3B832AB50774177F3330@DB6PR0402MB2837.eurprd04.prod.outlook.com>
References: <1489977443-33582-1-git-send-email-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489977443-33582-1-git-send-email-andy.tang-3arQi8VN3Tc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org" <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: "sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

PING!

Regards,
Yuantian

> -----Original Message-----
> From: Yuantian Tang [mailto:andy.tang-3arQi8VN3Tc@public.gmane.org]
> Sent: Monday, March 20, 2017 10:37 AM
> To: mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
> Cc: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org;
> linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; Scott Wood;
> Andy Tang
> Subject: [PATCH 1/2 v2] dt-bindings: qoriq-clock: Add coreclk
>=20
> From: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
>=20
> ls1012a has separate input root clocks for core PLLs versus the platform =
PLL,
> with the latter described as sysclk in the hw docs.
> Update the qoriq-clock binding to allow a second input clock, named
> "coreclk".  If present, this clock will be used for the core PLLs.
>=20
> Signed-off-by: Scott Wood <oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org>
> Signed-off-by: Tang Yuantian <andy.tang-3arQi8VN3Tc@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
