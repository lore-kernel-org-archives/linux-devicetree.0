From: Josh Cartwright <joshc@ni.com>
Subject: Re: [PATCHv2 2/3] ARM: zynq: dt: Updated devicetree for Zynq 7000
 platform.
Date: Sun, 18 Oct 2015 12:53:24 -0500
Message-ID: <20151018175324.GH12756@jcartwri.amer.corp.natinst.com>
References: <1445035350-3569-1-git-send-email-moritz.fischer@ettus.com>
 <1445035350-3569-3-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445035350-3569-3-git-send-email-moritz.fischer@ettus.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: michal.simek@xilinx.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, soren.brinkmann@xilinx.com, linux@arm.linux.org.uk, atull@opensource.altera.com, gregkh@linuxfoundation.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 16, 2015 at 03:42:29PM -0700, Moritz Fischer wrote:
> Added addtional nodes required for FPGA Manager operation
> of the Xilinx Zynq Devc configuration interface.
>=20
> Reviewed-by: S=F6ren Brinkmann <soren.brinkmann@xilinx.com>
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
>=20
> v2: No changes
>=20
> ---
>  arch/arm/boot/dts/zynq-7000.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zyn=
q-7000.dtsi
> index dc0457e..1a5220e 100644
> --- a/arch/arm/boot/dts/zynq-7000.dtsi
> +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> @@ -294,6 +294,11 @@
>  		devcfg: devcfg@f8007000 {
>  			compatible =3D "xlnx,zynq-devcfg-1.0";
>  			reg =3D <0xf8007000 0x100>;
> +			interrupt-parent =3D <&intc>;

You shouldn't need interrupt-parent here.  In fact, I suspect it can be
removed from all sibling nodes as well.

  Josh
