From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v2 2/3] phy: zynqmp: Add dt bindings for ZynqMP PHY.
Date: Wed, 13 Jan 2016 07:31:13 -0800
Message-ID: <20160113153113.GL6491@xsjsorenbubuntu>
References: <1452694404-1253-1-git-send-email-sbhatta@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452694404-1253-1-git-send-email-sbhatta@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta@xilinx.com>
Cc: kishon@ti.com, robh@kernel.org, balbi@ti.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2016-01-13 at 07:43PM +0530, Subbaraya Sundeep Bhatta wrote:
> This patch adds the document describing dt bindings for ZynqMP
> PHY. ZynqMP SOC has a High Speed Processing System Gigabit
> Transceiver which provides PHY capabilties to USB, SATA,
> PCIE, Display Port and Ehernet SGMII controllers.
>=20
> Signed-off-by: Subbaraya Sundeep Bhatta <sbhatta@xilinx.com>

I missed the v2 hence again.

> ---
>  v2:
> 	modified to use phy cells as 2.
>=20
>  .../devicetree/bindings/phy/phy-zynqmp.txt         | 103 +++++++++++=
++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-zynqmp.=
txt
>=20
> diff --git a/Documentation/devicetree/bindings/phy/phy-zynqmp.txt b/D=
ocumentation/devicetree/bindings/phy/phy-zynqmp.txt
> new file mode 100644
> index 0000000..975cf21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-zynqmp.txt
> @@ -0,0 +1,103 @@
> +Xilinx ZynqMP PHY binding
> +
> +This binding describes a ZynqMP PHY device that is used to control Z=
ynqMP
> +High Speed Gigabit Transceiver(GT). ZynqMP PS GTR provides four lane=
s
> +and are used by USB, SATA, PCIE, Display port and Ethernet SGMMI con=
trollers.
> +
> +Required properties (controller (parent) node):
> +- compatible    : Should be "xlnx,zynqmp-psgtr"
> +
> +- reg		: Address and length of register sets for each device in
> +		  "reg-names"
> +- reg-names     : The names of the register addresses corresponding =
to the
> +		  registers filled in "reg":
> +			- serdes: SERDES block register set
> +			- siou: SIOU block register set
> +			- lpd: Low power domain peripherals reset control
> +			- fpd: Full power domain peripherals reset control

The reset registers should not be directly modified by Linux. Any acces=
s
to resets is likely requiring a reset controller that uses platform FW
to modify the resets.
> +
> +-xlnx,tx_termination_fix: Include fix for a functional issue in the =
GT. The TX
> +			  termination resistance can be out of spec due to a
> +			  bug in the calibration logic. This issue will be fixed
> +			  in silicon in future versions.

The silicon version is run-time detectable. There should be a way to ge=
t
away without this property.

	S=C3=B6ren
