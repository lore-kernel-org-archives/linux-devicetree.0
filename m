From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCHv5][ 1/3] DT: Add basic support for imx35-based devices.
Date: Fri, 25 Oct 2013 20:52:13 +0100
Message-ID: <20131025195213.8C67AC404E8@trevor.secretlab.ca>
References: <1382518503-16437-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0185213373233477881=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1382518503-16437-1-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sascha Hauer <kernel@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <rob.herring@calxeda.com>, Denis Carikli <denis@eukrea.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============0185213373233477881==
Content-Type: text/plain

On Wed, 23 Oct 2013 10:55:01 +0200, Denis Carikli <denis@eukrea.com> wrote:
> From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> 
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Eric Bénard <eric@eukrea.com>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> ---
> ChangeLog v3->v4:
> - imx35.dtsi: removed display related nodes because their bindings have been
>   reworked.
> ---
>  .../devicetree/bindings/clock/imx35-clock.txt      |  115 +++++
>  arch/arm/boot/dts/imx35.dtsi                       |  450 ++++++++++++++++++++
>  arch/arm/mach-imx/Kconfig                          |   11 +
>  arch/arm/mach-imx/Makefile                         |    1 +
>  arch/arm/mach-imx/clk-imx35.c                      |   21 +-
>  arch/arm/mach-imx/common.h                         |    1 +
>  arch/arm/mach-imx/imx35-dt.c                       |   48 +++
>  7 files changed, 646 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx35-clock.txt
>  create mode 100644 arch/arm/boot/dts/imx35.dtsi
>  create mode 100644 arch/arm/mach-imx/imx35-dt.c
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx35-clock.txt b/Documentation/devicetree/bindings/clock/imx35-clock.txt
> new file mode 100644
> index 0000000..9f9a60d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/imx35-clock.txt
> @@ -0,0 +1,115 @@
> +* Clock bindings for Freescale i.MX35
> +
> +Required properties:
> +- compatible: Should be "fsl,imx35-ccm"
> +- reg: Address and length of the register set
> +- interrupts: Should contain CCM interrupt
> +- #clock-cells: Should be <1>
> +
> +The clock consumer should specify the desired clock by having the clock
> +ID in its "clocks" phandle cell.  The following is a full list of i.MX35
> +clocks and IDs.
> +
> +	Clock			ID
> +	---------------------------
> +	ckih			0
> +	mpll			1
> +	ppll			2
> +	mpll_075		3
> +	arm			4
> +	hsp			5
> +	hsp_div			6
> +	hsp_sel			7
> +	ahb			8
> +	ipg			9
> +	arm_per_div		10
> +	ahb_per_div		11
> +	ipg_per			12
> +	uart_sel		13
> +	uart_div		14
> +	esdhc_sel		15
> +	esdhc1_div		16
> +	esdhc2_div		17
> +	esdhc3_div		18
> +	spdif_sel		19
> +	spdif_div_pre		20
> +	spdif_div_post		21
> +	ssi_sel			22
> +	ssi1_div_pre		23
> +	ssi1_div_post		24
> +	ssi2_div_pre		25
> +	ssi2_div_post		26
> +	usb_sel			27
> +	usb_div			28
> +	nfc_div			29
> +	asrc_gate		30
> +	pata_gate		31
> +	audmux_gate		32
> +	can1_gate		33
> +	can2_gate		34
> +	cspi1_gate		35
> +	cspi2_gate		36
> +	ect_gate		37
> +	edio_gate		38
> +	emi_gate		39
> +	epit1_gate		40
> +	epit2_gate		41
> +	esai_gate		42
> +	esdhc1_gate		43
> +	esdhc2_gate		44
> +	esdhc3_gate		45
> +	fec_gate		46
> +	gpio1_gate		47
> +	gpio2_gate		48
> +	gpio3_gate		49
> +	gpt_gate		50
> +	i2c1_gate		51
> +	i2c2_gate		52
> +	i2c3_gate		53
> +	iomuxc_gate		54
> +	ipu_gate		55
> +	kpp_gate		56
> +	mlb_gate		57
> +	mshc_gate		58
> +	owire_gate		59
> +	pwm_gate		60
> +	rngc_gate		61
> +	rtc_gate		62
> +	rtic_gate		63
> +	scc_gate		64
> +	sdma_gate		65
> +	spba_gate		66
> +	spdif_gate		67
> +	ssi1_gate		68
> +	ssi2_gate		69
> +	uart1_gate		70
> +	uart2_gate		71
> +	uart3_gate		72
> +	usbotg_gate		73
> +	wdog_gate		74
> +	max_gate		75
> +	admux_gate		76
> +	csi_gate		77
> +	csi_div			78
> +	csi_sel			79
> +	iim_gate		80
> +	gpu2d_gate		81
> +	clk_max			82
> +
> +Examples:
> +
> +clks: ccm@53f80000 {
> +	compatible = "fsl,imx35-ccm";
> +	reg = <0x53f80000 0x4000>;
> +	interrupts = <31>;
> +	#clock-cells = <1>;
> +};
> +
> +esdhc1: esdhc@53fb4000 {
> +	compatible = "fsl,imx35-esdhc";
> +	reg = <0x53fb4000 0x4000>;
> +	interrupts = <7>;
> +	clocks = <&clks 9>, <&clks 8>, <&clks 43>;
> +	clock-names = "ipg", "ahb", "per";
> +	status = "disabled";
> +};

Looks like an entirely reasonable binding to me.

g.



--===============0185213373233477881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0185213373233477881==--
