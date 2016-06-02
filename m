From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] extcon: arizona: Update binding docs to mention new
 defines for GPSW
Date: Thu, 02 Jun 2016 10:56:51 +0900
Message-ID: <574F9263.80503@samsung.com>
References: <CGME20160601151314epcas1p2f8947d634e4afbe414d174b3b057fbd8@epcas1p2.samsung.com>
 <1464793992-20670-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1464793992-20670-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, myungjoo.ham@samsung.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Hi Charles,

On 2016=EB=85=84 06=EC=9B=94 02=EC=9D=BC 00:13, Charles Keepax wrote:
> Update the binding documentation to mention the defines added for the
> possible values of wlf,gpsw.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  Documentation/devicetree/bindings/extcon/extcon-arizona.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-arizona.=
txt b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> index e27341f..7f3d94a 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> +++ b/Documentation/devicetree/bindings/extcon/extcon-arizona.txt
> @@ -46,7 +46,8 @@ Optional properties:
>      The second cell represents the MICBIAS to be used.
>      The third cell represents the value of the micd-pol-gpio pin.
> =20
> -  - wlf,gpsw : Settings for the general purpose switch
> +  - wlf,gpsw : Settings for the general purpose switch, set as one o=
f the
> +    ARIZONA_GPSW_XXX defines.
> =20
>  Example:
> =20
>=20

Applied it.

Thanks,
Chanwoo Choi
