From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] usb: host: st-hcd: Add st-hcd devicetree bindings
 documentation.
Date: Fri, 11 Jul 2014 09:24:25 +0100
Message-ID: <20140711082425.GJ11948@lee--X1>
References: <1405005486-26355-1-git-send-email-peter.griffin@linaro.org>
 <1405005486-26355-3-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1405005486-26355-3-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, maxime.coquelin@st.com, patrice.chotard@st.com, gregkh@linuxfoundation.org, srinivas.kandagatla@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 10 Jul 2014, Peter Griffin wrote:

> This patch documents the device tree documentation required for
> the ST HCD controller found in STMicroelectronics SoCs.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/st-hcd.txt | 51 ++++++++++++++=
++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/st-hcd.txt

Just some nits:

> +Example:
> +
> +usb0: usb@fe100000 {
> +	compatible	=3D "st,usb-300x";
> +	reg		=3D <0xfe1ffc00 0x100>,
> +			  <0xfe1ffe00 0x100>;
> +	reg-names	=3D "ohci", "ehci";
> +
> +	interrupts	=3D  <GIC_SPI 148 IRQ_TYPE_NONE>,
> +			   <GIC_SPI 149 IRQ_TYPE_NONE>;
> +	interrupt-names	=3D "ehci","ohci";

s/","/", "

> +	pinctrl-names	=3D "default";
> +	pinctrl-0	=3D <&pinctrl_usb0>;
> +	clocks		=3D <&clk_s_a1_ls CLK_ICN_IF_2>,
> +			  <&clockgen_b0 0>;
> +	clock-names	=3D "ic", "ohci";
> +
> +	resets		=3D <&powerdown STIH416_USB0_POWERDOWN>,
> +			  <&softreset STIH416_USB0_SOFTRESET>;
> +	reset-names	=3D "power", "softreset";
> +
> +	phys =3D <&usb2_phy>;
> +	phy-names =3D "usb2-phy";

Tabbing of the '=3D's not consistent.

> +};
> +
> +

Too many '\n' at EOF.

Nothing controversial here, so once this nits are rectified:

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
