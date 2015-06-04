From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] ARM: at91: dt: sama5d4ek: mci0 uses slot 0
Date: Thu, 4 Jun 2015 10:06:28 +0200
Message-ID: <55700704.2020907@atmel.com>
References: <1432806916-23579-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1432806916-23579-1-git-send-email-ludovic.desroches@atmel.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: plagnioj@jcrosoft.com, alexandre.belloni@free-electrons.com
List-Id: devicetree@vger.kernel.org

Le 28/05/2015 11:55, Ludovic Desroches a =E9crit :
> mci0 uses slot 0 not 1.
> =

> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> Fixes: 7a4752677c44 ("ARM: at91: dt: add device tree file for SAMA5D4ek
> board")

Yes:
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Queued in at91-4.2-dt.

Thanks, bye.

> ---
>  arch/arm/boot/dts/at91-sama5d4ek.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/arm/boot/dts/at91-sama5d4ek.dts b/arch/arm/boot/dts/at9=
1-sama5d4ek.dts
> index 89ef4a5..45e7761 100644
> --- a/arch/arm/boot/dts/at91-sama5d4ek.dts
> +++ b/arch/arm/boot/dts/at91-sama5d4ek.dts
> @@ -108,8 +108,8 @@
>  			mmc0: mmc@f8000000 {
>  				pinctrl-names =3D "default";
>  				pinctrl-0 =3D <&pinctrl_mmc0_clk_cmd_dat0 &pinctrl_mmc0_dat1_3 &pinc=
trl_mmc0_cd>;
> -				slot@1 {
> -					reg =3D <1>;
> +				slot@0 {
> +					reg =3D <0>;
>  					bus-width =3D <4>;
>  					cd-gpios =3D <&pioE 5 0>;
>  				};
> =



-- =

Nicolas Ferre
