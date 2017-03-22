From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: add regulator info for Kevin
 digitizer
Date: Wed, 22 Mar 2017 09:26:41 +0100
Message-ID: <20415662.PctC9IM4SC@phil>
References: <20170320235344.126298-1-briannorris@chromium.org>
 <20170320235344.126298-5-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20170320235344.126298-5-briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Montag, 20. M=E4rz 2017, 16:53:44 CET schrieb Brian Norris:
> We need to enable this regulator before the digitizer can be used. Wacom
> recommended waiting for 100 ms before talking to the HID.
> =

> Signed-off-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> v3:
>  * reintroduced into patch set; bindings are in linux-next
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts index
> 2f720cf2fd07..f4714c4606f3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts
> @@ -232,6 +232,9 @@ ap_i2c_dig: &i2c2 {

according to the hid-over-i2c binding, this should use a special compatible =

like

	compatible =3D "wacom,w9013", "hid-over-i2c"

As the binding patch is from Caesar, I assume that is the Kevin component a=
nd
I can add that myself, just need confirmation that this is actually the cor=
rect =

component :-) .


Thanks
Heiko

>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&cpu1_dig_irq_l &cpu1_dig_pdct_l>;
> =

> +		vdd-supply =3D <&p3_3v_dig>;
> +		post-power-on-delay-ms =3D <100>;
> +
>  		interrupt-parent =3D <&gpio2>;
>  		interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
