From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for Amlogic NAND controller
 driver
Date: Sun, 20 Jan 2019 16:06:05 +0100
Message-ID: <20190120160605.33689354@xps13>
References: <1547917355-13179-1-git-send-email-jianxin.pan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1547917355-13179-1-git-send-email-jianxin.pan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, linux-mtd@lists.infradead.org, Liang Yang <liang.yang@amlogic.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>, Jian Hu <jian.hu@amlogic.com>, Hanjie Lin <hanjie.lin@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jianxin,

Jianxin Pan <jianxin.pan@amlogic.com> wrote on Sun, 20 Jan 2019
01:02:35 +0800:

> Add entry for Amlogic NAND controller driver and its bindings[0].
> 
> [0] https://lore.kernel.org/lkml/1547566684-57472-1-git-send-email-jianxin.pan@amlogic.com/
> 
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>

If you are the author of the patch your Signed-off-by should come first.

Also, why is Liang the Maintainer? Why not you?

> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0abecc5..7d976a1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9628,6 +9628,13 @@ F:	drivers/media/platform/meson/ao-cec.c
>  F:	Documentation/devicetree/bindings/media/meson-ao-cec.txt
>  T:	git git://linuxtv.org/media_tree.git
>  
> +MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
> +M:	Liang Yang <liang.yang@amlogic.com>
> +L:	linux-mtd@lists.infradead.org
> +S:	Maintained
> +F:	drivers/mtd/nand/raw/meson_*
> +F:	Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
> +
>  MICROBLAZE ARCHITECTURE
>  M:	Michal Simek <monstr@monstr.eu>
>  W:	http://www.monstr.eu/fdt/

Thanks,
Miquèl
