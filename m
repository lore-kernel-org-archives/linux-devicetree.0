From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 3/3] extcon: arizona: Add DT binding examples
Date: Tue, 15 Dec 2015 10:00:26 +0900
Message-ID: <566F662A.8080601@samsung.com>
References: <1450089433-11398-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1450089433-11398-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1450089433-11398-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, robh@kernel.org
List-Id: devicetree@vger.kernel.org

On 2015=EB=85=84 12=EC=9B=94 14=EC=9D=BC 19:37, Charles Keepax wrote:
> Add an example for all elements of the Arizona extcon device tree
> binding.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  .../devicetree/bindings/extcon/extcon-arizona.txt  | 26 ++++++++++++=
++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.=
txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> index fd9b898..e27341f 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> @@ -47,3 +47,29 @@ Optional properties:
>      The third cell represents the value of the micd-pol-gpio pin.
> =20
>    - wlf,gpsw : Settings for the general purpose switch
> +
> +Example:
> +
> +codec: wm8280@0 {
> +	compatible =3D "wlf,wm8280";
> +	reg =3D <0>;
> +	...
> +
> +	wlf,use-jd2;
> +	wlf,use-jd2-nopull;
> +	wlf,jd-invert;
> +
> +	wlf,micd-software-compare;
> +	wlf,micd-detect-debounce =3D <0>;
> +	wlf,micd-pol-gpio =3D <&codec 2 0>;
> +	wlf,micd-rate =3D <ARIZONA_MICD_TIME_8MS>;
> +	wlf,micd-dbtime =3D <4>;
> +	wlf,micd-timeout-ms =3D <100>;
> +	wlf,micd-force-micbias;
> +	wlf,micd-configs =3D <
> +		0 1 0 /* MICDET1 MICBIAS1 GPIO=3Dlow */
> +		1 2 1 /* MICDET2 MICBIAS2 GPIO=3Dhigh */
> +	>;
> +
> +	wlf,gpsw =3D <0>;
> +};
>=20

Looks good to me. Applied it.

Thanks,
Chanwoo Choi
