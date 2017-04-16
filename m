From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH v4 1/2] dt-bindings: Document the STM32 QSPI bindings
Date: Sun, 16 Apr 2017 18:53:06 +0200
Message-ID: <b62272c9-027c-9c9b-42f0-1056d88aac7c@wedev4u.fr>
References: <1492103757-22375-1-git-send-email-ludovic.Barre@st.com>
 <1492103757-22375-2-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <1492103757-22375-2-git-send-email-ludovic.Barre@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Ludovic Barre <ludovic.Barre@st.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: devicetree@vger.kernel.org

Hi all,

Rob, is this version ok for you? If so, I can take it into the
github/spi-nor tree.

Best regards,

Cyrille

Le 13/04/2017 =E0 19:15, Ludovic Barre a =E9crit :
> From: Ludovic Barre <ludovic.barre@st.com>
> =

> This patch adds documentation of device tree bindings for the STM32
> QSPI controller.
> =

> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  .../devicetree/bindings/mtd/stm32-quadspi.txt      | 43 ++++++++++++++++=
++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.t=
xt
> =

> diff --git a/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt b/Do=
cumentation/devicetree/bindings/mtd/stm32-quadspi.txt
> new file mode 100644
> index 0000000..ddd18c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
> @@ -0,0 +1,43 @@
> +* STMicroelectronics Quad Serial Peripheral Interface(QuadSPI)
> +
> +Required properties:
> +- compatible: should be "st,stm32f469-qspi"
> +- reg: the first contains the register location and length.
> +       the second contains the memory mapping address and length
> +- reg-names: should contain the reg names "qspi" "qspi_mm"
> +- interrupts: should contain the interrupt for the device
> +- clocks: the phandle of the clock needed by the QSPI controller
> +- A pinctrl must be defined to set pins in mode of operation for QSPI tr=
ansfer
> +
> +Optional properties:
> +- resets: must contain the phandle to the reset controller.
> +
> +A spi flash must be a child of the nor_flash node and could have some
> +properties. Also see jedec,spi-nor.txt.
> +
> +Required properties:
> +- reg: chip-Select number (QSPI controller may connect 2 nor flashes)
> +- spi-max-frequency: max frequency of spi bus
> +
> +Optional property:
> +- spi-rx-bus-width: see ../spi/spi-bus.txt for the description
> +
> +Example:
> +
> +qspi: spi@a0001000 {
> +	compatible =3D "st,stm32f469-qspi";
> +	reg =3D <0xa0001000 0x1000>, <0x90000000 0x10000000>;
> +	reg-names =3D "qspi", "qspi_mm";
> +	interrupts =3D <91>;
> +	resets =3D <&rcc STM32F4_AHB3_RESET(QSPI)>;
> +	clocks =3D <&rcc 0 STM32F4_AHB3_CLOCK(QSPI)>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_qspi0>;
> +
> +	flash@0 {
> +		reg =3D <0>;
> +		spi-rx-bus-width =3D <4>;
> +		spi-max-frequency =3D <108000000>;
> +		...
> +	};
> +};
> =



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
