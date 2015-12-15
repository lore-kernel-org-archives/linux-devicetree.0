From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 2/3] extcon: arizona: Update device tree binding for mic
 detect configurations
Date: Tue, 15 Dec 2015 10:00:10 +0900
Message-ID: <566F661A.4010503@samsung.com>
References: <1450089433-11398-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1450089433-11398-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1450089433-11398-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com, robh@kernel.org
List-Id: devicetree@vger.kernel.org

On 2015=EB=85=84 12=EC=9B=94 14=EC=9D=BC 19:37, Charles Keepax wrote:
> Update the device tree binding documentation to include documentation=
 for
> the wlf,micd-configs property that is used to specify the configurati=
ons
> for headset polarity detection (CTIA / OTMP).
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>=20
> No changes since v1.
>=20
> Thanks,
> Charles
>=20
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
> =20
>    - wlf,gpsw : Settings for the general purpose switch
>=20

Applied it.

Thanks,
Chanwoo Choi
