From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/2] extcon: arizona: Update device tree binding for mic
 detect configurations
Date: Mon, 14 Dec 2015 11:03:58 +0900
Message-ID: <566E238E.4050007@samsung.com>
References: <1449767299-29691-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1449767299-29691-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1449767299-29691-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Hi Charles,

On 2015=EB=85=84 12=EC=9B=94 11=EC=9D=BC 02:08, Charles Keepax wrote:
> Update the device tree binding documentation to include documentation=
 for
> the wlf,micd-configs property that is used to specify the configurati=
ons
> for headset polarity detection (CTIA / OTMP).
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  Documentation/devicetree/bindings/extcon/extcon-arizona.txt | 8 ++++=
++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.=
txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> index 238e10e..fd9b898 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> @@ -37,5 +37,13 @@ Optional properties:
>      milliseconds.
>    - wlf,micd-force-micbias : Force MICBIAS continuously on during mi=
crophone
>      detection.
> +  - wlf,micd-configs : Headset polarity configurations (generally us=
ed for
> +    detection of CTIA / OMTP headsets), the field can be of variable=
 length
> +    but should always be a multiple of 3 cells long, each three cell=
 group
> +    represents one polarity configuration.
> +    The first cell defines the accessory detection pin, zero will us=
e MICDET1
> +    and all other values will use MICDET2.
> +    The second cell represents the MICBIAS to be used.
> +    The third cell represents the value of the micd-pol-gpio pin.

I think that you better to add the example using the 'wlf,micd-configs'
to improve the understanding of using this property.
because the number of 'wlf,micd-configs' value is not fixed.

Also,
How about do you add the real example for all arizona properties on sep=
arate patch?

Thanks,
Chanwoo Choi

> =20
>    - wlf,gpsw : Settings for the general purpose switch
>=20
