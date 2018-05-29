From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: imx6dl-riotboard: fix OTG regulator
 polarity
Date: Tue, 29 May 2018 09:59:27 -0300
Message-ID: <CAOMZO5CORkXJ9zu8qRZm2JGvdPjJM1Gg40sgk7gox9Yh3gYYkQ@mail.gmail.com>
References: <20180529062021.3154-1-akurz@blala.de>
 <20180529062021.3154-5-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180529062021.3154-5-akurz@blala.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Kurz <akurz@blala.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 29, 2018 at 3:20 AM, Alexander Kurz <akurz@blala.de> wrote:
> USB OTG power is switched on when the GPIO is pulled low.
>
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  arch/arm/boot/dts/imx6dl-riotboard.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/imx6dl-riotboard.dts b/arch/arm/boot/dts/imx6dl-riotboard.dts
> index a6851bfebbdb..89b06e20480d 100644
> --- a/arch/arm/boot/dts/imx6dl-riotboard.dts
> +++ b/arch/arm/boot/dts/imx6dl-riotboard.dts
> @@ -70,8 +70,7 @@
>                 regulator-name = "usb_otg_vbus";
>                 regulator-min-microvolt = <5000000>;
>                 regulator-max-microvolt = <5000000>;
> -               gpio = <&gpio3 22 GPIO_ACTIVE_HIGH>;
> -               enable-active-high;
> +               gpio = <&gpio3 22 GPIO_ACTIVE_LOW>;

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
