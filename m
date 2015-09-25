From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/6] extcon: arizona: Add device binding for the general
 purpose switch
Date: Fri, 25 Sep 2015 09:54:46 +0900
Message-ID: <56049B56.3050508@samsung.com>
References: <1442397404-7579-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1442397404-7579-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1442397404-7579-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, lee.jones@linaro.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Charles,

On 2015=EB=85=84 09=EC=9B=94 16=EC=9D=BC 18:56, Charles Keepax wrote:
> The switch is generally used in conjunction with the MICDET clamp to
> suppress pops and clicks associated with jack insertion. This patch a=
dds
> a binding that allows the user to select the mode of operation for th=
is
> switch.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/extcon/extcon-arizona.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-=
arizona.c
> index 869a920..5b4bc2f 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -1230,6 +1230,8 @@ static int arizona_extcon_device_get_pdata(stru=
ct arizona *arizona)
>  	pdata->micd_software_compare =3D device_property_read_bool(arizona-=
>dev,
>  						"wlf,micd-software-compare");
> =20
> +	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
> +
>  	return 0;
>  }
> =20
>=20

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
