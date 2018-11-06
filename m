From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 2/2] arm64: dts: r8a77990: ebisu: Enable SDHI interfaces
Date: Tue, 6 Nov 2018 05:29:15 +0000
Message-ID: <OSBPR01MB2293D944698EE5776B23B00DD8CB0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181105214117.11734-1-marek.vasut+renesas@gmail.com>
 <20181105214117.11734-2-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181105214117.11734-2-marek.vasut+renesas@gmail.com>
Content-Language: ja-JP
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Vasut <marek.vasut@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: TAKESHI KIHARA <takeshi.kihara.df@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa@the-dreams.de>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Vasut <marek.vasut+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello Marek-san,

> From: Marek Vasut, Sent: Tuesday, November 6, 2018 6:41 AM
> 
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch enables SD card slot connected to SDHI0, micro SD card slot
> connected to SDHI1 and eMMC connected to SDHI3 on the Ebisu board using
> the R8A77990 SoC.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I have a few nit comments below.

>  .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index 611f0265fcc5..bda1765dcdbd 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
<snip>
> +	sdhi3_pins: sd3 {
> +		groups = "sdhi3_data8", "sdhi3_ctrl";
> +		function = "sdhi3";
> +		power-source = <1800>;
> +	};
> +
> +	sdhi3_pins_uhs: sd3_uhs {
> +		groups = "sdhi3_data8", "sdhi3_ctrl";
> +		function = "sdhi3";
> +		power-source = <1800>;
> +	};

I assumed that we will add "sdhi3_ds" into these groups when we add support for HS400 mode.

Best regards,
Yoshihiro Shimoda
