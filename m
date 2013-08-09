Return-Path: <devicetree-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:37356 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031614Ab3HIXfi convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 9 Aug 2013 19:35:38 -0400
Subject: Re: [PATCH 1/2] DT: Add documentation for spi-rt2880
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
From: Kumar Gala <galak@codeaurora.org>
In-Reply-To: <1376074288-29302-1-git-send-email-blogic@openwrt.org>
Date: Fri, 9 Aug 2013 18:35:33 -0500
Content-Transfer-Encoding: 8BIT
Message-Id: <45FBC491-AAAE-4001-8AAB-160D38F29E52@codeaurora.org>
References: <1376074288-29302-1-git-send-email-blogic@openwrt.org>
Sender: devicetree-owner@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, linux-mips@linux-mips.org
List-ID: <devicetree@vger.kernel.org>


On Aug 9, 2013, at 1:51 PM, John Crispin wrote:

> Describe the SPI master found on the MIPS based Ralink SoC.

Ralink RT2880 SoC

> 
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-mips@linux-mips.org
> ---
> .../devicetree/bindings/spi/spi-rt2880.txt         |   26 ++++++++++++++++++++
> 1 file changed, 26 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/spi/spi-rt2880.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-rt2880.txt b/Documentation/devicetree/bindings/spi/spi-rt2880.txt
> new file mode 100644
> index 0000000..d946626
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-rt2880.txt
> @@ -0,0 +1,26 @@
> +Ralink SoC RT2880 and famile SPI master controller.

famile? was that suppose to be family?

> +
> +Required properties:
> +- compatible : "ralink,rt2880-spi"
> +- reg : The register base for the controller.
> +- #address-cells : <1>, as required by generic SPI binding.
> +- #size-cells : <0>, also as required by generic SPI binding.
> +
> +Child nodes as per the generic SPI binding.
> +
> +Example:
> +
> +	spi@b00 {
> +		compatible = "ralink,rt2880-spi";
> +		reg = <0xb00 0x100>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		m25p80@0 {
> +			compatible = "m25p80";
> +			reg = <0>;
> +			spi-max-frequency = <10000000>;
> +		};
> +	};
> +
> -- 
> 1.7.10.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

