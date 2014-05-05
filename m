From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCHv3 1/3] dts: socfpga: Add bindings for Altera SoC SDRAM
 controller
Date: Mon, 5 May 2014 16:16:52 -0700
Message-ID: <ba35254f-4ba5-4b2c-8056-cde5c693b0ff@CH1EHSMHS009.ehs.local>
References: <1399330337-16748-1-git-send-email-tthayer@altera.com>
 <1399330337-16748-2-git-send-email-tthayer@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1399330337-16748-2-git-send-email-tthayer@altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tthayer@altera.com
Cc: robherring2@gmail.com, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net, linux@arm.linux.org.uk, dinguyen@altera.com, dougthompson@xmission.com, grant.likely@linaro.org, bp@alien8.de, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com
List-Id: devicetree@vger.kernel.org

Hi Thor,

On Mon, 2014-05-05 at 05:52PM -0500, tthayer@altera.com wrote:
> From: Thor Thayer <tthayer@altera.com>
>=20
> Addition of the Altera SDRAM controller bindings and device
> tree changes to the Altera SoC project. The "syscon" parameter
> is included here because the SDRAM EDAC bits are shared with the SDRA=
M
> configuration bits.
> ---
> v2: Changes to SoC SDRAM EDAC code.
>=20
> V3: Implement code suggestions for SDRAM EDAC code.
>=20
> Signed-off-by: Thor Thayer <tthayer@altera.com>
> ---
>  .../bindings/arm/altera/socfpga-sdram.txt          |   14 ++++++++++=
++++
>  arch/arm/boot/dts/socfpga.dtsi                     |    5 +++++
>  2 files changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/altera/socf=
pga-sdram.txt
>=20
> diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-sdr=
am.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt
> new file mode 100644
> index 0000000..525cb76
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/altera/socfpga-sdram.txt
> @@ -0,0 +1,14 @@
> +Altera SOCFPGA SDRAM Controller
> +
> +Required properties:
> +- compatible : "altr,sdr-ctl", "syscon";
> +                Note that syscon is invoked for this device to suppo=
rt the FPGA
> +		bridge driver, EDAC driver and other devices that share the
> +		registers.

This sounds like implementation specifics, which shouldn't be part of
the bindings.

	S=C3=B6ren
