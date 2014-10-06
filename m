From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v3 1/2] ARM: zynq: Add OCM controller driver
Date: Mon, 6 Oct 2014 09:04:57 -0700
Message-ID: <2819cd94109f4192a6f6d68e90bc7b2c@BL2FFO11FD039.protection.gbl>
References: <e65e39088e0f571ee4905172f2f6c84dbc037805.1412599051.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e65e39088e0f571ee4905172f2f6c84dbc037805.1412599051.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>, monstr@monstr.eu, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Rob Herring <robherring2@gmail.com>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Thierry Reding <treding@nvidia.com>, Andy Gross <agross@codeaurora.org>, Stephen Warren <swarren@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2014-10-06 at 02:38PM +0200, Michal Simek wrote:
> The driver provide memory allocator which can
> be used by others drivers to allocate memory inside OCM.
> All location for 64kB blocks are supported
> and driver is trying to allocate the largest continuous
> block of memory.
>=20
> Checking mpcore addressing filterring is not done here
> but could be added in future.
>=20
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
[...]
> diff --git a/Documentation/devicetree/bindings/arm/zynq/xlnx,zynq-ocm=
c.txt b/Documentation/devicetree/bindings/arm/zynq/xlnx,zynq-ocmc.txt
> new file mode 100644
> index 000000000000..8ddbd1e5ffc1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/zynq/xlnx,zynq-ocmc.txt
> @@ -0,0 +1,17 @@
> +Device tree bindings for Zynq's OCM controller
> +
> +The OCM is divided to 4 64kB segments which can be separately config=
ured
> +to low or high location. Location is controlled via SLCR.
> +
> +Required properties:
> + compatible: Compatibility string. Must be "xlnx,zynq-ocmc-1.0".
> + reg: Specify the base and size of the OCMC registers in the memory =
map.
> +      E.g.: reg =3D <0xf800c000 0x1000>;
> +
> +Example:
> +ocmc: ocmc@f800c000 {

memory-controller@...

> +	compatible =3D  "xlnx,zynq-ocmc-1.0";
> +	interrupt-parent =3D <&intc>;
> +	interrupts =3D <0 3 4>;
> +	reg =3D <0xf800c000 0x1000>;
> +} ;

	S=C3=B6ren
