From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2 2/5] PCI: st: Add Device Tree bindings for sti pcie
Date: Tue, 17 Mar 2015 11:42:14 +0000
Message-ID: <20150317114213.GH27081@e106497-lin.cambridge.arm.com>
References: <1426515635-9466-1-git-send-email-gabriel.fernandez@linaro.org>
 <1426515635-9466-3-git-send-email-gabriel.fernandez@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426515635-9466-3-git-send-email-gabriel.fernandez@linaro.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Gabriel FERNANDEZ <gabriel.fernandez@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Russell King <linux@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Mohit Kumar <mohit.kumar@st.com>, Jingoo Han <jg1.han@samsung.com>, Lucas Stach <l.stach@pengutronix.de>, Fabrice Gasnier <fabrice.gasnier@st.com>, Kishon Vijay Abraham I <kishon@ti.com>, Andrew Morton <akpm@linux-foundation.org>, " David S. Miller" <davem@davemloft.net>, Greg KH <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Joe Perches <joe@perches.com>, Tejun Heo <tj@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <viresh.kumar@li>
List-Id: devicetree@vger.kernel.org

Hi Gabriel,

On Mon, Mar 16, 2015 at 02:20:32PM +0000, Gabriel FERNANDEZ wrote:
> sti pcie is built around a Synopsis Designware PCIe IP.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> ---
>  Documentation/devicetree/bindings/pci/st-pcie.txt | 54 +++++++++++++=
++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st-pcie.txt
>=20
> diff --git a/Documentation/devicetree/bindings/pci/st-pcie.txt b/Docu=
mentation/devicetree/bindings/pci/st-pcie.txt
> new file mode 100644
> index 0000000..94aae2d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/st-pcie.txt
> @@ -0,0 +1,54 @@
> +STMicroelectronics STi PCIe controller
> +
> +This PCIe host controller is based on the Synopsis Designware PCIe I=
P
> +and thus inherits all the common properties defined in designware-pc=
ie.txt.
> +
> +Required properties:
> + - compatible: "st,stih407-pcie"
> + - reg: base address and length of the pcie controller, mem-window a=
ddress
> +   and length available to the controller.
> + - interrupts: A list of interrupt outputs of the controller. Must c=
ontain an
> +   entry for each entry in the interrupt-names property.
> + - interrupt-names: Should be "msi". STi interrupt that is asserted =
when an
> +   MSI is received.
> + - st,syscfg : should be a phandle of the syscfg node. Also contains=
 syscfg
> +   offset for IP configuration.
> + - resets, reset-names: the power-down and soft-reset lines of PCIe =
IP.
> +   Associated names must be "powerdown" and "softreset".
> + - phys, phy-names: the phandle for the PHY device.
> +   Associated name must be "pcie"
> +
> +Optional properties:
> + - reset-gpio: a GPIO spec to define which pin is connected to the b=
us reset.
> +
> +Example:
> +
> +pcie0: pcie@9b00000 {
> +	compatible =3D "st,stih407-pcie", "snps,dw-pcie";
> +	device_type =3D "pci";
> +	reg =3D <0x09b00000 0x4000>,	/* dbi cntrl registers */
> +	      <0x2fff0000 0x00010000>,	/* configuration space */
> +	      <0x40000000 0x80000000>;	/* lmi mem window */
> +	reg-names =3D "dbi", "config", "mem-window";
> +	st,syscfg =3D <&syscfg_core 0xd8 0xe0>;
> +	#address-cells =3D <3>;
> +	#size-cells =3D <2>;
> +	ranges =3D <0x00000800 0 0x2fff0000 0x2fff0000 0 0x00010000   /* co=
nfiguration space */

Unless you are trying to support some legacy code please remove the con=
figuration space from the ranges.
There is no resource type associated with config space and the generic =
parser will give you back an
invalid resource type. The other reason for that is that if you really =
claim to be ECAM compliant by
adding the config space here you need way more than 64K of space.

Best regards,
Liviu

> +		  0x82000000 0 0x20000000 0x20000000 0 0x0FFF0000>; /* non-prefetc=
hable memory */
> +	num-lanes =3D <1>;
> +	interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +	interrupt-names =3D "msi";
> +	#interrupt-cells =3D <1>;
> +	interrupt-map-mask =3D <0 0 0 7>;
> +	interrupt-map =3D <0 0 0 1 &intc GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>, =
/* INT A */
> +			<0 0 0 2 &intc GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>, /* INT B */
> +			<0 0 0 3 &intc GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>, /* INT C */
> +			<0 0 0 4 &intc GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>; /* INT D */
> +
> +	resets =3D <&powerdown STIH407_PCIE0_POWERDOWN>,
> +		 <&softreset STIH407_PCIE0_SOFTRESET>;
> +	reset-names =3D "powerdown",
> +		      "softreset";
> +	phys =3D <&phy_port0 PHY_TYPE_PCIE>;
> +	phy-names =3D "pcie";
> +};
> --=20
> 1.9.1
>=20
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
