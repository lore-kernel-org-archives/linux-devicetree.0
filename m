From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/6] extcon: arizona: Additional settings to improve
 accuracy of HP detect
Date: Fri, 11 Sep 2015 17:16:20 +0900
Message-ID: <55F28DD4.3070303@samsung.com>
References: <1441885307-24499-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1441885307-24499-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1441885307-24499-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, lee.jones@linaro.org
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On 2015=EB=85=84 09=EC=9B=94 10=EC=9D=BC 20:41, Charles Keepax wrote:
> If the TST_CAP_SEL bits aren't set correctly on wm5110/8280 there wil=
l
> be a 100k load along side the headphones, which will affect the accur=
ary
> towards the very top of the detection range. This patch sets those bi=
ts.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/extcon/extcon-arizona.c |   19 +++++++++++++++++--
>  1 files changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-=
arizona.c
> index b48fb29..7bfaacd 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -43,6 +43,9 @@
>  #define ARIZONA_MICD_CLAMP_MODE_JDL_GP5H 0x9
>  #define ARIZONA_MICD_CLAMP_MODE_JDH_GP5H 0xb
> =20
> +#define ARIZONA_TST_CAP_DEFAULT 0x3
> +#define ARIZONA_TST_CAP_CLAMP   0x1
> +
>  #define ARIZONA_HPDET_MAX 10000
> =20
>  #define HPDET_DEBOUNCE 500
> @@ -147,6 +150,7 @@ static void arizona_extcon_hp_clamp(struct arizon=
a_extcon_info *info,
>  {
>  	struct arizona *arizona =3D info->arizona;
>  	unsigned int mask =3D 0, val =3D 0;
> +	unsigned int cap_sel =3D 0;
>  	int ret;
> =20
>  	switch (arizona->type) {
> @@ -154,10 +158,21 @@ static void arizona_extcon_hp_clamp(struct ariz=
ona_extcon_info *info,
>  	case WM8280:
>  		mask =3D ARIZONA_HP1L_SHRTO | ARIZONA_HP1L_FLWR |
>  		       ARIZONA_HP1L_SHRTI;
> -		if (clamp)
> +		if (clamp) {
>  			val =3D ARIZONA_HP1L_SHRTO;
> -		else
> +			cap_sel =3D ARIZONA_TST_CAP_CLAMP;
> +		} else {
>  			val =3D ARIZONA_HP1L_FLWR | ARIZONA_HP1L_SHRTI;
> +			cap_sel =3D ARIZONA_TST_CAP_DEFAULT;
> +		}
> +
> +		ret =3D regmap_update_bits(arizona->regmap,
> +					 ARIZONA_HP_TEST_CTRL_1,
> +					 ARIZONA_HP1_TST_CAP_SEL_MASK,
> +					 cap_sel);
> +		if (ret !=3D 0)
> +			dev_warn(arizona->dev,
> +				 "Failed to set TST_CAP_SEL: %d\n", ret);
>  		break;
>  	default:
>  		mask =3D ARIZONA_RMV_SHRT_HP1L;
>=20

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
