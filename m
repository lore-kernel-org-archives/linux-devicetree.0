From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 5/6] extcon: arizona: Add device binding for second jack
 detect pin on GPIO5
Date: Fri, 11 Sep 2015 17:07:30 +0900
Message-ID: <55F28BC2.3060704@samsung.com>
References: <1441885307-24499-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1441885307-24499-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1441885307-24499-5-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, lee.jones@linaro.org
Cc: myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On 2015=EB=85=84 09=EC=9B=94 10=EC=9D=BC 20:41, Charles Keepax wrote:
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  drivers/extcon/extcon-arizona.c |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-=
arizona.c
> index 34b5a3b..5fbe893 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -1233,6 +1233,11 @@ static int arizona_extcon_device_get_pdata(str=
uct arizona *arizona)
> =20
>  	device_property_read_u32(arizona->dev, "wlf,gpsw", &pdata->gpsw);
> =20
> +	pdata->jd_gpio5 =3D device_property_read_bool(arizona->dev,
> +						    "wlf,use-jd-gpio");
> +	pdata->jd_gpio5_nopull =3D device_property_read_bool(arizona->dev,
> +						"wlf,use-jd-gpio-nopull");
> +
>  	return 0;
>  }
> =20
>=20

I'd like you to add the patch description.

If you add the description, you can add the my ack messageL
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
