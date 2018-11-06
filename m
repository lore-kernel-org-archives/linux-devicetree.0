From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] arm64: dts: r8a77990: ebisu: Add serial console pins
Date: Tue, 6 Nov 2018 05:22:35 +0000
Message-ID: <OSBPR01MB2293633CF9C7102B8251D261D8CB0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181105213859.11408-1-marek.vasut+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181105213859.11408-1-marek.vasut+renesas@gmail.com>
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

> From: Marek Vasut, Sent: Tuesday, November 6, 2018 6:39 AM
> 
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds pin control for SCIF2 on R8A77990 E3 Ebisu.
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

Best regards,
Yoshihiro Shimoda


>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index f342dd85b152..611f0265fcc5 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -321,6 +321,11 @@
>  		function = "pwm5";
>  	};
> 
> +	scif2_pins: scif2 {
> +		groups = "scif2_data_a";
> +		function = "scif2";
> +	};
> +
>  	usb0_pins: usb {
>  		groups = "usb0_b";
>  		function = "usb0";
> @@ -352,6 +357,9 @@
>  };
> 
>  &scif2 {
> +	pinctrl-0 = <&scif2_pins>;
> +	pinctrl-names = "default";
> +
>  	status = "okay";
>  };
> 
> --
> 2.18.0
