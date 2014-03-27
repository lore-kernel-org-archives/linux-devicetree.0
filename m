From: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [PATCH] ARM: imx6/dt: add ccm dependency upon ckil, ckih1 and
 osc clocks
Date: Thu, 27 Mar 2014 09:39:04 +0100
Message-ID: <5333E3A8.3050405@gmail.com>
References: <5333DA13.2080505@gmail.com>
 <1395907913-23808-1-git-send-email-b.brezillon.dev@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1395907913-23808-1-git-send-email-b.brezillon.dev@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris BREZILLON <brezillonboris@gmail.com>, Fabio Estevam <festevam@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Boris BREZILLON <b.brezillon.dev@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Sascha Hauer <kernel@pengutronix.de>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Le 27/03/2014 09:11, Boris BREZILLON a =E9crit :
> Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
> ---
>   arch/arm/boot/dts/imx6qdl.dtsi |    4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.d=
tsi
> index cfc85be..060e94c 100644
> --- a/arch/arm/boot/dts/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> @@ -62,16 +62,19 @@
>   =

>   		ckil {
Oops.
You'll have to change this line into the line below in order to be able =

to reference this clk.

                           ckil: ckil {
>   			compatible =3D "fsl,imx-ckil", "fixed-clock";
> +			#clock-cells =3D <0>;
>   			clock-frequency =3D <32768>;
>   		};
>   =

>   		ckih1 {
ditto
>   			compatible =3D "fsl,imx-ckih1", "fixed-clock";
> +			#clock-cells =3D <0>;
>   			clock-frequency =3D <0>;
>   		};
>   =

>   		osc {
ditto
>   			compatible =3D "fsl,imx-osc", "fixed-clock";
> +			#clock-cells =3D <0>;
>   			clock-frequency =3D <24000000>;
>   		};
>   	};
> @@ -489,6 +492,7 @@
>   				interrupts =3D <0 87 IRQ_TYPE_LEVEL_HIGH>,
>   					     <0 88 IRQ_TYPE_LEVEL_HIGH>;
>   				#clock-cells =3D <1>;
> +				clocks =3D <&ckil &ckih1 &osc>;
>   			};
>   =

>   			anatop: anatop@020c8000 {
