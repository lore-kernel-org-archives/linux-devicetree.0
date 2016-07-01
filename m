From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/7] mfd: ac100: Add device tree bindings
 for X-Powers AC100 codec/RTC combo IC
Date: Fri, 1 Jul 2016 09:40:50 +0100
Message-ID: <20160701084050.GI1707@dell>
References: <1467302331-9663-1-git-send-email-wens@csie.org>
 <1467302331-9663-2-git-send-email-wens@csie.org>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <rtc-linux+bncBDA7X7F2WUEBBXWY3C5QKGQENQ2WUWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1467302331-9663-2-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 30 Jun 2016, Chen-Yu Tsai wrote:

> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
> Changes since v3:
>=20
>   - Fixed device node names and added labels.
>   - Added clock output from codec and input to rtc.
>=20
> Changes since v2:
>=20
>   - Fix interrupt line for ac100_codec in provided example.
>=20
> ---
>  Documentation/devicetree/bindings/mfd/ac100.txt | 49 +++++++++++++++++++=
++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ac100.txt
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/ac100.txt b/Documentat=
ion/devicetree/bindings/mfd/ac100.txt
> new file mode 100644
> index 000000000000..31e6f9cc41bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ac100.txt
> @@ -0,0 +1,49 @@
> +X-Powers AC100 Codec/RTC IC device tree bindings

Nit: Device Tree

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
> +    - #clock-cells: shall be 0

Nit: Shall

> +    - clock-output-names: "4M_adda"
> +    - see clock/clock-bindings.txt for common clock bindings

    - compatible:           "x-powers,ac100-codec"
    - interrupt-parent:	    The parent interrupt controller
    - interrupts: 	    SoC NMI / GPIO interrupt connected to the IRQ_AUDIO =
pin
    - #clock-cells:   	    shall be 0
    - clock-output-names:   "4M_adda"

    - see clock/clock-bindings.txt for common clock bindings

Don't you think these are easier to read when they're separated?

> +  - rtc
> +    - compatible: "x-powers,ac100-rtc"
> +    - interrupt-parent: The parent interrupt controller
> +    - interrupts: SoC NMI / GPIO interrupt connected to the IRQ_RTC pin
> +    - clocks: A phandle to the codec's "4M_adda" clock
> +    - #clock-cells: shall be 1

Nit: Shall

> +    - clock-output-names: "cko1_rtc", "cko2_rtc", "cko3_rtc"
> +    - see clock/clock-bindings.txt for common clock bindings

Same here.

> +Example:
> +
> +ac100: codec@e89 {
> +	compatible =3D "x-powers,ac100";
> +	reg =3D <0xe89>;
> +
> +	ac100_codec: codec {
> +		compatible =3D "x-powers,ac100-codec";
> +		interrupt-parent =3D <&r_pio>;
> +		interrupts =3D <0 9 IRQ_TYPE_LEVEL_LOW>; /* PL9 */
> +		#clock-cells =3D <0>;
> +		clock-output-names =3D "4M_adda";
> +	};
> +
> +	ac100_rtc: rtc {
> +		compatible =3D "x-powers,ac100-rtc";
> +		interrupt-parent =3D <&nmi_intc>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +		clocks =3D <&ac100_codec>;
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
