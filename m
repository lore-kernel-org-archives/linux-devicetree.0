From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 1/4] extcon: arizona: Remove enable/disable of 32k clock
Date: Mon, 25 Jan 2016 15:24:13 +0900
Message-ID: <56A5BF8D.8070807@samsung.com>
References: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1452252582-20834-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, mturquette@baylibre.com, lee.jones@linaro.org
Cc: sboyd@codeaurora.org, myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On 2016=EB=85=84 01=EC=9B=94 08=EC=9D=BC 20:29, Charles Keepax wrote:
> The 32k clock is unconditionally enabled by the MFD core so there is =
no
> need to control it from the extcon device, so this patch removes the
> control of the 32k clock.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>=20
> No changes since v2.
>=20
> Thanks,
> Charles
>=20
>  drivers/extcon/extcon-arizona.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/extcon/extcon-arizona.c b/drivers/extcon/extcon-=
arizona.c
> index e4890dd..52d041f 100644
> --- a/drivers/extcon/extcon-arizona.c
> +++ b/drivers/extcon/extcon-arizona.c
> @@ -1571,7 +1571,6 @@ static int arizona_extcon_probe(struct platform=
_device *pdev)
>  		goto err_micdet;
>  	}
> =20
> -	arizona_clk32k_enable(arizona);
>  	regmap_update_bits(arizona->regmap, ARIZONA_JACK_DETECT_DEBOUNCE,
>  			   ARIZONA_JD1_DB, ARIZONA_JD1_DB);
>  	regmap_update_bits(arizona->regmap, ARIZONA_JACK_DETECT_ANALOGUE,
> @@ -1642,7 +1641,6 @@ static int arizona_extcon_remove(struct platfor=
m_device *pdev)
>  	cancel_delayed_work_sync(&info->hpdet_work);
>  	regmap_update_bits(arizona->regmap, ARIZONA_JACK_DETECT_ANALOGUE,
>  			   ARIZONA_JD1_ENA, 0);
> -	arizona_clk32k_disable(arizona);
> =20
>  	return 0;
>  }
>=20

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

If I apply only this patch on extcon tree,
the kernel build error will happen on other tree.
I think that this patch will go on clk tree and
then send pull request of immutable branch.

Thanks,
Chanwoo Choi
