From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/6] ahci: st: Update the DT example for how to obtain
 the PHY.
Date: Wed, 25 Feb 2015 15:13:40 +0000
Message-ID: <20150225151340.GG5132@x1>
References: <1424871377-1795-1-git-send-email-peter.griffin@linaro.org>
 <1424871377-1795-3-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1424871377-1795-3-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, kishon@ti.com, balbi@ti.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 25 Feb 2015, Peter Griffin wrote:

> The example is wrong in that the phys property should take a
> phandle to the phy port.
>=20
> Also with the changing over to generic PHY type constants we also
> update this as well.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  Documentation/devicetree/bindings/ata/ahci-st.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/Documentation/devicetree/bindings/ata/ahci-st.txt b/Docu=
mentation/devicetree/bindings/ata/ahci-st.txt
> index 0574a77..1331202 100644
> --- a/Documentation/devicetree/bindings/ata/ahci-st.txt
> +++ b/Documentation/devicetree/bindings/ata/ahci-st.txt
> @@ -11,7 +11,7 @@ Required properties:
>   - reset-names	   :   Associated names must be; "pwr-dwn" and "sw-rs=
t"
>   - clocks	   : The phandle for the clock
>   - clock-names	   :   Associated name must be; "ahci_clk"
> - - phys		   : The phandle for the PHY device
> + - phys		   : The phandle for the PHY port
>   - phy-names	   :   Associated name must be; "ahci_phy"
> =20
>  Example:
> @@ -21,7 +21,7 @@ Example:
>  		reg             =3D <0xfe380000 0x1000>;
>  		interrupts      =3D <GIC_SPI 157 IRQ_TYPE_NONE>;
>  		interrupt-names =3D "hostc";
> -		phys	        =3D <&miphy365x_phy MIPHY_PORT_0 MIPHY_TYPE_SATA>;
> +		phys	        =3D <&phy_port0 PHY_TYPE_SATA>;
>  		phy-names       =3D "ahci_phy";
>  		resets	        =3D <&powerdown STIH416_SATA0_POWERDOWN>,
>  				  <&softreset STIH416_SATA0_SOFTRESET>;

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
