From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 02/10] mfd: ac100: Add device tree bindings
 for X-Powers AC100 codec/RTC combo IC
Date: Wed, 15 Jun 2016 13:49:43 +0100
Message-ID: <20160615124943.GE4948@dell>
References: <1465986467-14802-1-git-send-email-wens@csie.org>
 <1465986467-14802-3-git-send-email-wens@csie.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <rtc-linux+bncBDA7X7F2WUEBBP45QW5QKGQEHJKITCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1465986467-14802-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 15 Jun 2016, Chen-Yu Tsai wrote:

> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/ac100.txt | 42 +++++++++++++++++++=
++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ac100.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/ac100.txt b/Documentat=
ion/devicetree/bindings/mfd/ac100.txt
> new file mode 100644
> index 000000000000..fbab623e6fba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ac100.txt
> @@ -0,0 +1,42 @@
> +X-Powers AC100 Codec/RTC IC device tree bindings
> +
> +AC100 is a audio codec and RTC subsystem combo IC. The 2 parts are
> +separated, including power supplies and interrupt lines, but share
> +a common register address space and host interface.
> +
> +Required properties:
> +- compatible: "x-powers,ac100"
> +- reg: The I2C slave address or RSB hardware address for the chip
> +- sub-nodes:
> +  - codec
> +    - compatible: "x-powers,ac100-codec"
> +    - interrupt-parent: The parent interrupt controller
> +    - interrupts: SoC NMI / GPIO interrupt connected to the IRQ_AUDIO pi=
n
> +  - rtc
> +    - compatible: "x-powers,ac100-rtc"
> +    - interrupt-parent: The parent interrupt controller
> +    - interrupts: SoC NMI / GPIO interrupt connected to the IRQ_RTC pin
> +    - #clock-cells: shall be 1
> +    - clock-output-names: "cko1_rtc", "cko2_rtc", "cko3_rtc"
> +    - see clock/clock-bindings.txt for common clock bindings
> +
> +Example:
> +
> +ac100: codec@e89 {
> +	compatible =3D "x-powers,ac100";
> +	reg =3D <0xe89>;
> +
> +	ac100_codec {
> +		compatible =3D "x-powers,ac100-codec";
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	ac100_rtc {
> +		compatible =3D "x-powers,ac100-rtc";
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;

Isn't this the same interrupt as above?  Is it shared?

> +		#clock-cells =3D <1>;
> +		clock-output-names =3D "cko1_rtc", "cko2_rtc", "cko3_rtc";
> +	};
> +};

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

--=20
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
---=20
You received this message because you are subscribed to the Google Groups "=
rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
