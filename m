From: =?ISO-8859-1?Q?Emilio_L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: fixed-rate: use full DT node name
Date: Sat, 15 Feb 2014 12:18:00 -0300
Message-ID: <52FF8528.2020404@elopez.com.ar>
References: <1392358613-19962-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392358613-19962-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Stephen,

El 14/02/14 03:16, Stephen Warren escribi=F3:
> clk-fixed-rate currently names clocks according to a node's name with=
out
> the unit address. When faced with the legal and technically correct D=
T
> structure below, this causes rgistration attempts for 3 clocks with t=
he
> same name, 2 of which fail.
>
> 	clocks {
> 		compatible =3D "simple-bus";
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
>
> 		clk_mmc: clock@0 {
> 			compatible =3D "fixed-clock";
> 			reg =3D <0>;
> ...
> 		clk_i2c: clock@1 {
> 			compatible =3D "fixed-clock";
> 			reg =3D <1>;
> ...
> 		clk_spi: clock@2 {
> 			compatible =3D "fixed-clock";
> 			reg =3D <2>;
> ...
>
> Solve this by naming the clocks after the full node name rather than =
the
> short version (e.g. /clocks/clock@0).

An alternative that doesn't require any change in the driver would be t=
o=20
use the optional but recommended clock-output-names property from the=20
common clock binding.

Your DT would then look something like the following

 > ...
 > 		clk_mmc: clk@0 {
 > 			compatible =3D "fixed-clock";
 > 			clock-output-names =3D "mmc";
 > ...
 > 		clk_i2c: clk@1 {
 > 			compatible =3D "fixed-clock";
 > 			clock-output-names =3D "i2c";
 > ...
 > 		clk_spi: clk@2 {
 > 			compatible =3D "fixed-clock";
 > 			clock-output-names =3D "spi";
 > ...

Cheers,

Emilio
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
