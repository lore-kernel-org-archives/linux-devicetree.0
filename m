From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/4] soc: amlogic: meson-gx-socinfo: Add A1 and A113L IDs
Date: Tue, 3 Sep 2019 09:12:29 +0200
Message-ID: <42aac458-76ee-d35d-4d24-c0620ad4c00c@baylibre.com>
References: <1567493475-75451-1-git-send-email-jianxin.pan@amlogic.com>
 <1567493475-75451-2-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1567493475-75451-2-git-send-email-jianxin.pan@amlogic.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jianxin Pan <jianxin.pan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Tao Zeng <tao.zeng@amlogic.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 03/09/2019 08:51, Jianxin Pan wrote:
> Add the SoC IDs for the A113L Amlogic A1 SoC.
> 
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  drivers/soc/amlogic/meson-gx-socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
> index 6d0d04f..3c86d8d 100644
> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
> @@ -40,6 +40,7 @@ static const struct meson_gx_soc_id {
>  	{ "G12A", 0x28 },
>  	{ "G12B", 0x29 },
>  	{ "SM1", 0x2b },
> +	{ "A1", 0x2c },
>  };
>  
>  static const struct meson_gx_package_id {
> @@ -68,6 +69,7 @@ static const struct meson_gx_package_id {
>  	{ "S922X", 0x29, 0x40, 0xf0 },
>  	{ "A311D", 0x29, 0x10, 0xf0 },
>  	{ "S905X3", 0x2b, 0x5, 0xf },
> +	{ "A113L", 0x2c, 0x0, 0xf8 },
>  };
>  
>  static inline unsigned int socinfo_to_major(u32 socinfo)
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil
